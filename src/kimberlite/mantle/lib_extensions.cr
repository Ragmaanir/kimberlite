struct Vulkan::Offset2D
  def initialize
    initialize(0, 0)
  end

  def initialize(@x, @y)
  end
end

struct Vulkan::Extent2D
  def initialize
    initialize(0, 0)
  end

  def initialize(@width, @height)
  end
end

struct Vulkan::Rect2D
  def initialize
    initialize(Offset2D.new, Extent2D.new)
  end

  def initialize(@offset, @extent)
  end
end

struct Vulkan::Viewport
  def initialize(width, height, x = 0.0, y = 0.0, min_depth = 0.0, max_depth = 1.0)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.min_depth = min_depth
    self.max_depth = max_depth
  end
end

struct Vulkan::MemoryRequirements
  def memory_type_indices
    (0..31).select { |i| memory_type_bits.bit(i) == 1 }
  end
end

# union Vulkan::ClearValue
#   def initialize(v : Array(Float32))
#     color.float32 = StaticArray[v]
#   end

#   def initialize(*v : Int32)
#     color.int32 = StaticArray[*v]
#   end

#   def initialize(*v : UInt32)
#     color.uint32 = StaticArray[*v]
#   end
# end
