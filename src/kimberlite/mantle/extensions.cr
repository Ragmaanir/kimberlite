module Kimberlite
  module Mantle
    module Extensions
      macro define_vulkan_function(meth, name, type)
        def {{meth}}(instance : Vulkan::Instance, *args)
          pointer = Vulkan.get_instance_proc_addr(instance, {{name}})
          func = {{type}}.new(pointer.pointer, pointer.closure_data)

          raise "Could not link: #{ {{name}} }" unless func

          func.call(*args)
        end
      end

      define_vulkan_function(create_debug_utils_messenger_ext, "vkCreateDebugUtilsMessengerEXT", Proc(Vulkan::Instance, Vulkan::DebugUtilsMessengerCreateInfoExt*, Vulkan::AllocationCallbacks*, Vulkan::DebugUtilsMessengerExt*, Vulkan::Result))
      define_vulkan_function(destroy_debug_utils_messenger_ext, "vkDestroyDebugUtilsMessengerEXT", Proc(Vulkan::Instance, Vulkan::DebugUtilsMessengerExt, Vulkan::AllocationCallbacks*, Void))
    end
  end
end
