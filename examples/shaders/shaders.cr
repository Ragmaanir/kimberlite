require "lib_glfw"
require "../../src/kimberlite/libvulkan"
require "./pipeline"

class App
  def self.call
    a = new
    a.run
    a.destroy
  end

  getter instance : Vulkan::Instance = nil.as(Vulkan::Instance)
  getter physical_device : Vulkan::PhysicalDevice = nil.as(Vulkan::PhysicalDevice)
  getter device : Vulkan::Device = nil.as(Vulkan::Device)

  getter graphics_queue : Vulkan::Queue = nil.as(Vulkan::Queue)
  getter present_queue : Vulkan::Queue = nil.as(Vulkan::Queue)

  getter surface : Vulkan::SurfaceKhr = nil.as(Vulkan::SurfaceKhr)
  getter window : Pointer(LibGLFW::Window) = nil.as(LibGLFW::Window*)

  getter swapchain_support : Mantle::SwapChainSupport = Mantle::SwapChainSupport.new
  getter swapchain : Vulkan::SwapchainKhr = nil.as(Vulkan::SwapchainKhr)
  getter swapchain_images : Array(Vulkan::Image) = [] of Vulkan::Image
  getter swapchain_image_views : Array(Vulkan::ImageView) = [] of Vulkan::ImageView
  getter swapchain_image_format : Vulkan::Format = Vulkan::Format::VkFormatUndefined
  getter! swapchain_extent : Vulkan::Extent2D
  getter framebuffers : Array(Vulkan::Framebuffer) = [] of Vulkan::Framebuffer

  getter! pipeline : Pipeline

  getter render_pass : Vulkan::RenderPass = nil.as(Vulkan::RenderPass)

  getter command_pool : Vulkan::CommandPool = nil.as(Vulkan::CommandPool)
  getter command_buffers : Array(Vulkan::CommandBuffer) = [] of Vulkan::CommandBuffer

  getter image_available_semaphore : Vulkan::Semaphore = nil.as(Vulkan::Semaphore)
  getter render_finished_semaphore : Vulkan::Semaphore = nil.as(Vulkan::Semaphore)

  def version(major : Int32, minor : Int32, patch : Int32)
    (major << 22) | (minor << 12) | patch
  end

  def initialize
    LibGLFW.init

    puts "Extensions:"
    enumerate_extensions.each do |ext|
      puts ext.extension_name.map(&.unsafe_chr).join
    end

    puts "Layers:"
    enumerate_instance_layers.each do |layer|
      puts layer.layer_name.map(&.unsafe_chr).join
    end

    # -------------------- create instance
    app_info = Vulkan::ApplicationInfo.new
    app_info.s_type = Vulkan::StructureType::VkStructureTypeApplicationInfo
    app_info.p_application_name = "Hello Triangle".to_unsafe
    app_info.application_version = version(1, 0, 0)
    app_info.p_engine_name = "No Engine".to_unsafe
    app_info.engine_version = version(1, 0, 0)
    app_info.api_version = version(1, 0, 0)

    create_info = Vulkan::InstanceCreateInfo.new
    create_info.s_type = Vulkan::StructureType::VkStructureTypeInstanceCreateInfo
    create_info.p_application_info = pointerof(app_info)

    exts = ["VK_EXT_debug_utils".to_unsafe]

    glfw_req_count : UInt32 = 0
    glfw_req = LibGLFW.get_required_instance_extensions(pointerof(glfw_req_count))

    puts "Required extensions by GLFW:"
    glfw_req_count.times do |i|
      puts "- #{String.new(glfw_req[i])}"

      exts << glfw_req[i]
    end

    create_info.enabled_extension_count = exts.size
    create_info.pp_enabled_extension_names = exts.to_unsafe

    create_info.enabled_layer_count = 1
    create_info.pp_enabled_layer_names = ["VK_LAYER_LUNARG_standard_validation".to_unsafe].to_unsafe

    result = Vulkan.create_instance(pointerof(create_info), nil, pointerof(@instance))

    if result != Vulkan::Result::VkSuccess
      raise "Create instance failed"
    end

    # -------------------- debug callback
    register_debug_callback

    # -------------------- glfw window
    LibGLFW.window_hint(LibGLFW::CLIENT_API, LibGLFW::NO_API)
    @window = LibGLFW.create_window(800, 600, "vk".to_unsafe, nil, nil)

    glfw_inst = Pointer(LibGLFW::VkInstance).new(instance.address)
    glfw_surf = Pointer(LibGLFW::VkSurfaceKHR).new(pointerof(@surface).address)

    LibGLFW.create_window_surface(glfw_inst, window, nil, glfw_surf)

    # -------------------- enumerate devices, properties
    devices = enumerate_physical_devices

    puts "Physical Devices: #{devices.size}"

    @physical_device = devices.first

    print_physical_device_properties(physical_device)

    # -------------------- create logical device
    create_logical_device

    query_swapchain_support_details

    format = select_swap_surface_format(swapchain_support.formats)

    @swapchain_image_format = format.format

    puts "Swap Surface Fromat: #{format}"
    puts "Present modes: #{swapchain_support.present_modes}"

    caps = swapchain_support.capabilities

    @swapchain_extent = if caps.current_extent.width != UInt32::MAX
                          caps.current_extent
                        else
                          ext = Vulkan::Extent2D.new
                          ext.width = 800
                          ext.height = 600

                          ext.width = [caps.min_image_extent.width, [caps.max_image_extent.width, ext.width].min].max
                          ext.height = [caps.min_image_extent.height, [caps.max_image_extent.height, ext.height].min].max

                          ext
                        end

    puts "Extent: #{swapchain_extent}"

    create_swapchain(format, swapchain_extent, swapchain_support.present_modes.first)

    image_count = 0_u32
    Vulkan.get_swapchain_images_khr(device, swapchain, pointerof(image_count), nil)
    @swapchain_images = Array(Vulkan::Image).new(image_count) { nil.as(Vulkan::Image) }
    Vulkan.get_swapchain_images_khr(device, swapchain, pointerof(image_count), swapchain_images.to_unsafe)

    @swapchain_image_views = Array(Vulkan::ImageView).new(image_count) { nil.as(Vulkan::ImageView) }

    swapchain_images.each_with_index do |image, i|
      info = Vulkan::ImageViewCreateInfo.new
      info.s_type = Vulkan::StructureType::VkStructureTypeImageViewCreateInfo
      info.image = image
      info.view_type = Vulkan::ImageViewType::VkImageViewType2D
      info.format = format.format
      info.components.r = Vulkan::ComponentSwizzle::VkComponentSwizzleIdentity
      info.components.g = Vulkan::ComponentSwizzle::VkComponentSwizzleIdentity
      info.components.b = Vulkan::ComponentSwizzle::VkComponentSwizzleIdentity
      info.components.a = Vulkan::ComponentSwizzle::VkComponentSwizzleIdentity
      info.subresource_range.aspect_mask = Vulkan::ImageAspectFlagBits::VkImageAspectColorBit
      info.subresource_range.base_mip_level = 0
      info.subresource_range.level_count = 1
      info.subresource_range.base_array_layer = 0
      info.subresource_range.layer_count = 1

      view = nil.as(Vulkan::ImageView)

      if Vulkan.create_image_view(device, pointerof(info), nil, pointerof(view)) != Vulkan::Result::VkSuccess
        raise("failed to create image views")
      end

      swapchain_image_views[i] = view
    end

    create_render_pass

    @pipeline = Pipeline.new(device, swapchain_extent, render_pass)

    @framebuffers = Array(Vulkan::Framebuffer).new(swapchain_image_views.size) { nil.as(Vulkan::Framebuffer) }

    swapchain_image_views.each_with_index do |view, i|
      attachments = [view]

      fb_info = Vulkan::FramebufferCreateInfo.new
      fb_info.s_type = Vulkan::StructureType::VkStructureTypeFramebufferCreateInfo
      fb_info.render_pass = render_pass
      fb_info.attachment_count = 1
      fb_info.p_attachments = attachments
      fb_info.width = swapchain_extent.width
      fb_info.height = swapchain_extent.height
      fb_info.layers = 1

      fb = nil.as(Vulkan::Framebuffer)

      if Vulkan.create_framebuffer(device, pointerof(fb_info), nil, pointerof(fb)) != Vulkan::Result::VkSuccess
        raise("failed to create framebuffer")
      end

      framebuffers[i] = fb
    end

    # -------------------- rendering setup

    pool_info = Vulkan::CommandPoolCreateInfo.new
    pool_info.s_type = Vulkan::StructureType::VkStructureTypeCommandPoolCreateInfo
    pool_info.queue_family_index = 0 # FIXME graphics_family_idx
    pool_info.flags = 0

    if Vulkan.create_command_pool(device, pointerof(pool_info), nil, pointerof(@command_pool)) != Vulkan::Result::VkSuccess
      raise("failed to create command pool")
    end

    @command_buffers = Array(Vulkan::CommandBuffer).new(framebuffers.size) { nil.as(Vulkan::CommandBuffer) }

    alloc_info = Vulkan::CommandBufferAllocateInfo.new

    alloc_info.s_type = Vulkan::StructureType::VkStructureTypeCommandBufferAllocateInfo
    alloc_info.command_pool = command_pool
    alloc_info.level = Vulkan::CommandBufferLevel::VkCommandBufferLevelPrimary
    alloc_info.command_buffer_count = command_buffers.size

    if Vulkan.allocate_command_buffers(device, pointerof(alloc_info), command_buffers.to_unsafe) != Vulkan::Result::VkSuccess
      raise("failed to allocate command buffers")
    end

    command_buffers.each_with_index do |buf, i|
      begin_info = Vulkan::CommandBufferBeginInfo.new
      begin_info.s_type = Vulkan::StructureType::VkStructureTypeCommandBufferBeginInfo
      begin_info.flags = Vulkan::CommandBufferUsageFlagBits::VkCommandBufferUsageSimultaneousUseBit
      begin_info.p_inheritance_info = nil

      if Vulkan.begin_command_buffer(buf, pointerof(begin_info)) != Vulkan::Result::VkSuccess
        raise("failed to begin recording command buffer")
      end

      offset = Vulkan::Offset2D.new

      pass_begin = Vulkan::RenderPassBeginInfo.new
      pass_begin.s_type = Vulkan::StructureType::VkStructureTypeRenderPassBeginInfo
      pass_begin.render_pass = render_pass
      pass_begin.framebuffer = framebuffers[i]
      pass_begin.render_area.offset = offset
      pass_begin.render_area.extent = swapchain_extent

      color = Vulkan::ClearValue.new
      # color.r = 0.0_f32
      # color.g = 0.0_f32
      # color.b = 0.0_f32
      # color.a = 1.0_f32

      pass_begin.clear_value_count = 1
      pass_begin.p_clear_values = pointerof(color)

      Vulkan.cmd_begin_render_pass(buf, pointerof(pass_begin), Vulkan::SubpassContents::VkSubpassContentsInline)

      Vulkan.cmd_bind_pipeline(buf, Vulkan::PipelineBindPoint::VkPipelineBindPointGraphics, pipeline.pipeline)

      Vulkan.cmd_draw(buf, 3, 1, 0, 0)

      Vulkan.cmd_end_render_pass(buf)

      if Vulkan.end_command_buffer(buf) != Vulkan::Result::VkSuccess
        raise("failed to record command buffer")
      end
    end

    @image_available_semaphore = create_semaphore
    @render_finished_semaphore = create_semaphore
  end

  def run
    while LibGLFW.window_should_close(window) == 0
      LibGLFW.poll_events
      draw_frame
    end

    Vulkan.device_wait_idle(device)
  end

  def draw_frame
    image_index = 0_u32
    Vulkan.acquire_next_image_khr(device, swapchain, UInt64::MAX, image_available_semaphore, nil, pointerof(image_index))

    submit_info = Vulkan::SubmitInfo.new
    submit_info.s_type = Vulkan::StructureType::VkStructureTypeSubmitInfo

    wait_semaphores = [image_available_semaphore] of Vulkan::Semaphore

    wait_stages = [Vulkan::PipelineStageFlagBits::VkPipelineStageColorAttachmentOutputBit.to_u32] of Vulkan::PipelineStageFlags

    submit_info.wait_semaphore_count = 1
    submit_info.p_wait_semaphores = wait_semaphores.to_unsafe
    submit_info.p_wait_dst_stage_mask = wait_stages.to_unsafe

    submit_info.command_buffer_count = 1
    cmd_buf = command_buffers[image_index]
    submit_info.p_command_buffers = pointerof(cmd_buf)

    signal_semaphores = [render_finished_semaphore] of Vulkan::Semaphore
    submit_info.signal_semaphore_count = 1
    submit_info.p_signal_semaphores = signal_semaphores

    if Vulkan.queue_submit(graphics_queue, 1, pointerof(submit_info), nil) != Vulkan::Result::VkSuccess
      raise("failed to submit draw command buffer")
    end

    present_info = Vulkan::PresentInfoKhr.new
    present_info.s_type = Vulkan::StructureType::VkStructureTypePresentInfoKhr

    present_info.wait_semaphore_count = 1
    present_info.p_wait_semaphores = signal_semaphores.to_unsafe

    swapchains = [swapchain] of Vulkan::SwapchainKhr

    present_info.swapchain_count = 1
    present_info.p_swapchains = swapchains
    present_info.p_image_indices = pointerof(image_index)
    present_info.p_results = nil

    Vulkan.queue_present_khr(present_queue, pointerof(present_info))

    Vulkan.queue_wait_idle(present_queue)
  end

  def create_render_pass
    dependency = Vulkan::SubpassDependency.new
    dependency.src_subpass = ~0 # FIXME: VK_SUBPASS_EXTERNAL
    dependency.dst_subpass = 0
    dependency.src_stage_mask = Vulkan::PipelineStageFlagBits::VkPipelineStageColorAttachmentOutputBit
    dependency.src_access_mask = 0
    dependency.dst_stage_mask = Vulkan::PipelineStageFlagBits::VkPipelineStageColorAttachmentOutputBit
    dependency.dst_access_mask = Vulkan::AccessFlagBits::VkAccessColorAttachmentReadBit | Vulkan::AccessFlagBits::VkAccessColorAttachmentWriteBit

    color_att = Vulkan::AttachmentDescription.new
    color_att.format = swapchain_image_format
    color_att.samples = Vulkan::SampleCountFlagBits::VkSampleCount1Bit
    color_att.load_op = Vulkan::AttachmentLoadOp::VkAttachmentLoadOpClear
    color_att.store_op = Vulkan::AttachmentStoreOp::VkAttachmentStoreOpStore
    color_att.stencil_load_op = Vulkan::AttachmentLoadOp::VkAttachmentLoadOpDontCare
    color_att.stencil_store_op = Vulkan::AttachmentStoreOp::VkAttachmentStoreOpDontCare
    color_att.initial_layout = Vulkan::ImageLayout::VkImageLayoutUndefined
    color_att.final_layout = Vulkan::ImageLayout::VkImageLayoutPresentSrcKhr

    color_att_ref = Vulkan::AttachmentReference.new
    color_att_ref.attachment = 0
    color_att_ref.layout = Vulkan::ImageLayout::VkImageLayoutColorAttachmentOptimal

    subpass = Vulkan::SubpassDescription.new
    subpass.pipeline_bind_point = Vulkan::PipelineBindPoint::VkPipelineBindPointGraphics
    subpass.color_attachment_count = 1
    subpass.p_color_attachments = pointerof(color_att_ref)

    pass_info = Vulkan::RenderPassCreateInfo.new
    pass_info.s_type = Vulkan::StructureType::VkStructureTypeRenderPassCreateInfo
    pass_info.attachment_count = 1
    pass_info.p_attachments = pointerof(color_att)
    pass_info.subpass_count = 1
    pass_info.p_subpasses = pointerof(subpass)
    pass_info.dependency_count = 1
    pass_info.p_dependencies = pointerof(dependency)

    if Vulkan.create_render_pass(device, pointerof(pass_info), nil, pointerof(@render_pass)) != Vulkan::Result::VkSuccess
      raise("failed to create render pass")
    end
  end

  def create_swapchain(format, extent, mode)
    info = Vulkan::SwapchainCreateInfoKhr.new
    info.s_type = Vulkan::StructureType::VkStructureTypeSwapchainCreateInfoKhr
    info.surface = surface
    info.min_image_count = 2
    info.image_format = format.format
    info.image_color_space = format.color_space
    info.image_extent = extent
    info.image_array_layers = 1
    info.image_usage = Vulkan::ImageUsageFlagBits::VkImageUsageColorAttachmentBit

    raise "TODO: graphics queue != present queue" if graphics_queue != present_queue

    info.image_sharing_mode = Vulkan::SharingMode::VkSharingModeExclusive
    info.queue_family_index_count = 0
    info.p_queue_family_indices = nil

    info.pre_transform = swapchain_support.capabilities.current_transform
    info.composite_alpha = Vulkan::CompositeAlphaFlagBitsKhr::VkCompositeAlphaOpaqueBitKhr
    info.present_mode = mode
    info.clipped = 1
    info.old_swapchain = nil

    if Vulkan.create_swapchain_khr(device, pointerof(info), nil, pointerof(@swapchain)) != Vulkan::Result::VkSuccess
      raise("failed to create swap chain!")
    end
  end

  def create_semaphore
    sem = nil.as(Vulkan::Semaphore)

    info = Vulkan::SemaphoreCreateInfo.new
    info.s_type = Vulkan::StructureType::VkStructureTypeSemaphoreCreateInfo

    if Vulkan.create_semaphore(device, pointerof(info), nil, pointerof(sem)) != Vulkan::Result::VkSuccess
      raise("Semaphore creation failed")
    end

    sem
  end

  def print_physical_device_properties(device : Vulkan::PhysicalDevice)
    props = Vulkan::PhysicalDeviceProperties.new
    features = Vulkan::PhysicalDeviceFeatures.new

    Vulkan.get_physical_device_properties(device, pointerof(props))
    Vulkan.get_physical_device_features(device, pointerof(features))

    puts "Discrete GPU: #{props.device_type == Vulkan::PhysicalDeviceType::VkPhysicalDeviceTypeDiscreteGpu}"
    puts "Geometry Shaders: #{features.geometry_shader}"
  end

  def destroy
    puts "destroying ..."

    Vulkan.destroy_semaphore(device, render_finished_semaphore, nil)
    Vulkan.destroy_semaphore(device, image_available_semaphore, nil)

    Vulkan.destroy_command_pool(device, command_pool, nil)

    framebuffers.each do |fb|
      Vulkan.destroy_framebuffer(device, fb, nil)
    end

    pipeline.destroy

    Vulkan.destroy_render_pass(device, render_pass, nil)

    swapchain_image_views.each do |view|
      Vulkan.destroy_image_view(device, view, nil)
    end

    Vulkan.destroy_swapchain_khr(device, swapchain, nil)
    Vulkan.destroy_surface_khr(instance, surface, nil)
    Vulkan.destroy_device(device, nil)
    destroy_debug_utils_messenger_ext(instance, @debug_callback.pointer.as(Vulkan::DebugUtilsMessengerExt), nil.as(Vulkan::AllocationCallbacks*))
    Vulkan.destroy_instance(instance, nil)
  end

  def create_logical_device
    # ---------- queue families
    families = enumerate_queue_families(physical_device)

    puts "Queue Families: #{families.size}"

    # ---------- graphics family
    graphics_family_idx = families.index do |family|
      family.queue_count > 0 && (family.queue_flags & Vulkan::QueueFlagBits::VkQueueGraphicsBit.to_i)
    end || raise("Graphics Queue not found")

    puts "Graphics Queue Index: #{graphics_family_idx}"

    # ---------- present family
    present_family_idx = nil

    families.each_with_index do |family, i|
      present = 0_u32
      Vulkan.get_physical_device_surface_support_khr(physical_device, i, surface, pointerof(present))

      if family.queue_count > 0 && present
        present_family_idx = i
        break
      end
    end

    present_family_idx = present_family_idx || raise("Present Queue not found")

    # ---------- queue create infos
    queue_infos = [graphics_family_idx, present_family_idx].uniq.map do |queue_idx|
      queue_info = Vulkan::DeviceQueueCreateInfo.new
      queue_info.s_type = Vulkan::StructureType::VkStructureTypeDeviceQueueCreateInfo
      queue_info.queue_family_index = queue_idx
      queue_info.queue_count = 1

      priority = 1.0_f32
      queue_info.p_queue_priorities = pointerof(priority)

      queue_info
    end

    # ---------- logical device info
    features = Vulkan::PhysicalDeviceFeatures.new

    exts = ["VK_KHR_swapchain".to_unsafe]

    info = Vulkan::DeviceCreateInfo.new
    info.s_type = Vulkan::StructureType::VkStructureTypeDeviceCreateInfo

    info.queue_create_info_count = queue_infos.size
    info.p_queue_create_infos = queue_infos.to_unsafe

    info.p_enabled_features = pointerof(features)

    info.enabled_extension_count = exts.size
    info.pp_enabled_extension_names = exts.to_unsafe

    info.enabled_layer_count = 1
    info.pp_enabled_layer_names = ["VK_LAYER_LUNARG_standard_validation".to_unsafe].to_unsafe

    # ---------- create logical device

    if Vulkan.create_device(physical_device, pointerof(info), nil, pointerof(@device)) != Vulkan::Result::VkSuccess
      raise("failed to create logical device!")
    end

    Vulkan.get_device_queue(device, graphics_family_idx.to_u32, 0, pointerof(@graphics_queue))
    Vulkan.get_device_queue(device, present_family_idx.to_u32, 0, pointerof(@present_queue))
  end

  def query_swapchain_support_details
    Vulkan.get_physical_device_surface_capabilities_khr(physical_device, surface, swapchain_support.capabilities_ptr)

    count = 0_u32
    Vulkan.get_physical_device_surface_formats_khr(physical_device, surface, pointerof(count), nil)

    if count != 0
      swapchain_support.formats = Array(Vulkan::SurfaceFormatKhr).new(count) { Vulkan::SurfaceFormatKhr.new }
      Vulkan.get_physical_device_surface_formats_khr(physical_device, surface, pointerof(count), swapchain_support.formats.to_unsafe)
    else
      raise "Swapchain: no formats found"
    end

    count = 0_u32
    Vulkan.get_physical_device_surface_present_modes_khr(physical_device, surface, pointerof(count), nil)

    if count != 0
      swapchain_support.present_modes = Array(Vulkan::PresentModeKhr).new(count) { Vulkan::PresentModeKhr::VkPresentModeImmediateKhr }
      Vulkan.get_physical_device_surface_present_modes_khr(physical_device, surface, pointerof(count), swapchain_support.present_modes.to_unsafe)
    else
      raise "Swapchain: no modes found"
    end
  end

  def select_swap_surface_format(candidates : Array(Vulkan::SurfaceFormatKhr)) : Vulkan::SurfaceFormatKhr
    if candidates.empty?
      raise "No candidates given"
    elsif candidates.size == 1 && candidates[0].format == Vulkan::Format::VkFormatUndefined
      format = Vulkan::SurfaceFormatKhr.new
      format.format = Vulkan::Format::VkFormatB8G8R8A8Unorm
      format.color_space = Vulkan::ColorSpaceKhr::VkColorSpaceSrgbNonlinearKhr
      format
    else
      candidates.find do |c|
        c.format == Vulkan::Format::VkFormatB8G8R8A8Unorm && c.color_space == Vulkan::ColorSpaceKhr::VkColorSpaceSrgbNonlinearKhr
      end || candidates[0]
    end
  end

  def enumerate_extensions
    count = 0_u32

    Vulkan.enumerate_instance_extension_properties(nil, pointerof(count), nil)

    exts = Array(Vulkan::ExtensionProperties).new(count) { Vulkan::ExtensionProperties.new }

    Vulkan.enumerate_instance_extension_properties(nil, pointerof(count), exts.to_unsafe)

    exts
  end

  def enumerate_instance_layers
    count = 0_u32

    Vulkan.enumerate_instance_layer_properties(pointerof(count), nil)

    layers = Array(Vulkan::LayerProperties).new(count) { Vulkan::LayerProperties.new }

    Vulkan.enumerate_instance_layer_properties(pointerof(count), layers.to_unsafe)

    layers
  end

  def enumerate_physical_devices
    count = 0_u32

    Vulkan.enumerate_physical_devices(instance, pointerof(count), nil)

    devices = Array(Vulkan::PhysicalDevice).new(count) { nil.as(Vulkan::PhysicalDevice) }

    Vulkan.enumerate_physical_devices(instance, pointerof(count), devices.to_unsafe)

    devices
  end

  def enumerate_queue_families(device : Vulkan::PhysicalDevice)
    count = 0_u32

    Vulkan.get_physical_device_queue_family_properties(device, pointerof(count), nil)

    families = Array(Vulkan::QueueFamilyProperties).new(count) { Vulkan::QueueFamilyProperties.new }

    Vulkan.get_physical_device_queue_family_properties(device, pointerof(count), families.to_unsafe)

    families
  end

  getter debug_callback : (Vulkan::DebugUtilsMessageSeverityFlagBitsExt, Vulkan::DebugUtilsMessageTypeFlagsExt, Vulkan::DebugUtilsMessengerCallbackDataExt*, Void*) -> UInt32 = ->(severity : Vulkan::DebugUtilsMessageSeverityFlagBitsExt, type : Vulkan::DebugUtilsMessageTypeFlagsExt, data : Vulkan::DebugUtilsMessengerCallbackDataExt*, user_data : Void*) {
    puts "#{severity}: #{String.new(data.value.p_message)}"
    # app = user_data.as(App)

    0_u32
  }

  def register_debug_callback
    info = Vulkan::DebugUtilsMessengerCreateInfoExt.new
    info.s_type = Vulkan::StructureType::VkStructureTypeDebugUtilsMessengerCreateInfoExt
    info.message_severity = Vulkan::DebugUtilsMessageSeverityFlagBitsExt::VkDebugUtilsMessageSeverityVerboseBitExt | Vulkan::DebugUtilsMessageSeverityFlagBitsExt::VkDebugUtilsMessageSeverityWarningBitExt | Vulkan::DebugUtilsMessageSeverityFlagBitsExt::VkDebugUtilsMessageSeverityErrorBitExt
    info.message_type = Vulkan::DebugUtilsMessageTypeFlagBitsExt::VkDebugUtilsMessageTypeGeneralBitExt | Vulkan::DebugUtilsMessageTypeFlagBitsExt::VkDebugUtilsMessageTypeValidationBitExt | Vulkan::DebugUtilsMessageTypeFlagBitsExt::VkDebugUtilsMessageTypePerformanceBitExt
    info.pfn_user_callback = debug_callback

    info.p_user_data = self.as(Void*)

    if (create_debug_utils_messenger_ext(instance, pointerof(info), Pointer(Vulkan::AllocationCallbacks).null, pointerof(@debug_callback).as(Pointer(Vulkan::DebugUtilsMessengerExt))) != Vulkan::Result::VkSuccess)
      raise("failed to set up debug callback!")
    end
  end

  macro define_vulkan_function(meth, name, type)
    def {{meth}}(*args)
      pointer = Vulkan.get_instance_proc_addr(instance, {{name}})
      func = {{type}}.new(pointer.pointer, pointer.closure_data)

      raise "Could not link: #{ {{name}} }" unless func

      func.call(*args)
    end
  end

  define_vulkan_function(create_debug_utils_messenger_ext, "vkCreateDebugUtilsMessengerEXT", Proc(Vulkan::Instance, Vulkan::DebugUtilsMessengerCreateInfoExt*, Vulkan::AllocationCallbacks*, Vulkan::DebugUtilsMessengerExt*, Vulkan::Result))
  define_vulkan_function(destroy_debug_utils_messenger_ext, "vkDestroyDebugUtilsMessengerEXT", Proc(Vulkan::Instance, Vulkan::DebugUtilsMessengerExt, Vulkan::AllocationCallbacks*, Void))
end

App.call
