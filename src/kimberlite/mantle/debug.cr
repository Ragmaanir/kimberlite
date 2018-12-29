module Kimberlite
  module Mantle
    module Debug
      def register_debug_callback(
        instance : Vulkan::Instance,
        user_data : T,
        callback : (Vulkan::DebugUtilsMessageSeverityFlagBitsExt, Vulkan::DebugUtilsMessageTypeFlagsExt, Vulkan::DebugUtilsMessengerCallbackDataExt*, Void*) -> UInt32
      ) forall T
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
    end
  end
end
