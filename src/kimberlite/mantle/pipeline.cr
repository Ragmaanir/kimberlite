require "../mantle"

module Kimberlite
  module Mantle
    class Pipeline
      enum ShaderStage
        Vertex,
        Fragment,
        All
      end

      class ShaderUsage
        getter shader : Vulkan::ShaderModule
        getter main : String
        getter stage : ShaderStage

        def initialize(@shader, @main, @stage)
        end
      end

      getter device : Vulkan::Device
      getter extent : Vulkan::Extent2D
      getter render_pass : Vulkan::RenderPass

      getter layout : Vulkan::PipelineLayout = nil.as(Vulkan::PipelineLayout)
      getter pipeline : Vulkan::Pipeline = nil.as(Vulkan::Pipeline)

      getter shaders : Array(ShaderUsage)

      def initialize(@device, @extent, @render_pass, @shaders)
        stages = shaders.map do |shader|
          info = Vulkan::PipelineShaderStageCreateInfo.new
          info.s_type = Vulkan::StructureType::VkStructureTypePipelineShaderStageCreateInfo

          info.stage = case shader.stage
                       when ShaderStage::Vertex   then Vulkan::ShaderStageFlagBits::VkShaderStageVertexBit
                       when ShaderStage::Fragment then Vulkan::ShaderStageFlagBits::VkShaderStageFragmentBit
                       when ShaderStage::All      then Vulkan::ShaderStageFlagBits::VkShaderStageAllGraphics
                       else                            raise("bug")
                       end

          info.module = shader.shader
          info.p_name = "main"

          info
        end

        vertex_info = Vulkan::PipelineVertexInputStateCreateInfo.new
        vertex_info.s_type = Vulkan::StructureType::VkStructureTypePipelineVertexInputStateCreateInfo
        vertex_info.vertex_binding_description_count = 0
        vertex_info.p_vertex_binding_descriptions = nil
        vertex_info.vertex_attribute_description_count = 0
        vertex_info.p_vertex_attribute_descriptions = nil

        input = Vulkan::PipelineInputAssemblyStateCreateInfo.new
        input.s_type = Vulkan::StructureType::VkStructureTypePipelineInputAssemblyStateCreateInfo
        input.topology = Vulkan::PrimitiveTopology::VkPrimitiveTopologyTriangleList
        input.primitive_restart_enable = 0 # false

        viewport = Vulkan::Viewport.new
        viewport.x = 0.0_f32
        viewport.y = 0.0_f32
        viewport.width = extent.width
        viewport.height = extent.height
        viewport.min_depth = 0.0_f32
        viewport.max_depth = 1.0_f32

        offset = Vulkan::Offset2D.new

        scissor = Vulkan::Rect2D.new
        scissor.offset = offset
        scissor.extent = extent

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

        res = Vulkan.create_pipeline_layout(device, pointerof(layout_info), nil, pointerof(@layout))

        Mantle.assert_success(res)

        info = Vulkan::GraphicsPipelineCreateInfo.new
        info.s_type = Vulkan::StructureType::VkStructureTypeGraphicsPipelineCreateInfo
        info.stage_count = 2
        info.p_stages = stages.to_unsafe
        info.p_vertex_input_state = pointerof(vertex_info)
        info.p_input_assembly_state = pointerof(input)
        info.p_viewport_state = pointerof(viewport_info)
        info.p_rasterization_state = pointerof(rasterizer)
        info.p_multisample_state = pointerof(multisampling)
        info.p_depth_stencil_state = nil
        info.p_color_blend_state = pointerof(color_blending)
        info.p_dynamic_state = nil
        info.layout = layout

        info.render_pass = render_pass
        info.subpass = 0
        info.base_pipeline_handle = nil.as(Vulkan::Pipeline)
        info.base_pipeline_index = -1

        res = Vulkan.create_graphics_pipelines(device, nil.as(Vulkan::PipelineCache), 1, pointerof(info), nil, pointerof(@pipeline))

        Mantle.assert_success(res)
      end

      def destroy
        Vulkan.destroy_pipeline(device, pipeline, nil)
        Vulkan.destroy_pipeline_layout(device, layout, nil)
      end
    end
  end
end
