require "lib_glfw"
require "../../src/kimberlite/mantle"
require "../../src/kimberlite/mantle/swapchain"

class App
  include Kimberlite

  ROOT = "./examples/mantle"

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

  getter! swapchain : Mantle::Swapchain

  getter framebuffers : Array(Vulkan::Framebuffer) = [] of Vulkan::Framebuffer

  getter! vertex_shader : Vulkan::ShaderModule
  getter! fragment_shader : Vulkan::ShaderModule

  getter! pipeline : Vulkan::Pipeline
  getter! pipeline_layout : Vulkan::PipelineLayout

  getter render_pass : Vulkan::RenderPass = nil.as(Vulkan::RenderPass)

  getter command_pool : Vulkan::CommandPool = nil.as(Vulkan::CommandPool)
  getter command_buffers : Array(Vulkan::CommandBuffer) = [] of Vulkan::CommandBuffer

  getter! image_available_semaphore : Vulkan::Semaphore
  getter! render_finished_semaphore : Vulkan::Semaphore

  getter vertex_buffer_memory : Vulkan::DeviceMemory = nil.as(Vulkan::DeviceMemory)
  getter vertex_buffer : Vulkan::Buffer = nil.as(Vulkan::Buffer)

  getter index_buffer_memory : Vulkan::DeviceMemory = nil.as(Vulkan::DeviceMemory)
  getter index_buffer : Vulkan::Buffer = nil.as(Vulkan::Buffer)

  VERTICES = StaticArray[
    -0.5, -0.5, 1.0, 0.0, 0.0,
    0.5, -0.5, 0.0, 1.0, 0.0,
    0.5, 0.5, 0.0, 0.0, 1.0,
    -0.5, 0.5, 1.0, 1.0, 1.0,
  ].map(&.to_f32)

  VERTEX_COUNT = (VERTICES.size / 5).to_u64
  VERTEX_SIZE  = (VERTICES.size / VERTEX_COUNT) * 4_u64 # bytes

  INDICES = [0, 1, 2, 2, 3, 0].map(&.to_u16)

  def initialize
    LibGLFW.init

    glfw_req_count : UInt32 = 0
    glfw_req = LibGLFW.get_required_instance_extensions(pointerof(glfw_req_count))

    extensions = ["VK_EXT_debug_utils"]

    glfw_req_count.times do |i|
      extensions << String.new(glfw_req[i])
    end

    layers = ["VK_LAYER_LUNARG_standard_validation"]

    @instance = Mantle.create_instance(extensions: extensions, layers: layers)

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

    @physical_device = Mantle.enumerate_physical_devices(instance).first
    create_logical_device
    @swapchain = create_swapchain
    @render_pass = create_render_pass
    @vertex_shader, @fragment_shader = create_shaders
    @pipeline, @pipeline_layout = create_pipeline
    @framebuffers = create_framebuffers
    @command_pool = Mantle.create_command_pool(device, 0) # FIXME queue family index

    @vertex_buffer = Mantle.create_vertex_buffer(device, VERTEX_COUNT * VERTEX_SIZE)
    @vertex_buffer_memory = Mantle.allocate_buffer_memory(device, physical_device, vertex_buffer)

    Mantle.copy_memory(
      device,
      vertex_buffer_memory,
      VERTEX_COUNT * VERTEX_SIZE,
      VERTICES.to_unsafe.as(Void*)
    )

    @index_buffer = Mantle.create_index_buffer(device, INDICES.size.to_u64 * 2)
    @index_buffer_memory = Mantle.allocate_buffer_memory(device, physical_device, index_buffer)

    Mantle.copy_memory(
      device,
      index_buffer_memory,
      INDICES.size.to_u64 * 2,
      INDICES.to_unsafe.as(Void*)
    )

    @command_buffers = create_command_buffers

    @image_available_semaphore = Mantle.create_semaphore(device)
    @render_finished_semaphore = Mantle.create_semaphore(device)
  end

  def create_logical_device
    idx = Mantle.get_single_graphics_queue_index(physical_device, surface)
    @device, queue_hash = Mantle.create_logical_device(
      physical_device,
      {idx => [1.0_f32]},
      ["VK_KHR_swapchain"],
      ["VK_LAYER_LUNARG_standard_validation"]
    )

    @graphics_queue = queue_hash[idx].first
    @present_queue = graphics_queue
  end

  record(Vec2, x : Float32, y : Float32)
  record(Vec3, x : Float32, y : Float32, z : Float32)
  record(Vertex, pos : Vec2, color : Vec3)

  def build_vertex_input_description
    desc = Vulkan::VertexInputBindingDescription.new
    desc.binding = 0
    desc.stride = VERTEX_SIZE
    desc.input_rate = Vulkan::VertexInputRate::VkVertexInputRateVertex

    [desc]
  end

  def build_vertex_attribute_desciptions
    atts = [] of Vulkan::VertexInputAttributeDescription

    att = Vulkan::VertexInputAttributeDescription.new
    att.binding = 0
    att.location = 0
    att.format = Vulkan::Format::VkFormatR32G32Sfloat
    att.offset = 0 # offsetof(Vertex, pos)

    atts << att

    att = Vulkan::VertexInputAttributeDescription.new
    att.binding = 0
    att.location = 1
    att.format = Vulkan::Format::VkFormatR32G32B32Sfloat
    att.offset = 2*4 # offsetof(Vertex, color);

    atts << att

    atts
  end

  def create_shaders
    {
      Mantle.create_shader_module(device, File.read("#{ROOT}/vert.spv")),
      Mantle.create_shader_module(device, File.read("#{ROOT}/frag.spv")),
    }
  end

  def create_pipeline
    b = Mantle::PipelineBuilder.new

    b.scissors = [
      Vulkan::Rect2D.new(
        Vulkan::Offset2D.new(0, 0),
        Vulkan::Extent2D.new(swapchain.extent.width, swapchain.extent.height)
      ),
    ]

    b.viewports = [
      Vulkan::Viewport.new(swapchain.extent.width, swapchain.extent.height),
    ]

    b.shader_modules = [
      {Vulkan::ShaderStageFlagBits::VkShaderStageVertexBit, vertex_shader},
      {Vulkan::ShaderStageFlagBits::VkShaderStageFragmentBit, fragment_shader},
    ]

    b.vertex_binding_descriptions = build_vertex_input_description
    b.vertex_attribute_descriptions = build_vertex_attribute_desciptions

    b.attachments = [b.default_color_blend_attachment]

    b.build(device, render_pass)
  end

  def create_framebuffers
    swapchain.views.map do |view|
      attachments = [view]

      fb_info = Vulkan::FramebufferCreateInfo.new
      fb_info.s_type = Vulkan::StructureType::VkStructureTypeFramebufferCreateInfo
      fb_info.render_pass = render_pass
      fb_info.attachment_count = 1
      fb_info.p_attachments = attachments.to_unsafe
      fb_info.width = swapchain.extent.width
      fb_info.height = swapchain.extent.height
      fb_info.layers = 1

      Mantle.create_framebuffer(device, fb_info)
    end
  end

  def create_command_buffers
    buffers = Mantle.allocate_command_buffers(device, command_pool, framebuffers.size)

    buffers.each_with_index do |buf, i|
      Mantle.begin_command_buffer(buf, Vulkan::CommandBufferUsageFlagBits::VkCommandBufferUsageSimultaneousUseBit)

      Mantle.cmd_begin_render_pass(buf, render_pass, framebuffers[i], swapchain.extent)

      Vulkan.cmd_bind_pipeline(buf, Vulkan::PipelineBindPoint::VkPipelineBindPointGraphics, pipeline)

      # Mantle.cmd_bind_vertex_buffers(buf, 1, [vertex_buffer])

      Mantle.cmd_bind_vertex_buffers(buf, 1, [vertex_buffer])

      Vulkan.cmd_bind_index_buffer(buf, index_buffer, 0, Vulkan::IndexType::VkIndexTypeUint16)

      # Vulkan.cmd_draw(buf, VERTEX_COUNT, 1, 0, 0)

      Vulkan.cmd_draw_indexed(buf, INDICES.size, 1, 0, 0, 0)

      Vulkan.cmd_end_render_pass(buf)

      Mantle.end_command_buffer(buf)
    end

    buffers
  end

  def create_swapchain
    swapchain_support = Mantle.get_swapchain_support_details(physical_device, surface)

    format = Mantle.select_standard_swap_surface_format(swapchain_support.formats)

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

    mode = swapchain_support.present_modes.first

    Mantle::Swapchain.standard_swapchain(device, physical_device, surface, format, extent, mode)
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

    Mantle.queue_submit(graphics_queue, [submit_info])

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

    Mantle.create_render_pass(device, pass_info)
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

    Vulkan.destroy_pipeline(device, pipeline, nil)
    Vulkan.destroy_pipeline_layout(device, pipeline_layout, nil)

    Vulkan.destroy_render_pass(device, render_pass, nil)

    swapchain.destroy

    Vulkan.destroy_buffer(device, index_buffer, nil)
    Vulkan.free_memory(device, index_buffer_memory, nil)

    Vulkan.destroy_buffer(device, vertex_buffer, nil)
    Vulkan.free_memory(device, vertex_buffer_memory, nil)

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
