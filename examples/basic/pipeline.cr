class Pipeline
  getter device : Vulkan::Device
  getter swapchain_extent : Vulkan::Extent2D

  getter layout : Vulkan::PipelineLayout = nil.as(Vulkan::PipelineLayout)

  getter vertex_shader : Vulkan::ShaderModule = nil.as(Vulkan::ShaderModule)
  getter fragment_shader : Vulkan::ShaderModule = nil.as(Vulkan::ShaderModule)

  def initialize(@device, @swapchain_extent : Vulkan::Extent2D)
    @vertex_shader = create_shader_module(File.read("./examples/basic/vert.spv"))
    @fragment_shader = create_shader_module(File.read("./examples/basic/frag.spv"))

    pipeline_infos = [
      create_pipeline_shader_stage_create_info(vertex_shader, ShaderKind::Vertex),
      create_pipeline_shader_stage_create_info(fragment_shader, ShaderKind::Fragment),
    ]

    info = Vulkan::PipelineVertexInputStateCreateInfo.new
    info.s_type = Vulkan::StructureType::VkStructureTypePipelineVertexInputStateCreateInfo
    info.vertex_binding_description_count = 0
    info.p_vertex_binding_descriptions = nil
    info.vertex_attribute_description_count = 0
    info.p_vertex_attribute_descriptions = nil

    input = Vulkan::PipelineInputAssemblyStateCreateInfo.new
    input.s_type = Vulkan::StructureType::VkStructureTypePipelineInputAssemblyStateCreateInfo
    input.topology = Vulkan::PrimitiveTopology::VkPrimitiveTopologyTriangleList
    input.primitive_restart_enable = 0 # false

    viewport = Vulkan::Viewport.new
    viewport.x = 0.0_f32
    viewport.y = 0.0_f32
    viewport.width = swapchain_extent.width
    viewport.height = swapchain_extent.height
    viewport.min_depth = 0.0_f32
    viewport.max_depth = 1.0_f32

    offset = Vulkan::Offset2D.new

    scissor = Vulkan::Rect2D.new
    scissor.offset = offset
    scissor.extent = swapchain_extent

    viewport_info = Vulkan::PipelineViewportStateCreateInfo.new
    viewport_info.s_type = Vulkan::StructureType::VkStructureTypePipelineViewportStateCreateInfo
    viewport_info.viewport_count = 1
    viewport_info.p_viewports = pointerof(viewport)
    viewport_info.scissor_count = 1
    viewport_info.p_scissors = pointerof(scissor)

    rasterizer = Vulkan::PipelineRasterizationStateCreateInfo.new
    rasterizer.s_type = Vulkan::StructureType::VkStructureTypePipelineRasterizationStateCreateInfo
    rasterizer.depth_clamp_enable = 0        # false
    rasterizer.rasterizer_discard_enable = 0 # false
    rasterizer.polygon_mode = Vulkan::PolygonMode::VkPolygonModeFill
    rasterizer.line_width = 1.0_f32
    rasterizer.cull_mode = Vulkan::CullModeFlagBits::VkCullModeBackBit
    rasterizer.front_face = Vulkan::FrontFace::VkFrontFaceClockwise
    rasterizer.depth_bias_enable = 0 # false
    rasterizer.depth_bias_constant_factor = 0.0_f32
    rasterizer.depth_bias_clamp = 0.0_f32
    rasterizer.depth_bias_slope_factor = 0.0_f32

    multisampling = Vulkan::PipelineMultisampleStateCreateInfo.new
    multisampling.s_type = Vulkan::StructureType::VkStructureTypePipelineMultisampleStateCreateInfo
    multisampling.sample_shading_enable = 0 # false
    multisampling.rasterization_samples = Vulkan::SampleCountFlagBits::VkSampleCount1Bit
    multisampling.min_sample_shading = 1.0_f32
    multisampling.p_sample_mask = nil
    multisampling.alpha_to_coverage_enable = 0 # false
    multisampling.alpha_to_one_enable = 0      # false

    blending = Vulkan::PipelineColorBlendAttachmentState.new
    blending.color_write_mask = Vulkan::ColorComponentFlagBits::VkColorComponentRBit | Vulkan::ColorComponentFlagBits::VkColorComponentGBit | Vulkan::ColorComponentFlagBits::VkColorComponentBBit | Vulkan::ColorComponentFlagBits::VkColorComponentABit
    blending.blend_enable = 0 # false
    blending.src_color_blend_factor = Vulkan::BlendFactor::VkBlendFactorOne
    blending.dst_color_blend_factor = Vulkan::BlendFactor::VkBlendFactorZero
    blending.color_blend_op = Vulkan::BlendOp::VkBlendOpAdd
    blending.src_alpha_blend_factor = Vulkan::BlendFactor::VkBlendFactorOne
    blending.dst_alpha_blend_factor = Vulkan::BlendFactor::VkBlendFactorZero
    blending.alpha_blend_op = Vulkan::BlendOp::VkBlendOpAdd

    color_blending = Vulkan::PipelineColorBlendStateCreateInfo.new
    color_blending.s_type = Vulkan::StructureType::VkStructureTypePipelineColorBlendStateCreateInfo
    color_blending.logic_op_enable = 0 # false
    color_blending.logic_op = Vulkan::LogicOp::VkLogicOpCopy
    color_blending.attachment_count = 1
    color_blending.p_attachments = pointerof(blending)
    color_blending.blend_constants[0] = 0.0_f32
    color_blending.blend_constants[1] = 0.0_f32
    color_blending.blend_constants[2] = 0.0_f32
    color_blending.blend_constants[3] = 0.0_f32

    layout_info = Vulkan::PipelineLayoutCreateInfo.new
    layout_info.s_type = Vulkan::StructureType::VkStructureTypePipelineLayoutCreateInfo
    layout_info.set_layout_count = 0
    layout_info.p_set_layouts = nil
    layout_info.push_constant_range_count = 0
    layout_info.p_push_constant_ranges = nil

    if Vulkan.create_pipeline_layout(device, pointerof(layout_info), nil, pointerof(@layout)) != Vulkan::Result::VkSuccess
      raise("failed to create pipeline layout")
    end
  end

  def destroy
    Vulkan.destroy_pipeline_layout(device, layout, nil)

    Vulkan.destroy_shader_module(device, vertex_shader, nil)
    Vulkan.destroy_shader_module(device, fragment_shader, nil)
  end

  def create_shader_module(source : String)
    info = Vulkan::ShaderModuleCreateInfo.new
    info.s_type = Vulkan::StructureType::VkStructureTypeShaderModuleCreateInfo
    info.code_size = source.size
    info.p_code = Pointer(UInt32).new(source.to_unsafe.address)

    mod : Vulkan::ShaderModule = nil.as(Vulkan::ShaderModule)

    if Vulkan.create_shader_module(device, pointerof(info), nil, pointerof(mod)) != Vulkan::Result::VkSuccess
      raise("failed to create shader module")
    end

    mod
  end

  enum ShaderKind
    Vertex,
    Fragment
  end

  def create_pipeline_shader_stage_create_info(mod : Vulkan::ShaderModule, kind : ShaderKind)
    info = Vulkan::PipelineShaderStageCreateInfo.new
    info.s_type = Vulkan::StructureType::VkStructureTypePipelineShaderStageCreateInfo

    info.stage = case kind
                 when ShaderKind::Vertex   then Vulkan::ShaderStageFlagBits::VkShaderStageVertexBit
                 when ShaderKind::Fragment then Vulkan::ShaderStageFlagBits::VkShaderStageFragmentBit
                 else                           raise("bug")
                 end

    info.module = mod
    info.p_name = "main"

    info
  end
end
