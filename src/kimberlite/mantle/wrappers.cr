module Kimberlite
  module Mantle
    # This module only contains very shallow/simple wrappers
    # that just abstract away the verbosity that comes from the c language.
    module Wrappers
      def extensions_count(layer : String? = nil)
        count = 0_u32

        Vulkan.enumerate_instance_extension_properties(layer.to_unsafe, pointerof(count), nil)

        count
      end

      def enumerate_extensions(layer : String? = nil)
        count = extensions_count(layer)

        exts = Array(Vulkan::ExtensionProperties).new(count) { Vulkan::ExtensionProperties.new }

        Vulkan.enumerate_instance_extension_properties(layer.to_unsafe, pointerof(count), exts.to_unsafe)

        exts
      end

      def instance_layers_count
        count = 0_u32

        Vulkan.enumerate_instance_layer_properties(pointerof(count), nil)

        count
      end

      def enumerate_instance_layers
        count = instance_layers_count

        layers = Array(Vulkan::LayerProperties).new(count) { Vulkan::LayerProperties.new }

        Vulkan.enumerate_instance_layer_properties(pointerof(count), layers.to_unsafe)

        layers
      end

      def physical_device_count(instance : Vulkan::Instance)
        count = 0_u32

        Vulkan.enumerate_physical_devices(instance, pointerof(count), nil)

        count
      end

      def enumerate_physical_devices(instance : Vulkan::Instance)
        count = physical_device_count(instance)

        devices = Array(Vulkan::PhysicalDevice).new(count) { nil.as(Vulkan::PhysicalDevice) }

        Vulkan.enumerate_physical_devices(instance, pointerof(count), devices.to_unsafe)

        devices
      end

      def queue_families_count(device : Vulkan::PhysicalDevice)
        count = 0_u32

        Vulkan.get_physical_device_queue_family_properties(device, pointerof(count), nil)

        count
      end

      def enumerate_queue_families(device : Vulkan::PhysicalDevice)
        count = queue_families_count(device)

        families = Array(Vulkan::QueueFamilyProperties).new(count) { Vulkan::QueueFamilyProperties.new }

        Vulkan.get_physical_device_queue_family_properties(device, pointerof(count), families.to_unsafe)

        families
      end

      def create_instance(create_info : Vulkan::InstanceCreateInfo, allocator : Vulkan::AllocationCallbacks? = nil)
        instance = nil.as(Vulkan::Instance)

        result = Vulkan.create_instance(pointerof(create_info), allocator, pointerof(instance))

        assert_success(result)

        instance
      end

      class SwapChainSupport
        property capabilities : Vulkan::SurfaceCapabilitiesKhr = Vulkan::SurfaceCapabilitiesKhr.new
        property formats : Array(Vulkan::SurfaceFormatKhr) = [] of Vulkan::SurfaceFormatKhr
        property present_modes : Array(Vulkan::PresentModeKhr) = [] of Vulkan::PresentModeKhr

        def capabilities_ptr
          pointerof(@capabilities)
        end
      end

      def get_swapchain_support_details(physical_device : Vulkan::PhysicalDevice, surface : Vulkan::SurfaceKhr) : SwapChainSupport
        support = SwapChainSupport.new

        Vulkan.get_physical_device_surface_capabilities_khr(physical_device, surface, support.capabilities_ptr)

        support.formats = get_physical_device_surface_formats(physical_device, surface)
        support.present_modes = get_physical_device_surface_present_modes(physical_device, surface)

        support
      end

      def get_physical_device_surface_formats(physical_device : Vulkan::PhysicalDevice, surface : Vulkan::SurfaceKhr) : Array(Vulkan::SurfaceFormatKhr)
        count = 0_u32
        Vulkan.get_physical_device_surface_formats_khr(physical_device, surface, pointerof(count), nil)

        if count != 0
          formats = Array(Vulkan::SurfaceFormatKhr).new(count) { Vulkan::SurfaceFormatKhr.new }
          Vulkan.get_physical_device_surface_formats_khr(physical_device, surface, pointerof(count), formats.to_unsafe)
          formats
        else
          [] of Vulkan::SurfaceFormatKhr
        end
      end

      def get_physical_device_surface_present_modes(physical_device : Vulkan::PhysicalDevice, surface : Vulkan::SurfaceKhr) : Array(Vulkan::PresentModeKhr)
        count = 0_u32
        Vulkan.get_physical_device_surface_present_modes_khr(physical_device, surface, pointerof(count), nil)

        if count > 0
          modes = Array(Vulkan::PresentModeKhr).new(count) { Vulkan::PresentModeKhr::VkPresentModeImmediateKhr }
          Vulkan.get_physical_device_surface_present_modes_khr(physical_device, surface, pointerof(count), modes.to_unsafe)
          modes
        else
          [] of Vulkan::PresentModeKhr
        end
      end

      def get_swapchain_images(device : Vulkan::Device, swapchain : Vulkan::SwapchainKhr) : Array(Vulkan::Image)
        image_count = 0_u32
        Vulkan.get_swapchain_images_khr(device, swapchain, pointerof(image_count), nil)

        swapchain_images = Array(Vulkan::Image).new(image_count) { nil.as(Vulkan::Image) }
        Vulkan.get_swapchain_images_khr(device, swapchain, pointerof(image_count), swapchain_images.to_unsafe)

        swapchain_images
      end

      def create_swapchain(device : Vulkan::Device, info : Vulkan::SwapchainCreateInfoKhr) : Vulkan::SwapchainKhr
        swapchain = nil.as(Vulkan::SwapchainKhr)
        result = Vulkan.create_swapchain_khr(device, pointerof(info), nil, pointerof(swapchain))
        assert_success(result)
        swapchain
      end

      def create_image_view(device : Vulkan::Device, info : Vulkan::ImageViewCreateInfo) : Vulkan::ImageView
        view = nil.as(Vulkan::ImageView)

        res = Vulkan.create_image_view(device, pointerof(info), nil, pointerof(view))
        Mantle.assert_success(res)

        view
      end

      def create_shader_module(device : Vulkan::Device, source : String) : Vulkan::ShaderModule
        info = Vulkan::ShaderModuleCreateInfo.new
        info.s_type = Vulkan::StructureType::VkStructureTypeShaderModuleCreateInfo
        info.code_size = source.size
        info.p_code = Pointer(UInt32).new(source.to_unsafe.address)

        mod = nil.as(Vulkan::ShaderModule)

        res = Vulkan.create_shader_module(device, pointerof(info), nil, pointerof(mod))

        assert_success(res)

        mod
      end

      enum ShaderKind
        Vertex,
        Fragment
      end

      ShaderKindMap = {
        ShaderKind::Vertex   => Vulkan::ShaderStageFlagBits::VkShaderStageVertexBit,
        ShaderKind::Fragment => Vulkan::ShaderStageFlagBits::VkShaderStageFragmentBit,
      }

      def create_pipeline_shader_stage_create_info(mod : Vulkan::ShaderModule, kind : ShaderKind, name : String = "main")
        info = Vulkan::PipelineShaderStageCreateInfo.new
        info.s_type = Vulkan::StructureType::VkStructureTypePipelineShaderStageCreateInfo

        info.stage = ShaderKindMap[kind]

        info.module = mod
        info.p_name = name

        info
      end

      def create_pipeline_layout(device : Vulkan::Device, layout_info : Vulkan::PipelineLayoutCreateInfo)
        layout = nil.as(Vulkan::PipelineLayout)

        res = Vulkan.create_pipeline_layout(
          device,
          pointerof(layout_info),
          nil,
          pointerof(layout)
        )

        assert_success(res)

        layout
      end

      def create_graphics_pipelines(device : Vulkan::Device, infos : Array(Vulkan::GraphicsPipelineCreateInfo), cache : Vulkan::PipelineCache? = nil, allocator : Vulkan::AllocationCallbacks? = nil)
        pipeline = nil.as(Vulkan::Pipeline)

        res = Vulkan.create_graphics_pipelines(
          device,
          cache.as(Vulkan::PipelineCache),
          infos.size,
          infos.to_unsafe,
          allocator,
          pointerof(pipeline)
        )

        assert_success(res)

        pipeline
      end

      def create_framebuffer(device : Vulkan::Device, fb_info : Vulkan::FramebufferCreateInfo, allocator : Vulkan::AllocationCallbacks? = nil)
        fb = nil.as(Vulkan::Framebuffer)

        res = Vulkan.create_framebuffer(device, pointerof(fb_info), allocator, pointerof(fb))
        assert_success(res)

        fb
      end

      def create_command_pool(device : Vulkan::Device, pool_info : Vulkan::CommandPoolCreateInfo, allocator : Vulkan::AllocationCallbacks? = nil)
        command_pool = nil.as(Vulkan::CommandPool)

        res = Vulkan.create_command_pool(device, pointerof(pool_info), allocator, pointerof(command_pool))
        assert_success(res)

        command_pool
      end

      def create_render_pass(device : Vulkan::Device, pass_info : Vulkan::RenderPassCreateInfo, allocator : Vulkan::AllocationCallbacks? = nil)
        render_pass = nil.as(Vulkan::RenderPass)

        res = Vulkan.create_render_pass(
          device,
          pointerof(pass_info),
          allocator,
          pointerof(render_pass)
        )
        assert_success(res)

        render_pass
      end

      def create_semaphore(device : Vulkan::Device)
        sem = nil.as(Vulkan::Semaphore)

        info = Vulkan::SemaphoreCreateInfo.new
        info.s_type = Vulkan::StructureType::VkStructureTypeSemaphoreCreateInfo

        res = Vulkan.create_semaphore(device, pointerof(info), nil, pointerof(sem))

        assert_success(res)

        sem
      end

      def allocate_command_buffers(device : Vulkan::Device, alloc_info : Vulkan::CommandBufferAllocateInfo)
        buffers = Array(Vulkan::CommandBuffer).new(alloc_info.command_buffer_count) { nil.as(Vulkan::CommandBuffer) }

        res = Vulkan.allocate_command_buffers(device, pointerof(alloc_info), buffers.to_unsafe)
        assert_success(res)

        buffers
      end

      def begin_command_buffer(buf : Vulkan::CommandBuffer, begin_info : Vulkan::CommandBufferBeginInfo)
        res = Vulkan.begin_command_buffer(buf, pointerof(begin_info))
        assert_success(res)
      end

      def end_command_buffer(buf : Vulkan::CommandBuffer)
        res = Vulkan.end_command_buffer(buf)
        assert_success(res)
      end

      def queue_submit(graphics_queue : Vulkan::Queue, infos : Array(Vulkan::SubmitInfo), fence : Vulkan::Fence = nil.as(Vulkan::Fence))
        res = Vulkan.queue_submit(graphics_queue, infos.size, infos.to_unsafe, fence)
        assert_success(res)
      end
    end
  end
end
