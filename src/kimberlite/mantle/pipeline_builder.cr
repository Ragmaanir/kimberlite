module Kimberlite
  module Mantle
    class PipelineBuilder
      property shader_modules : Array(Tuple(Vulkan::ShaderStageFlagBits, Vulkan::ShaderModule))

      property input_assembly_info : Vulkan::PipelineInputAssemblyStateCreateInfo
      property viewports : Array(Vulkan::Viewport) = [] of Vulkan::Viewport
      property scissors : Array(Vulkan::Rect2D) = [] of Vulkan::Rect2D
      property attachments : Array(Vulkan::PipelineColorBlendAttachmentState) = [] of Vulkan::PipelineColorBlendAttachmentState
      property multisampling : Vulkan::PipelineMultisampleStateCreateInfo
      property color_blending : Vulkan::PipelineColorBlendStateCreateInfo
      property layout_info : Vulkan::PipelineLayoutCreateInfo
      property rasterizer : Vulkan::PipelineRasterizationStateCreateInfo

      property vertex_binding_descriptions : Array(Vulkan::VertexInputBindingDescription) = [] of Vulkan::VertexInputBindingDescription
      property vertex_attribute_descriptions : Array(Vulkan::VertexInputAttributeDescription) = [] of Vulkan::VertexInputAttributeDescription

      def initialize
        @shader_modules = [] of Tuple(Vulkan::ShaderStageFlagBits, Vulkan::ShaderModule)

        @input_assembly_info = Vulkan::PipelineInputAssemblyStateCreateInfo.new
        input_assembly_info.s_type = Vulkan::StructureType::VkStructureTypePipelineInputAssemblyStateCreateInfo
        input_assembly_info.topology = Vulkan::PrimitiveTopology::VkPrimitiveTopologyTriangleList
        input_assembly_info.primitive_restart_enable = 0 # false

        @rasterizer = Vulkan::PipelineRasterizationStateCreateInfo.new
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

        @multisampling = Vulkan::PipelineMultisampleStateCreateInfo.new
        multisampling.s_type = Vulkan::StructureType::VkStructureTypePipelineMultisampleStateCreateInfo
        multisampling.sample_shading_enable = 0 # false
        multisampling.rasterization_samples = Vulkan::SampleCountFlagBits::VkSampleCount1Bit
        multisampling.min_sample_shading = 1.0_f32
        multisampling.p_sample_mask = nil
        multisampling.alpha_to_coverage_enable = 0 # false
        multisampling.alpha_to_one_enable = 0      # false

        @color_blending = Vulkan::PipelineColorBlendStateCreateInfo.new
        color_blending.s_type = Vulkan::StructureType::VkStructureTypePipelineColorBlendStateCreateInfo
        color_blending.logic_op_enable = 0 # false
        color_blending.logic_op = Vulkan::LogicOp::VkLogicOpCopy
        color_blending.blend_constants[0] = 0.0_f32
        color_blending.blend_constants[1] = 0.0_f32
        color_blending.blend_constants[2] = 0.0_f32
        color_blending.blend_constants[3] = 0.0_f32

        @layout_info = Vulkan::PipelineLayoutCreateInfo.new
        layout_info.s_type = Vulkan::StructureType::VkStructureTypePipelineLayoutCreateInfo
        layout_info.set_layout_count = 0
        layout_info.p_set_layouts = nil
        layout_info.push_constant_range_count = 0
        layout_info.p_push_constant_ranges = nil
      end

      def default_color_blend_attachment
        blending = Vulkan::PipelineColorBlendAttachmentState.new

        blending.color_write_mask = Vulkan::ColorComponentFlagBits::VkColorComponentRBit | Vulkan::ColorComponentFlagBits::VkColorComponentGBit | Vulkan::ColorComponentFlagBits::VkColorComponentBBit | Vulkan::ColorComponentFlagBits::VkColorComponentABit
        blending.blend_enable = 0 # false
        blending.src_color_blend_factor = Vulkan::BlendFactor::VkBlendFactorOne
        blending.dst_color_blend_factor = Vulkan::BlendFactor::VkBlendFactorZero
        blending.color_blend_op = Vulkan::BlendOp::VkBlendOpAdd
        blending.src_alpha_blend_factor = Vulkan::BlendFactor::VkBlendFactorOne
        blending.dst_alpha_blend_factor = Vulkan::BlendFactor::VkBlendFactorZero
        blending.alpha_blend_op = Vulkan::BlendOp::VkBlendOpAdd

        blending
      end

      private def generate_stages : Array(Vulkan::PipelineShaderStageCreateInfo)
        shader_modules.map do |stage, mod|
          info = Vulkan::PipelineShaderStageCreateInfo.new
          info.s_type = Vulkan::StructureType::VkStructureTypePipelineShaderStageCreateInfo

          info.stage = stage

          info.module = mod
          info.p_name = "main"

          info
        end
      end

      def build(device : Vulkan::Device, render_pass : Vulkan::RenderPass)
        color_blending.attachment_count = attachments.size
        color_blending.p_attachments = attachments.to_unsafe

        viewport_info = Vulkan::PipelineViewportStateCreateInfo.new
        viewport_info.s_type = Vulkan::StructureType::VkStructureTypePipelineViewportStateCreateInfo
        viewport_info.viewport_count = viewports.size
        viewport_info.p_viewports = viewports.to_unsafe
        viewport_info.scissor_count = scissors.size
        viewport_info.p_scissors = scissors.to_unsafe

        layout = Mantle.create_pipeline_layout(device, layout_info)

        stages = generate_stages

        vertex_info = Vulkan::PipelineVertexInputStateCreateInfo.new
        vertex_info.s_type = Vulkan::StructureType::VkStructureTypePipelineVertexInputStateCreateInfo
        vertex_info.vertex_binding_description_count = vertex_binding_descriptions.size
        vertex_info.p_vertex_binding_descriptions = vertex_binding_descriptions.to_unsafe
        vertex_info.vertex_attribute_description_count = vertex_attribute_descriptions.size
        vertex_info.p_vertex_attribute_descriptions = vertex_attribute_descriptions.to_unsafe

        info = Vulkan::GraphicsPipelineCreateInfo.new
        info.s_type = Vulkan::StructureType::VkStructureTypeGraphicsPipelineCreateInfo
        info.stage_count = stages.size
        info.p_stages = stages.to_unsafe
        info.p_vertex_input_state = pointerof(vertex_info)
        info.p_input_assembly_state = pointerof(@input_assembly_info)
        info.p_viewport_state = pointerof(viewport_info)
        info.p_rasterization_state = pointerof(@rasterizer)
        info.p_multisample_state = pointerof(@multisampling)
        info.p_depth_stencil_state = nil
        info.p_color_blend_state = pointerof(@color_blending)
        info.p_dynamic_state = nil
        info.layout = layout

        info.render_pass = render_pass
        info.subpass = 0
        info.base_pipeline_handle = nil.as(Vulkan::Pipeline)
        info.base_pipeline_index = -1

        {
          Mantle.create_graphics_pipeline(device, info),
          layout,
        }
      end
    end
  end
end
