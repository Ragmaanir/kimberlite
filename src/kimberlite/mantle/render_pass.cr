# require "../mantle"

# module Kimberlite
#   module Mantle
#     class RenderPass
#       getter device : Vulkan::Device
#       getter! object : Vulkan::RenderPass

#       def initialize(@device, format : Vulkan::Format)
#         dependency = Vulkan::SubpassDependency.new
#         dependency.src_subpass = ~0 # FIXME: VK_SUBPASS_EXTERNAL
#         dependency.dst_subpass = 0
#         dependency.src_stage_mask = Vulkan::PipelineStageFlagBits::VkPipelineStageColorAttachmentOutputBit
#         dependency.src_access_mask = 0
#         dependency.dst_stage_mask = Vulkan::PipelineStageFlagBits::VkPipelineStageColorAttachmentOutputBit
#         dependency.dst_access_mask = Vulkan::AccessFlagBits::VkAccessColorAttachmentReadBit | Vulkan::AccessFlagBits::VkAccessColorAttachmentWriteBit

#         color_att = Vulkan::AttachmentDescription.new
#         color_att.format = format
#         color_att.samples = Vulkan::SampleCountFlagBits::VkSampleCount1Bit
#         color_att.load_op = Vulkan::AttachmentLoadOp::VkAttachmentLoadOpClear
#         color_att.store_op = Vulkan::AttachmentStoreOp::VkAttachmentStoreOpStore
#         color_att.stencil_load_op = Vulkan::AttachmentLoadOp::VkAttachmentLoadOpDontCare
#         color_att.stencil_store_op = Vulkan::AttachmentStoreOp::VkAttachmentStoreOpDontCare
#         color_att.initial_layout = Vulkan::ImageLayout::VkImageLayoutUndefined
#         color_att.final_layout = Vulkan::ImageLayout::VkImageLayoutPresentSrcKhr

#         color_att_ref = Vulkan::AttachmentReference.new
#         color_att_ref.attachment = 0
#         color_att_ref.layout = Vulkan::ImageLayout::VkImageLayoutColorAttachmentOptimal

#         subpass = Vulkan::SubpassDescription.new
#         subpass.pipeline_bind_point = Vulkan::PipelineBindPoint::VkPipelineBindPointGraphics
#         subpass.color_attachment_count = 1
#         subpass.p_color_attachments = pointerof(color_att_ref)

#         pass_info = Vulkan::RenderPassCreateInfo.new
#         pass_info.s_type = Vulkan::StructureType::VkStructureTypeRenderPassCreateInfo
#         pass_info.attachment_count = 1
#         pass_info.p_attachments = pointerof(color_att)
#         pass_info.subpass_count = 1
#         pass_info.p_subpasses = pointerof(subpass)
#         pass_info.dependency_count = 1
#         pass_info.p_dependencies = pointerof(dependency)

#         obj = nil.as(Vulkan::RenderPass)
#         res = Vulkan.create_render_pass(device, pointerof(pass_info), nil, pointerof(obj))

#         @object = obj

#         Mantle.assert_success(res)
#       end

#       def destroy
#         Vulkan.destroy_render_pass(device, object, nil)
#       end
#     end
#   end
# end
