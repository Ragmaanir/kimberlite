require "../mantle"

module Kimberlite
  module Mantle
    class Swapchain
      getter device : Vulkan::Device
      getter physical_device : Vulkan::PhysicalDevice

      getter object : Vulkan::SwapchainKhr
      getter format : Vulkan::Format
      getter extent : Vulkan::Extent2D

      getter images : Array(Vulkan::Image) = [] of Vulkan::Image
      getter views : Array(Vulkan::ImageView) = [] of Vulkan::ImageView

      def self.standard_swapchain(device : Vulkan::Device, physical_device : Vulkan::PhysicalDevice, surface : Vulkan::SurfaceKhr, format : Vulkan::SurfaceFormatKhr, extent : Vulkan::Extent2D, mode : Vulkan::PresentModeKhr, transform : Vulkan::SurfaceTransformFlagBitsKhr? = nil)
        if !transform
          capabilities = Vulkan::SurfaceCapabilitiesKhr.new

          Vulkan.get_physical_device_surface_capabilities_khr(physical_device, surface, pointerof(capabilities))

          transform = capabilities.current_transform
        end

        info = Mantle.standard_swapchain_parameters(surface, format, extent, mode, transform)

        new(device, physical_device, info)
      end

      def initialize(@device : Vulkan::Device, @physical_device : Vulkan::PhysicalDevice, swapchain_info : Vulkan::SwapchainCreateInfoKhr)
        @object = Mantle.create_swapchain(device, swapchain_info)
        @format = swapchain_info.image_format
        @extent = swapchain_info.image_extent

        @images = Mantle.get_swapchain_images(device, object)

        @views = Array(Vulkan::ImageView).new(images.size) { nil.as(Vulkan::ImageView) }

        images.each_with_index do |image, i|
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

          view = nil.as(Vulkan::ImageView)

          res = Vulkan.create_image_view(device, pointerof(info), nil, pointerof(view))
          Mantle.assert_success(res)

          views[i] = view
        end
      end

      def destroy
        views.each do |view|
          Vulkan.destroy_image_view(device, view, nil)
        end

        Vulkan.destroy_swapchain_khr(device, object, nil)
      end
    end
  end
end
