require "./libvulkan"

module Kimberlite
  # A thin layer wrapping the raw vulkan library.
  # Goals:
  #
  # - hide multiple calls that are used to first get the size and then the data of a list
  #
  module Mantle
    class ResultException < Exception
      getter value : Vulkan::Result

      def initialize(@value)
        super("Expected Result::VkSuccess but got: #{value}")
      end
    end

    def self.version(major : Int32, minor : Int32, patch : Int32)
      (major << 22) | (minor << 12) | patch
    end

    def self.enumerate_extensions
      count = 0_u32

      Vulkan.enumerate_instance_extension_properties(nil, pointerof(count), nil)

      exts = Array(Vulkan::ExtensionProperties).new(count) { Vulkan::ExtensionProperties.new }

      Vulkan.enumerate_instance_extension_properties(nil, pointerof(count), exts.to_unsafe)

      exts
    end

    def self.enumerate_instance_layers
      count = 0_u32

      Vulkan.enumerate_instance_layer_properties(pointerof(count), nil)

      layers = Array(Vulkan::LayerProperties).new(count) { Vulkan::LayerProperties.new }

      Vulkan.enumerate_instance_layer_properties(pointerof(count), layers.to_unsafe)

      layers
    end

    def self.enumerate_physical_devices(instance : Vulkan::Instance)
      count = 0_u32

      Vulkan.enumerate_physical_devices(instance, pointerof(count), nil)

      devices = Array(Vulkan::PhysicalDevice).new(count) { nil.as(Vulkan::PhysicalDevice) }

      Vulkan.enumerate_physical_devices(instance, pointerof(count), devices.to_unsafe)

      devices
    end

    def self.enumerate_queue_families(device : Vulkan::PhysicalDevice)
      count = 0_u32

      Vulkan.get_physical_device_queue_family_properties(device, pointerof(count), nil)

      families = Array(Vulkan::QueueFamilyProperties).new(count) { Vulkan::QueueFamilyProperties.new }

      Vulkan.get_physical_device_queue_family_properties(device, pointerof(count), families.to_unsafe)

      families
    end

    def self.create_instance(name : String? = nil, engine_name : String? = nil, extensions : Array(String) = [] of String, layers : Array(String) = [] of String) : Vulkan::Instance
      instance = nil.as(Vulkan::Instance)

      ext_pointers = extensions.map { |e| e.to_unsafe }
      layer_pointers = layers.map { |l| l.to_unsafe }

      app_info = Vulkan::ApplicationInfo.new
      app_info.s_type = Vulkan::StructureType::VkStructureTypeApplicationInfo
      app_info.p_application_name = name.to_unsafe
      app_info.application_version = Mantle.version(1, 0, 0)
      app_info.p_engine_name = engine_name.to_unsafe
      app_info.engine_version = Mantle.version(1, 0, 0)
      app_info.api_version = Mantle.version(1, 0, 0)

      create_info = Vulkan::InstanceCreateInfo.new
      create_info.s_type = Vulkan::StructureType::VkStructureTypeInstanceCreateInfo
      create_info.p_application_info = pointerof(app_info)
      create_info.enabled_extension_count = ext_pointers.size
      create_info.pp_enabled_extension_names = ext_pointers.to_unsafe
      create_info.enabled_layer_count = layer_pointers.size
      create_info.pp_enabled_layer_names = layer_pointers.to_unsafe

      result = Vulkan.create_instance(pointerof(create_info), nil, pointerof(instance))

      assert_success(result)

      instance
    end

    def self.register_debug_callback(instance : Vulkan::Instance, user_data : T, callback : (Vulkan::DebugUtilsMessageSeverityFlagBitsExt, Vulkan::DebugUtilsMessageTypeFlagsExt, Vulkan::DebugUtilsMessengerCallbackDataExt*, Void*) -> UInt32) forall T
      info = Vulkan::DebugUtilsMessengerCreateInfoExt.new
      info.s_type = Vulkan::StructureType::VkStructureTypeDebugUtilsMessengerCreateInfoExt

      info.message_severity =
        Vulkan::DebugUtilsMessageSeverityFlagBitsExt::VkDebugUtilsMessageSeverityVerboseBitExt |
          Vulkan::DebugUtilsMessageSeverityFlagBitsExt::VkDebugUtilsMessageSeverityWarningBitExt |
          Vulkan::DebugUtilsMessageSeverityFlagBitsExt::VkDebugUtilsMessageSeverityErrorBitExt

      info.message_type =
        Vulkan::DebugUtilsMessageTypeFlagBitsExt::VkDebugUtilsMessageTypeGeneralBitExt |
          Vulkan::DebugUtilsMessageTypeFlagBitsExt::VkDebugUtilsMessageTypeValidationBitExt |
          Vulkan::DebugUtilsMessageTypeFlagBitsExt::VkDebugUtilsMessageTypePerformanceBitExt

      info.pfn_user_callback = callback

      info.p_user_data = user_data.as(Void*)

      handle = nil.as(Vulkan::DebugUtilsMessengerExt)

      result = create_debug_utils_messenger_ext(
        instance,
        instance,
        pointerof(info),
        Pointer(Vulkan::AllocationCallbacks).null,
        pointerof(handle)
      )

      assert_success(result)

      handle
    end

    macro define_vulkan_function(meth, name, type)
      def self.{{meth}}(instance : Vulkan::Instance, *args)
        pointer = Vulkan.get_instance_proc_addr(instance, {{name}})
        func = {{type}}.new(pointer.pointer, pointer.closure_data)

        raise "Could not link: #{ {{name}} }" unless func

        func.call(*args)
      end
    end

    define_vulkan_function(create_debug_utils_messenger_ext, "vkCreateDebugUtilsMessengerEXT", Proc(Vulkan::Instance, Vulkan::DebugUtilsMessengerCreateInfoExt*, Vulkan::AllocationCallbacks*, Vulkan::DebugUtilsMessengerExt*, Vulkan::Result))
    define_vulkan_function(destroy_debug_utils_messenger_ext, "vkDestroyDebugUtilsMessengerEXT", Proc(Vulkan::Instance, Vulkan::DebugUtilsMessengerExt, Vulkan::AllocationCallbacks*, Void))

    # Assumes that there is one graphics queue that also supports presenting to a window surface
    def self.get_single_graphics_queue_index(physical_device : Vulkan::PhysicalDevice, surface : Vulkan::SurfaceKhr) : UInt32
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

    def self.create_logical_device(physical_device : Vulkan::PhysicalDevice, queue_defs : Hash(UInt32, Array(Float32)), extensions : Array(String) = [] of String, layers : Array(String) = [] of String) : Tuple(Vulkan::Device, Hash(UInt32, Array(Vulkan::Queue)))
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

    class SwapChainSupport
      property capabilities : Vulkan::SurfaceCapabilitiesKhr = Vulkan::SurfaceCapabilitiesKhr.new
      property formats : Array(Vulkan::SurfaceFormatKhr) = [] of Vulkan::SurfaceFormatKhr
      property present_modes : Array(Vulkan::PresentModeKhr) = [] of Vulkan::PresentModeKhr

      def capabilities_ptr
        pointerof(@capabilities)
      end
    end

    def self.get_swapchain_support_details(physical_device : Vulkan::PhysicalDevice, surface : Vulkan::SurfaceKhr) : SwapChainSupport
      support = SwapChainSupport.new

      Vulkan.get_physical_device_surface_capabilities_khr(physical_device, surface, support.capabilities_ptr)

      support.formats = get_physical_device_surface_formats(physical_device, surface)
      support.present_modes = get_physical_device_surface_present_modes(physical_device, surface)

      support
    end

    def self.get_physical_device_surface_formats(physical_device : Vulkan::PhysicalDevice, surface : Vulkan::SurfaceKhr) : Array(Vulkan::SurfaceFormatKhr)
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

    def self.get_physical_device_surface_present_modes(physical_device : Vulkan::PhysicalDevice, surface : Vulkan::SurfaceKhr) : Array(Vulkan::PresentModeKhr)
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

    def self.assert_success(result : Vulkan::Result)
      if result != Vulkan::Result::VkSuccess
        raise ResultException.new(result)
      end
    end
  end # Mantle
end
