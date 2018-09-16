require "lib_glfw"
require "../../src/kimberlite/libvulkan"

class App
  def self.call
    new
  end

  class SwapChainSupport
    property capabilities : Vulkan::SurfaceCapabilitiesKhr = Vulkan::SurfaceCapabilitiesKhr.new
    property formats : Array(Vulkan::SurfaceFormatKhr) = [] of Vulkan::SurfaceFormatKhr
    property present_modes : Array(Vulkan::PresentModeKhr) = [] of Vulkan::PresentModeKhr

    def capabilities_ptr
      pointerof(@capabilities)
    end
  end

  getter instance : Vulkan::Instance = nil.as(Vulkan::Instance)
  getter physical_device : Vulkan::PhysicalDevice = nil.as(Vulkan::PhysicalDevice)
  getter device : Vulkan::Device = nil.as(Vulkan::Device)

  getter graphics_queue : Vulkan::Queue = nil.as(Vulkan::Queue)
  getter present_queue : Vulkan::Queue = nil.as(Vulkan::Queue)

  getter surface : Vulkan::SurfaceKhr = nil.as(Vulkan::SurfaceKhr)
  getter window : Pointer(LibGLFW::Window) = nil.as(LibGLFW::Window*)

  getter swapchain_support : SwapChainSupport = SwapChainSupport.new
  getter swapchain : Vulkan::SwapchainKhr = nil.as(Vulkan::SwapchainKhr)
  getter swapchain_images : Array(Vulkan::Image) = [] of Vulkan::Image

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

    create_swapchain(format, extent, swapchain_support.present_modes.first)

    image_count = 0_u32
    Vulkan.get_swapchain_images_khr(device, swapchain, pointerof(image_count), nil)
    @swapchain_images = Array(Vulkan::Image).new(image_count) { nil.as(Vulkan::Image) }
    Vulkan.get_swapchain_images_khr(device, swapchain, pointerof(image_count), swapchain_images.to_unsafe)

    # -------------------- destroy

    destroy
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

  def swapchain_supported?
    !swapchain_support.formats.empty? && !swapchain_support.present_modes.empty?
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
      candidates.find do |format|
        format.format == Vulkan::Format::VkFormatB8G8R8A8Unorm && format.color_space == Vulkan::ColorSpaceKhr::VkColorSpaceSrgbNonlinearKhr
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
