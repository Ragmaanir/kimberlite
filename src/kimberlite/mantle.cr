require "./libvulkan"
require "./mantle/wrappers"
require "./mantle/shortcuts"
require "./mantle/extensions"
require "./mantle/debug"

module Kimberlite
  # A thin layer wrapping the raw vulkan library.
  # Goals:
  #
  # - hide multiple calls that are used to first get the size and then the data of a list
  #
  module Mantle
    extend Wrappers
    include Wrappers

    extend Shortcuts
    include Shortcuts

    extend Extensions
    extend Debug

    class ResultException < Exception
      getter value : Vulkan::Result

      def initialize(@value)
        super("Expected Result::VkSuccess but got: #{value}")
      end
    end

    def self.version(major : Int32, minor : Int32, patch : Int32)
      (major << 22) | (minor << 12) | patch
    end

    def self.assert_success(result : Vulkan::Result)
      if result != Vulkan::Result::VkSuccess
        raise ResultException.new(result)
      end
    end
  end # Mantle
end
