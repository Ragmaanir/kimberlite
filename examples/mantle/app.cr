require "lib_glfw"
require "../../src/kimberlite/mantle"
require "../../src/kimberlite/mantle/pipeline"

class App
  include Kimberlite

  def self.call
    a = new
    a.run
    a.destroy
  end

  getter! instance : Vulkan::Instance
  getter! physical_device : Vulkan::PhysicalDevice
  getter! device : Vulkan::Device
  getter! debug_callback_handle : Vulkan::DebugUtilsMessengerExt

  getter! graphics_queue : Vulkan::Queue
  getter! present_queue : Vulkan::Queue

  getter! surface : Vulkan::SurfaceKhr
  getter! window : Pointer(LibGLFW::Window)

  getter swapchain_support : Mantle::SwapChainSupport = Mantle::SwapChainSupport.new
  getter! swapchain : Mantle::Swapchain

  getter framebuffers : Array(Vulkan::Framebuffer) = [] of Vulkan::Framebuffer

  getter! vertex_shader : Vulkan::ShaderModule
  getter! fragment_shader : Vulkan::ShaderModule

  getter! pipeline : Mantle::Pipeline

  getter render_pass : Vulkan::RenderPass = nil.as(Vulkan::RenderPass)

  getter command_pool : Vulkan::CommandPool = nil.as(Vulkan::CommandPool)
  getter command_buffers : Array(Vulkan::CommandBuffer) = [] of Vulkan::CommandBuffer

  getter! image_available_semaphore : Vulkan::Semaphore
  getter! render_finished_semaphore : Vulkan::Semaphore

  def initialize
    LibGLFW.init

    puts "Extensions:"
    Mantle.enumerate_extensions.each do |ext|
      puts ext.extension_name.map(&.unsafe_chr).join
    end

    puts "Layers:"
    Mantle.enumerate_instance_layers.each do |layer|
      puts layer.layer_name.map(&.unsafe_chr).join
    end

    glfw_req_count : UInt32 = 0
    glfw_req = LibGLFW.get_required_instance_extensions(pointerof(glfw_req_count))

    extensions = ["VK_EXT_debug_utils"]

    glfw_req_count.times do |i|
      extensions << String.new(glfw_req[i])
    end

    layers = ["VK_LAYER_LUNARG_standard_validation"]

    @instance = Mantle.create_instance("App", "Engine", extensions, layers)

    # -------------------- debug callback

    debug_callback = ->(severity : Vulkan::DebugUtilsMessageSeverityFlagBitsExt, _type : Vulkan::DebugUtilsMessageTypeFlagsExt, data : Vulkan::DebugUtilsMessengerCallbackDataExt*, _user_data : Void*) {
      puts "#{severity}: #{String.new(data.value.p_message)}"

      0_u32
    }

    @debug_callback_handle = Mantle.register_debug_callback(instance, self, debug_callback)

    # -------------------- glfw window
    LibGLFW.window_hint(LibGLFW::CLIENT_API, LibGLFW::NO_API)
    @window = LibGLFW.create_window(800, 600, "vk".to_unsafe, nil, nil)

    glfw_inst = Pointer(LibGLFW::VkInstance).new(instance.address)
    glfw_surf = Pointer(LibGLFW::VkSurfaceKHR).new(pointerof(@surface).address)

    LibGLFW.create_window_surface(glfw_inst, window, nil, glfw_surf)

    # -------------------- enumerate devices, properties
    devices = Mantle.enumerate_physical_devices(instance)

    puts "Physical Devices: #{devices.size}"

    @physical_device = devices.first

    print_physical_device_properties(physical_device)

    # -------------------- create logical device

    idx = Mantle.get_single_graphics_queue_index(physical_device, surface)
    @device, queue_hash = Mantle.create_logical_device(physical_device, {idx => [1.0_f32]}, ["VK_KHR_swapchain"], ["VK_LAYER_LUNARG_standard_validation"])

    @graphics_queue = queue_hash[idx].first
    @present_queue = graphics_queue

    @swapchain_support = Mantle.get_swapchain_support_details(physical_device, surface)

    format = Mantle.select_standard_swap_surface_format(swapchain_support.formats)

    puts "Swap Surface Fromat: #{format}"
    puts "Present modes: #{swapchain_support.present_modes}"

    caps = swapchain_support.capabilities

    extent = if caps.current_extent.width != UInt32::MAX
               caps.current_extent
             else
               ext = Vulkan::Extent2D.new
               ext.width = 800
               ext.height = 600

               ext.width = [caps.min_image_extent.width, [caps.max_image_extent.width, ext.width].min].max
               ext.height = [caps.min_image_extent.height, [caps.max_image_extent.height, ext.height].min].max

               ext
             end

    puts "Extent: #{extent}"

    mode = swapchain_support.present_modes.first
    @swapchain = Mantle::Swapchain.standard_swapchain(device, physical_device, surface, format, extent, mode)

    create_render_pass

    @vertex_shader = Mantle.create_shader_module(device, File.read("./examples/basic/vert.spv"))
    @fragment_shader = Mantle.create_shader_module(device, File.read("./examples/basic/frag.spv"))

    shader_usages = [
      Mantle::Pipeline::ShaderUsage.new(vertex_shader, "main", Mantle::Pipeline::ShaderStage::Vertex),
      Mantle::Pipeline::ShaderUsage.new(fragment_shader, "main", Mantle::Pipeline::ShaderStage::Fragment),
    ]

    @pipeline = Mantle::Pipeline.new(device, swapchain.extent, render_pass, shader_usages)

    @framebuffers = swapchain.views.map do |view|
      attachments = [view]

      fb_info = Vulkan::FramebufferCreateInfo.new
      fb_info.s_type = Vulkan::StructureType::VkStructureTypeFramebufferCreateInfo
      fb_info.render_pass = render_pass
      fb_info.attachment_count = 1
      fb_info.p_attachments = attachments
      fb_info.width = swapchain.extent.width
      fb_info.height = swapchain.extent.height
      fb_info.layers = 1

      fb = nil.as(Vulkan::Framebuffer)

      res = Vulkan.create_framebuffer(device, pointerof(fb_info), nil, pointerof(fb))

      Mantle.assert_success(res)

      fb
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
      pass_begin.render_area.extent = swapchain.extent

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
    Vulkan.acquire_next_image_khr(device, swapchain.object, UInt64::MAX, image_available_semaphore, nil, pointerof(image_index))

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

    swapchains = [swapchain.object] of Vulkan::SwapchainKhr

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
    color_att.format = swapchain.format
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

    Vulkan.destroy_shader_module(device, vertex_shader, nil)
    Vulkan.destroy_shader_module(device, fragment_shader, nil)

    pipeline.destroy

    Vulkan.destroy_render_pass(device, render_pass, nil)

    swapchain.destroy

    Vulkan.destroy_surface_khr(instance, surface, nil)
    Vulkan.destroy_device(device, nil)

    Mantle.destroy_debug_utils_messenger_ext(
      instance,
      instance,
      debug_callback_handle,
      nil.as(Vulkan::AllocationCallbacks*)
    )

    Vulkan.destroy_instance(instance, nil)
  end
end

App.call
