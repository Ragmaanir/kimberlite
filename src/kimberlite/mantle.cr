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

    def self.assert_success(result : Vulkan::Result)
      if result != Vulkan::Result::VkSuccess
        raise ResultException.new(result)
      end
    end
  end
end