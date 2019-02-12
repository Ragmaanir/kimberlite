module Kimberlite
  module Mantle
    # This module contains abstractions for the vulkan api and
    # provide some simple commonly used default implementations.
    module Shortcuts
      def create_instance(
        app_name : String = "Unnamed Application",
        app_version : Int32 = Mantle.version(1, 0, 0),
        engine_name : String = "Unnamed Engine",
        engine_version : Int32 = Mantle.version(1, 0, 0),
        api_version : Int32 = Mantle.version(1, 0, 0),
        extensions : Array(String) = [] of String,
        layers : Array(String) = [] of String,
        allocator : Vulkan::AllocationCallbacks? = nil
      ) : Vulkan::Instance
        ext_pointers = extensions.map { |e| e.to_unsafe }
        layer_pointers = layers.map { |l| l.to_unsafe }

        app_info = Vulkan::ApplicationInfo.new
        app_info.s_type = Vulkan::StructureType::VkStructureTypeApplicationInfo
        app_info.p_application_name = app_name.to_unsafe
        app_info.application_version = app_version
        app_info.p_engine_name = engine_name.to_unsafe
        app_info.engine_version = engine_version
        app_info.api_version = api_version

        create_info = Vulkan::InstanceCreateInfo.new
        create_info.s_type = Vulkan::StructureType::VkStructureTypeInstanceCreateInfo
        create_info.p_application_info = pointerof(app_info)
        create_info.enabled_extension_count = ext_pointers.size
        create_info.pp_enabled_extension_names = ext_pointers.to_unsafe
        create_info.enabled_layer_count = layer_pointers.size
        create_info.pp_enabled_layer_names = layer_pointers.to_unsafe

        create_instance(create_info, allocator)
      end

      def create_logical_device(
        physical_device : Vulkan::PhysicalDevice,
        queue_defs : Hash(UInt32, Array(Float32)),
        extensions : Array(String) = [] of String,
        layers : Array(String) = [] of String
      ) : Tuple(Vulkan::Device, Hash(UInt32, Array(Vulkan::Queue)))
        queue_infos = queue_defs.map do |idx, priorities|
          info = Vulkan::DeviceQueueCreateInfo.new
          info.s_type = Vulkan::StructureType::VkStructureTypeDeviceQueueCreateInfo
          info.queue_family_index = idx
          info.queue_count = priorities.size

          info.p_queue_priorities = priorities.to_unsafe

          info
        end

        features = Vulkan::PhysicalDeviceFeatures.new

        extension_pointers = extensions.map(&.to_unsafe)
        layer_pointers = layers.map(&.to_unsafe)

        info = Vulkan::DeviceCreateInfo.new
        info.s_type = Vulkan::StructureType::VkStructureTypeDeviceCreateInfo

        info.queue_create_info_count = queue_infos.size
        info.p_queue_create_infos = queue_infos.to_unsafe

        info.p_enabled_features = pointerof(features)

        info.enabled_extension_count = extension_pointers.size
        info.pp_enabled_extension_names = extension_pointers.to_unsafe

        info.enabled_layer_count = layer_pointers.size
        info.pp_enabled_layer_names = layer_pointers.to_unsafe

        logical_device = nil.as(Vulkan::Device)

        result = Vulkan.create_device(
          physical_device,
          pointerof(info),
          nil,
          pointerof(logical_device)
        )

        assert_success(result)

        queues = queue_defs.map do |(family_idx, priorities)|
          qs = Array(Vulkan::Queue).new(priorities.size) { nil.as(Vulkan::Queue) }

          priorities.size.times do |i|
            handle = nil.as(Vulkan::Queue)

            Vulkan.get_device_queue(logical_device, family_idx, i, pointerof(handle))

            qs[i] = handle
          end

          {family_idx, qs}
        end.to_h

        {logical_device, queues}
      end

      def pick_swapchain_extent(width : UInt32, height : UInt32, caps : Vulkan::SurfaceCapabilitiesKhr)
        if caps.current_extent.width == UInt32::MAX
          ext = Vulkan::Extent2D.new

          # Pick the biggest sizes possible based on given width/height and
          # min/max supported capabilities.

          ext.width = [
            caps.min_image_extent.width,
            [caps.max_image_extent.width, width].min,
          ].max

          ext.height = [
            caps.min_image_extent.height,
            [caps.max_image_extent.height, height].min,
          ].max

          ext
        else
          caps.current_extent
        end
      end

      # Assumes that there is one graphics queue that also supports presenting to a window surface
      def get_single_graphics_queue_index(physical_device : Vulkan::PhysicalDevice, surface : Vulkan::SurfaceKhr) : UInt32
        families = Mantle.enumerate_queue_families(physical_device)

        pair = families.each_with_index.find do |(family, i)|
          present = 0_u32
          Vulkan.get_physical_device_surface_support_khr(physical_device, i, surface, pointerof(present))

          family.queue_count > 0 && present && family.queue_flags & Vulkan::QueueFlagBits::VkQueueGraphicsBit.to_i
        end

        if pair
          pair[1].to_u32
        else
          raise("No single graphics queue found")
        end
      end

      def select_standard_swap_surface_format(candidates : Array(Vulkan::SurfaceFormatKhr)) : Vulkan::SurfaceFormatKhr
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

      def standard_swapchain_parameters(
        surface : Vulkan::SurfaceKhr,
        format : Vulkan::SurfaceFormatKhr,
        extent : Vulkan::Extent2D,
        mode : Vulkan::PresentModeKhr,
        transform : Vulkan::SurfaceTransformFlagBitsKhr
      ) : Vulkan::SwapchainCreateInfoKhr
        info = Vulkan::SwapchainCreateInfoKhr.new
        info.s_type = Vulkan::StructureType::VkStructureTypeSwapchainCreateInfoKhr
        info.surface = surface
        info.min_image_count = 2
        info.image_format = format.format
        info.image_color_space = format.color_space
        info.image_extent = extent
        info.image_array_layers = 1
        info.image_usage = Vulkan::ImageUsageFlagBits::VkImageUsageColorAttachmentBit

        # FIXME assuming graphics queue == present queue
        info.image_sharing_mode = Vulkan::SharingMode::VkSharingModeExclusive
        info.queue_family_index_count = 0
        info.p_queue_family_indices = nil

        info.pre_transform = transform
        info.composite_alpha = Vulkan::CompositeAlphaFlagBitsKhr::VkCompositeAlphaOpaqueBitKhr
        info.present_mode = mode
        info.clipped = 1
        info.old_swapchain = nil

        info
      end

      def build_image_view_create_info(image : Vulkan::Image, format : Vulkan::Format)
        info = Vulkan::ImageViewCreateInfo.new
        info.s_type = Vulkan::StructureType::VkStructureTypeImageViewCreateInfo
        info.image = image
        info.view_type = Vulkan::ImageViewType::VkImageViewType2D
        info.format = format
        info.components.r = Vulkan::ComponentSwizzle::VkComponentSwizzleIdentity
        info.components.g = Vulkan::ComponentSwizzle::VkComponentSwizzleIdentity
        info.components.b = Vulkan::ComponentSwizzle::VkComponentSwizzleIdentity
        info.components.a = Vulkan::ComponentSwizzle::VkComponentSwizzleIdentity
        info.subresource_range.aspect_mask = Vulkan::ImageAspectFlagBits::VkImageAspectColorBit
        info.subresource_range.base_mip_level = 0
        info.subresource_range.level_count = 1
        info.subresource_range.base_array_layer = 0
        info.subresource_range.layer_count = 1

        info
      end

      def find_matching_memory_type_index(physical_device : Vulkan::PhysicalDevice, req : Vulkan::MemoryRequirements, properties : Int32)
        props = get_physical_device_memory_properties(physical_device)

        req.memory_type_indices.find do |i|
          t = props.memory_types[i]
          t.property_flags & properties == properties &&
            props.memory_heaps[t.heap_index].size >= req.size
        end || raise("Could not find a matching memory type to allocate memory in")
      end

      def allocate_memory(device : Vulkan::Device, physical_device : Vulkan::PhysicalDevice, req : Vulkan::MemoryRequirements, properties : Int32? = nil)
        properties ||= Vulkan::MemoryPropertyFlagBits::VkMemoryPropertyHostVisibleBit.value |
                       Vulkan::MemoryPropertyFlagBits::VkMemoryPropertyHostCoherentBit.value

        info = Vulkan::MemoryAllocateInfo.new
        info.s_type = Vulkan::StructureType::VkStructureTypeMemoryAllocateInfo
        info.allocation_size = req.size
        info.memory_type_index = find_matching_memory_type_index(physical_device, req, properties)

        Mantle.allocate_memory(device, info)
      end

      def allocate_buffer_memory(device : Vulkan::Device, physical_device : Vulkan::PhysicalDevice, buffer : Vulkan::Buffer)
        req = get_buffer_memory_requirements(device, buffer)

        memory = allocate_memory(device, physical_device, req)

        Mantle.bind_buffer_memory(device, buffer, memory)

        memory
      end

      def copy_memory(device : Vulkan::Device, memory : Vulkan::DeviceMemory, size : UInt64, buffer : Void*)
        data = Mantle.map_memory(device, memory, size)
        Intrinsics.memcpy(data, buffer, size, 0_u64, false)
        Vulkan.unmap_memory(device, memory)
      end
    end # Shortcuts
  end   # Mantle
end
