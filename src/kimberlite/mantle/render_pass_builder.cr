module Kimberlite
  module Mantle
    class RenderPassBuilder
      include Vulkan

      getter dependencies : Array(SubpassDependency)
      getter attachments : Array(AttachmentDescription)
      getter references : Array(AttachmentReference)
      getter subpasses : Array(SubpassDescription)

      def initialize(format : Format)
        dependency = SubpassDependency.new
        dependency.src_subpass = ~0 # FIXME: VK_SUBPASS_EXTERNAL
        dependency.dst_subpass = 0
        dependency.src_stage_mask = PipelineStageFlagBits::VkPipelineStageColorAttachmentOutputBit
        dependency.src_access_mask = 0
        dependency.dst_stage_mask = PipelineStageFlagBits::VkPipelineStageColorAttachmentOutputBit
        dependency.dst_access_mask = AccessFlagBits::VkAccessColorAttachmentReadBit | AccessFlagBits::VkAccessColorAttachmentWriteBit
      end

      def color_attachment
        color_att = AttachmentDescription.new
        color_att.format = format
        color_att.samples = SampleCountFlagBits::VkSampleCount1Bit
        color_att.load_op = AttachmentLoadOp::VkAttachmentLoadOpClear
        color_att.store_op = AttachmentStoreOp::VkAttachmentStoreOpStore
        color_att.stencil_load_op = AttachmentLoadOp::VkAttachmentLoadOpDontCare
        color_att.stencil_store_op = AttachmentStoreOp::VkAttachmentStoreOpDontCare
        color_att.initial_layout = ImageLayout::VkImageLayoutUndefined
        color_att.final_layout = ImageLayout::VkImageLayoutPresentSrcKhr

        color_att
      end

      def color_attachment_reference
        color_att_ref = AttachmentReference.new
        color_att_ref.attachment = 0
        color_att_ref.layout = ImageLayout::VkImageLayoutColorAttachmentOptimal

        color_att_ref
      end

      def subpass
        subpass = SubpassDescription.new
        subpass.pipeline_bind_point = PipelineBindPoint::VkPipelineBindPointGraphics
        subpass.color_attachment_count = 1
        subpass.p_color_attachments = pointerof(color_att_ref)

        subpasses << subpass
      end

      def build(device : Device)
        pass_info = RenderPassCreateInfo.new
        pass_info.s_type = StructureType::VkStructureTypeRenderPassCreateInfo
        pass_info.attachment_count = attachments.size
        pass_info.p_attachments = attachments.to_unsafe
        pass_info.subpass_count = subpasses.size
        pass_info.p_subpasses = subpasses.to_unsafe
        pass_info.dependency_count = dependencies.size
        pass_info.p_dependencies = dependencies.to_unsafe

        Mantle.create_render_pass(device, pass_info)
      end
    end
  end
end
