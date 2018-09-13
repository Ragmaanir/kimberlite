# ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
# ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛ THIS FILE IS MACHINE GENERATED ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
# ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛

@[Link("vulkan")]
lib Vulkan
  alias InstanceT = Void
  alias PhysicalDeviceT = Void
  alias DeviceT = Void
  alias QueueT = Void
  alias SemaphoreT = Void
  alias CommandBufferT = Void
  alias FenceT = Void
  alias DeviceMemoryT = Void
  alias BufferT = Void
  alias ImageT = Void
  alias EventT = Void
  alias QueryPoolT = Void
  alias BufferViewT = Void
  alias ImageViewT = Void
  alias ShaderModuleT = Void
  alias PipelineCacheT = Void
  alias PipelineLayoutT = Void
  alias RenderPassT = Void
  alias PipelineT = Void
  alias DescriptorSetLayoutT = Void
  alias SamplerT = Void
  alias DescriptorPoolT = Void
  alias DescriptorSetT = Void
  alias FramebufferT = Void
  alias CommandPoolT = Void
  struct ApplicationInfo
    s_type : StructureType
    p_next : Void*
    p_application_name : LibC::Char*
    application_version : Uint32T
    p_engine_name : LibC::Char*
    engine_version : Uint32T
    api_version : Uint32T
  end
  enum StructureType
    VkStructureTypeApplicationInfo = 0
    VkStructureTypeInstanceCreateInfo = 1
    VkStructureTypeDeviceQueueCreateInfo = 2
    VkStructureTypeDeviceCreateInfo = 3
    VkStructureTypeSubmitInfo = 4
    VkStructureTypeMemoryAllocateInfo = 5
    VkStructureTypeMappedMemoryRange = 6
    VkStructureTypeBindSparseInfo = 7
    VkStructureTypeFenceCreateInfo = 8
    VkStructureTypeSemaphoreCreateInfo = 9
    VkStructureTypeEventCreateInfo = 10
    VkStructureTypeQueryPoolCreateInfo = 11
    VkStructureTypeBufferCreateInfo = 12
    VkStructureTypeBufferViewCreateInfo = 13
    VkStructureTypeImageCreateInfo = 14
    VkStructureTypeImageViewCreateInfo = 15
    VkStructureTypeShaderModuleCreateInfo = 16
    VkStructureTypePipelineCacheCreateInfo = 17
    VkStructureTypePipelineShaderStageCreateInfo = 18
    VkStructureTypePipelineVertexInputStateCreateInfo = 19
    VkStructureTypePipelineInputAssemblyStateCreateInfo = 20
    VkStructureTypePipelineTessellationStateCreateInfo = 21
    VkStructureTypePipelineViewportStateCreateInfo = 22
    VkStructureTypePipelineRasterizationStateCreateInfo = 23
    VkStructureTypePipelineMultisampleStateCreateInfo = 24
    VkStructureTypePipelineDepthStencilStateCreateInfo = 25
    VkStructureTypePipelineColorBlendStateCreateInfo = 26
    VkStructureTypePipelineDynamicStateCreateInfo = 27
    VkStructureTypeGraphicsPipelineCreateInfo = 28
    VkStructureTypeComputePipelineCreateInfo = 29
    VkStructureTypePipelineLayoutCreateInfo = 30
    VkStructureTypeSamplerCreateInfo = 31
    VkStructureTypeDescriptorSetLayoutCreateInfo = 32
    VkStructureTypeDescriptorPoolCreateInfo = 33
    VkStructureTypeDescriptorSetAllocateInfo = 34
    VkStructureTypeWriteDescriptorSet = 35
    VkStructureTypeCopyDescriptorSet = 36
    VkStructureTypeFramebufferCreateInfo = 37
    VkStructureTypeRenderPassCreateInfo = 38
    VkStructureTypeCommandPoolCreateInfo = 39
    VkStructureTypeCommandBufferAllocateInfo = 40
    VkStructureTypeCommandBufferInheritanceInfo = 41
    VkStructureTypeCommandBufferBeginInfo = 42
    VkStructureTypeRenderPassBeginInfo = 43
    VkStructureTypeBufferMemoryBarrier = 44
    VkStructureTypeImageMemoryBarrier = 45
    VkStructureTypeMemoryBarrier = 46
    VkStructureTypeLoaderInstanceCreateInfo = 47
    VkStructureTypeLoaderDeviceCreateInfo = 48
    VkStructureTypePhysicalDeviceSubgroupProperties = 1000094000
    VkStructureTypeBindBufferMemoryInfo = 1000157000
    VkStructureTypeBindImageMemoryInfo = 1000157001
    VkStructureTypePhysicalDevice16BitStorageFeatures = 1000083000
    VkStructureTypeMemoryDedicatedRequirements = 1000127000
    VkStructureTypeMemoryDedicatedAllocateInfo = 1000127001
    VkStructureTypeMemoryAllocateFlagsInfo = 1000060000
    VkStructureTypeDeviceGroupRenderPassBeginInfo = 1000060003
    VkStructureTypeDeviceGroupCommandBufferBeginInfo = 1000060004
    VkStructureTypeDeviceGroupSubmitInfo = 1000060005
    VkStructureTypeDeviceGroupBindSparseInfo = 1000060006
    VkStructureTypeBindBufferMemoryDeviceGroupInfo = 1000060013
    VkStructureTypeBindImageMemoryDeviceGroupInfo = 1000060014
    VkStructureTypePhysicalDeviceGroupProperties = 1000070000
    VkStructureTypeDeviceGroupDeviceCreateInfo = 1000070001
    VkStructureTypeBufferMemoryRequirementsInfo2 = 1000146000
    VkStructureTypeImageMemoryRequirementsInfo2 = 1000146001
    VkStructureTypeImageSparseMemoryRequirementsInfo2 = 1000146002
    VkStructureTypeMemoryRequirements2 = 1000146003
    VkStructureTypeSparseImageMemoryRequirements2 = 1000146004
    VkStructureTypePhysicalDeviceFeatures2 = 1000059000
    VkStructureTypePhysicalDeviceProperties2 = 1000059001
    VkStructureTypeFormatProperties2 = 1000059002
    VkStructureTypeImageFormatProperties2 = 1000059003
    VkStructureTypePhysicalDeviceImageFormatInfo2 = 1000059004
    VkStructureTypeQueueFamilyProperties2 = 1000059005
    VkStructureTypePhysicalDeviceMemoryProperties2 = 1000059006
    VkStructureTypeSparseImageFormatProperties2 = 1000059007
    VkStructureTypePhysicalDeviceSparseImageFormatInfo2 = 1000059008
    VkStructureTypePhysicalDevicePointClippingProperties = 1000117000
    VkStructureTypeRenderPassInputAttachmentAspectCreateInfo = 1000117001
    VkStructureTypeImageViewUsageCreateInfo = 1000117002
    VkStructureTypePipelineTessellationDomainOriginStateCreateInfo = 1000117003
    VkStructureTypeRenderPassMultiviewCreateInfo = 1000053000
    VkStructureTypePhysicalDeviceMultiviewFeatures = 1000053001
    VkStructureTypePhysicalDeviceMultiviewProperties = 1000053002
    VkStructureTypePhysicalDeviceVariablePointerFeatures = 1000120000
    VkStructureTypeProtectedSubmitInfo = 1000145000
    VkStructureTypePhysicalDeviceProtectedMemoryFeatures = 1000145001
    VkStructureTypePhysicalDeviceProtectedMemoryProperties = 1000145002
    VkStructureTypeDeviceQueueInfo2 = 1000145003
    VkStructureTypeSamplerYcbcrConversionCreateInfo = 1000156000
    VkStructureTypeSamplerYcbcrConversionInfo = 1000156001
    VkStructureTypeBindImagePlaneMemoryInfo = 1000156002
    VkStructureTypeImagePlaneMemoryRequirementsInfo = 1000156003
    VkStructureTypePhysicalDeviceSamplerYcbcrConversionFeatures = 1000156004
    VkStructureTypeSamplerYcbcrConversionImageFormatProperties = 1000156005
    VkStructureTypeDescriptorUpdateTemplateCreateInfo = 1000085000
    VkStructureTypePhysicalDeviceExternalImageFormatInfo = 1000071000
    VkStructureTypeExternalImageFormatProperties = 1000071001
    VkStructureTypePhysicalDeviceExternalBufferInfo = 1000071002
    VkStructureTypeExternalBufferProperties = 1000071003
    VkStructureTypePhysicalDeviceIdProperties = 1000071004
    VkStructureTypeExternalMemoryBufferCreateInfo = 1000072000
    VkStructureTypeExternalMemoryImageCreateInfo = 1000072001
    VkStructureTypeExportMemoryAllocateInfo = 1000072002
    VkStructureTypePhysicalDeviceExternalFenceInfo = 1000112000
    VkStructureTypeExternalFenceProperties = 1000112001
    VkStructureTypeExportFenceCreateInfo = 1000113000
    VkStructureTypeExportSemaphoreCreateInfo = 1000077000
    VkStructureTypePhysicalDeviceExternalSemaphoreInfo = 1000076000
    VkStructureTypeExternalSemaphoreProperties = 1000076001
    VkStructureTypePhysicalDeviceMaintenance3Properties = 1000168000
    VkStructureTypeDescriptorSetLayoutSupport = 1000168001
    VkStructureTypePhysicalDeviceShaderDrawParameterFeatures = 1000063000
    VkStructureTypeSwapchainCreateInfoKhr = 1000001000
    VkStructureTypePresentInfoKhr = 1000001001
    VkStructureTypeDeviceGroupPresentCapabilitiesKhr = 1000060007
    VkStructureTypeImageSwapchainCreateInfoKhr = 1000060008
    VkStructureTypeBindImageMemorySwapchainInfoKhr = 1000060009
    VkStructureTypeAcquireNextImageInfoKhr = 1000060010
    VkStructureTypeDeviceGroupPresentInfoKhr = 1000060011
    VkStructureTypeDeviceGroupSwapchainCreateInfoKhr = 1000060012
    VkStructureTypeDisplayModeCreateInfoKhr = 1000002000
    VkStructureTypeDisplaySurfaceCreateInfoKhr = 1000002001
    VkStructureTypeDisplayPresentInfoKhr = 1000003000
    VkStructureTypeXlibSurfaceCreateInfoKhr = 1000004000
    VkStructureTypeXcbSurfaceCreateInfoKhr = 1000005000
    VkStructureTypeWaylandSurfaceCreateInfoKhr = 1000006000
    VkStructureTypeMirSurfaceCreateInfoKhr = 1000007000
    VkStructureTypeAndroidSurfaceCreateInfoKhr = 1000008000
    VkStructureTypeWin32SurfaceCreateInfoKhr = 1000009000
    VkStructureTypeDebugReportCallbackCreateInfoExt = 1000011000
    VkStructureTypePipelineRasterizationStateRasterizationOrderAmd = 1000018000
    VkStructureTypeDebugMarkerObjectNameInfoExt = 1000022000
    VkStructureTypeDebugMarkerObjectTagInfoExt = 1000022001
    VkStructureTypeDebugMarkerMarkerInfoExt = 1000022002
    VkStructureTypeDedicatedAllocationImageCreateInfoNv = 1000026000
    VkStructureTypeDedicatedAllocationBufferCreateInfoNv = 1000026001
    VkStructureTypeDedicatedAllocationMemoryAllocateInfoNv = 1000026002
    VkStructureTypeTextureLodGatherFormatPropertiesAmd = 1000041000
    VkStructureTypeExternalMemoryImageCreateInfoNv = 1000056000
    VkStructureTypeExportMemoryAllocateInfoNv = 1000056001
    VkStructureTypeImportMemoryWin32HandleInfoNv = 1000057000
    VkStructureTypeExportMemoryWin32HandleInfoNv = 1000057001
    VkStructureTypeWin32KeyedMutexAcquireReleaseInfoNv = 1000058000
    VkStructureTypeValidationFlagsExt = 1000061000
    VkStructureTypeViSurfaceCreateInfoNn = 1000062000
    VkStructureTypeImportMemoryWin32HandleInfoKhr = 1000073000
    VkStructureTypeExportMemoryWin32HandleInfoKhr = 1000073001
    VkStructureTypeMemoryWin32HandlePropertiesKhr = 1000073002
    VkStructureTypeMemoryGetWin32HandleInfoKhr = 1000073003
    VkStructureTypeImportMemoryFdInfoKhr = 1000074000
    VkStructureTypeMemoryFdPropertiesKhr = 1000074001
    VkStructureTypeMemoryGetFdInfoKhr = 1000074002
    VkStructureTypeWin32KeyedMutexAcquireReleaseInfoKhr = 1000075000
    VkStructureTypeImportSemaphoreWin32HandleInfoKhr = 1000078000
    VkStructureTypeExportSemaphoreWin32HandleInfoKhr = 1000078001
    VkStructureTypeD3D12FenceSubmitInfoKhr = 1000078002
    VkStructureTypeSemaphoreGetWin32HandleInfoKhr = 1000078003
    VkStructureTypeImportSemaphoreFdInfoKhr = 1000079000
    VkStructureTypeSemaphoreGetFdInfoKhr = 1000079001
    VkStructureTypePhysicalDevicePushDescriptorPropertiesKhr = 1000080000
    VkStructureTypeCommandBufferInheritanceConditionalRenderingInfoExt = 1000081000
    VkStructureTypePhysicalDeviceConditionalRenderingFeaturesExt = 1000081001
    VkStructureTypeConditionalRenderingBeginInfoExt = 1000081002
    VkStructureTypePresentRegionsKhr = 1000084000
    VkStructureTypeObjectTableCreateInfoNvx = 1000086000
    VkStructureTypeIndirectCommandsLayoutCreateInfoNvx = 1000086001
    VkStructureTypeCmdProcessCommandsInfoNvx = 1000086002
    VkStructureTypeCmdReserveSpaceForCommandsInfoNvx = 1000086003
    VkStructureTypeDeviceGeneratedCommandsLimitsNvx = 1000086004
    VkStructureTypeDeviceGeneratedCommandsFeaturesNvx = 1000086005
    VkStructureTypePipelineViewportWScalingStateCreateInfoNv = 1000087000
    VkStructureTypeSurfaceCapabilities2Ext = 1000090000
    VkStructureTypeDisplayPowerInfoExt = 1000091000
    VkStructureTypeDeviceEventInfoExt = 1000091001
    VkStructureTypeDisplayEventInfoExt = 1000091002
    VkStructureTypeSwapchainCounterCreateInfoExt = 1000091003
    VkStructureTypePresentTimesInfoGoogle = 1000092000
    VkStructureTypePhysicalDeviceMultiviewPerViewAttributesPropertiesNvx = 1000097000
    VkStructureTypePipelineViewportSwizzleStateCreateInfoNv = 1000098000
    VkStructureTypePhysicalDeviceDiscardRectanglePropertiesExt = 1000099000
    VkStructureTypePipelineDiscardRectangleStateCreateInfoExt = 1000099001
    VkStructureTypePhysicalDeviceConservativeRasterizationPropertiesExt = 1000101000
    VkStructureTypePipelineRasterizationConservativeStateCreateInfoExt = 1000101001
    VkStructureTypeHdrMetadataExt = 1000105000
    VkStructureTypeAttachmentDescription2Khr = 1000109000
    VkStructureTypeAttachmentReference2Khr = 1000109001
    VkStructureTypeSubpassDescription2Khr = 1000109002
    VkStructureTypeSubpassDependency2Khr = 1000109003
    VkStructureTypeRenderPassCreateInfo2Khr = 1000109004
    VkStructureTypeSubpassBeginInfoKhr = 1000109005
    VkStructureTypeSubpassEndInfoKhr = 1000109006
    VkStructureTypeSharedPresentSurfaceCapabilitiesKhr = 1000111000
    VkStructureTypeImportFenceWin32HandleInfoKhr = 1000114000
    VkStructureTypeExportFenceWin32HandleInfoKhr = 1000114001
    VkStructureTypeFenceGetWin32HandleInfoKhr = 1000114002
    VkStructureTypeImportFenceFdInfoKhr = 1000115000
    VkStructureTypeFenceGetFdInfoKhr = 1000115001
    VkStructureTypePhysicalDeviceSurfaceInfo2Khr = 1000119000
    VkStructureTypeSurfaceCapabilities2Khr = 1000119001
    VkStructureTypeSurfaceFormat2Khr = 1000119002
    VkStructureTypeDisplayProperties2Khr = 1000121000
    VkStructureTypeDisplayPlaneProperties2Khr = 1000121001
    VkStructureTypeDisplayModeProperties2Khr = 1000121002
    VkStructureTypeDisplayPlaneInfo2Khr = 1000121003
    VkStructureTypeDisplayPlaneCapabilities2Khr = 1000121004
    VkStructureTypeIosSurfaceCreateInfoMvk = 1000122000
    VkStructureTypeMacosSurfaceCreateInfoMvk = 1000123000
    VkStructureTypeDebugUtilsObjectNameInfoExt = 1000128000
    VkStructureTypeDebugUtilsObjectTagInfoExt = 1000128001
    VkStructureTypeDebugUtilsLabelExt = 1000128002
    VkStructureTypeDebugUtilsMessengerCallbackDataExt = 1000128003
    VkStructureTypeDebugUtilsMessengerCreateInfoExt = 1000128004
    VkStructureTypeAndroidHardwareBufferUsageAndroid = 1000129000
    VkStructureTypeAndroidHardwareBufferPropertiesAndroid = 1000129001
    VkStructureTypeAndroidHardwareBufferFormatPropertiesAndroid = 1000129002
    VkStructureTypeImportAndroidHardwareBufferInfoAndroid = 1000129003
    VkStructureTypeMemoryGetAndroidHardwareBufferInfoAndroid = 1000129004
    VkStructureTypeExternalFormatAndroid = 1000129005
    VkStructureTypePhysicalDeviceSamplerFilterMinmaxPropertiesExt = 1000130000
    VkStructureTypeSamplerReductionModeCreateInfoExt = 1000130001
    VkStructureTypeSampleLocationsInfoExt = 1000143000
    VkStructureTypeRenderPassSampleLocationsBeginInfoExt = 1000143001
    VkStructureTypePipelineSampleLocationsStateCreateInfoExt = 1000143002
    VkStructureTypePhysicalDeviceSampleLocationsPropertiesExt = 1000143003
    VkStructureTypeMultisamplePropertiesExt = 1000143004
    VkStructureTypeImageFormatListCreateInfoKhr = 1000147000
    VkStructureTypePhysicalDeviceBlendOperationAdvancedFeaturesExt = 1000148000
    VkStructureTypePhysicalDeviceBlendOperationAdvancedPropertiesExt = 1000148001
    VkStructureTypePipelineColorBlendAdvancedStateCreateInfoExt = 1000148002
    VkStructureTypePipelineCoverageToColorStateCreateInfoNv = 1000149000
    VkStructureTypePipelineCoverageModulationStateCreateInfoNv = 1000152000
    VkStructureTypeValidationCacheCreateInfoExt = 1000160000
    VkStructureTypeShaderModuleValidationCacheCreateInfoExt = 1000160001
    VkStructureTypeDescriptorSetLayoutBindingFlagsCreateInfoExt = 1000161000
    VkStructureTypePhysicalDeviceDescriptorIndexingFeaturesExt = 1000161001
    VkStructureTypePhysicalDeviceDescriptorIndexingPropertiesExt = 1000161002
    VkStructureTypeDescriptorSetVariableDescriptorCountAllocateInfoExt = 1000161003
    VkStructureTypeDescriptorSetVariableDescriptorCountLayoutSupportExt = 1000161004
    VkStructureTypeDeviceQueueGlobalPriorityCreateInfoExt = 1000174000
    VkStructureTypePhysicalDevice8BitStorageFeaturesKhr = 1000177000
    VkStructureTypeImportMemoryHostPointerInfoExt = 1000178000
    VkStructureTypeMemoryHostPointerPropertiesExt = 1000178001
    VkStructureTypePhysicalDeviceExternalMemoryHostPropertiesExt = 1000178002
    VkStructureTypePhysicalDeviceShaderCorePropertiesAmd = 1000185000
    VkStructureTypePhysicalDeviceVertexAttributeDivisorPropertiesExt = 1000190000
    VkStructureTypePipelineVertexInputDivisorStateCreateInfoExt = 1000190001
    VkStructureTypeCheckpointDataNv = 1000206000
    VkStructureTypeQueueFamilyCheckpointPropertiesNv = 1000206001
    VkStructureTypeRenderPassMultiviewCreateInfoKhr = 1000053000
    VkStructureTypePhysicalDeviceMultiviewFeaturesKhr = 1000053001
    VkStructureTypePhysicalDeviceMultiviewPropertiesKhr = 1000053002
    VkStructureTypePhysicalDeviceFeatures2Khr = 1000059000
    VkStructureTypePhysicalDeviceProperties2Khr = 1000059001
    VkStructureTypeFormatProperties2Khr = 1000059002
    VkStructureTypeImageFormatProperties2Khr = 1000059003
    VkStructureTypePhysicalDeviceImageFormatInfo2Khr = 1000059004
    VkStructureTypeQueueFamilyProperties2Khr = 1000059005
    VkStructureTypePhysicalDeviceMemoryProperties2Khr = 1000059006
    VkStructureTypeSparseImageFormatProperties2Khr = 1000059007
    VkStructureTypePhysicalDeviceSparseImageFormatInfo2Khr = 1000059008
    VkStructureTypeMemoryAllocateFlagsInfoKhr = 1000060000
    VkStructureTypeDeviceGroupRenderPassBeginInfoKhr = 1000060003
    VkStructureTypeDeviceGroupCommandBufferBeginInfoKhr = 1000060004
    VkStructureTypeDeviceGroupSubmitInfoKhr = 1000060005
    VkStructureTypeDeviceGroupBindSparseInfoKhr = 1000060006
    VkStructureTypeBindBufferMemoryDeviceGroupInfoKhr = 1000060013
    VkStructureTypeBindImageMemoryDeviceGroupInfoKhr = 1000060014
    VkStructureTypePhysicalDeviceGroupPropertiesKhr = 1000070000
    VkStructureTypeDeviceGroupDeviceCreateInfoKhr = 1000070001
    VkStructureTypePhysicalDeviceExternalImageFormatInfoKhr = 1000071000
    VkStructureTypeExternalImageFormatPropertiesKhr = 1000071001
    VkStructureTypePhysicalDeviceExternalBufferInfoKhr = 1000071002
    VkStructureTypeExternalBufferPropertiesKhr = 1000071003
    VkStructureTypePhysicalDeviceIdPropertiesKhr = 1000071004
    VkStructureTypeExternalMemoryBufferCreateInfoKhr = 1000072000
    VkStructureTypeExternalMemoryImageCreateInfoKhr = 1000072001
    VkStructureTypeExportMemoryAllocateInfoKhr = 1000072002
    VkStructureTypePhysicalDeviceExternalSemaphoreInfoKhr = 1000076000
    VkStructureTypeExternalSemaphorePropertiesKhr = 1000076001
    VkStructureTypeExportSemaphoreCreateInfoKhr = 1000077000
    VkStructureTypePhysicalDevice16BitStorageFeaturesKhr = 1000083000
    VkStructureTypeDescriptorUpdateTemplateCreateInfoKhr = 1000085000
    VkStructureTypePhysicalDeviceExternalFenceInfoKhr = 1000112000
    VkStructureTypeExternalFencePropertiesKhr = 1000112001
    VkStructureTypeExportFenceCreateInfoKhr = 1000113000
    VkStructureTypePhysicalDevicePointClippingPropertiesKhr = 1000117000
    VkStructureTypeRenderPassInputAttachmentAspectCreateInfoKhr = 1000117001
    VkStructureTypeImageViewUsageCreateInfoKhr = 1000117002
    VkStructureTypePipelineTessellationDomainOriginStateCreateInfoKhr = 1000117003
    VkStructureTypePhysicalDeviceVariablePointerFeaturesKhr = 1000120000
    VkStructureTypeMemoryDedicatedRequirementsKhr = 1000127000
    VkStructureTypeMemoryDedicatedAllocateInfoKhr = 1000127001
    VkStructureTypeBufferMemoryRequirementsInfo2Khr = 1000146000
    VkStructureTypeImageMemoryRequirementsInfo2Khr = 1000146001
    VkStructureTypeImageSparseMemoryRequirementsInfo2Khr = 1000146002
    VkStructureTypeMemoryRequirements2Khr = 1000146003
    VkStructureTypeSparseImageMemoryRequirements2Khr = 1000146004
    VkStructureTypeSamplerYcbcrConversionCreateInfoKhr = 1000156000
    VkStructureTypeSamplerYcbcrConversionInfoKhr = 1000156001
    VkStructureTypeBindImagePlaneMemoryInfoKhr = 1000156002
    VkStructureTypeImagePlaneMemoryRequirementsInfoKhr = 1000156003
    VkStructureTypePhysicalDeviceSamplerYcbcrConversionFeaturesKhr = 1000156004
    VkStructureTypeSamplerYcbcrConversionImageFormatPropertiesKhr = 1000156005
    VkStructureTypeBindBufferMemoryInfoKhr = 1000157000
    VkStructureTypeBindImageMemoryInfoKhr = 1000157001
    VkStructureTypePhysicalDeviceMaintenance3PropertiesKhr = 1000168000
    VkStructureTypeDescriptorSetLayoutSupportKhr = 1000168001
    VkStructureTypeBeginRange = 0
    VkStructureTypeEndRange = 48
    VkStructureTypeRangeSize = 49
    VkStructureTypeMaxEnum = 2147483647
  end
  alias X__Uint32T = LibC::UInt
  alias Uint32T = X__Uint32T
  struct InstanceCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : InstanceCreateFlags
    p_application_info : ApplicationInfo*
    enabled_layer_count : Uint32T
    pp_enabled_layer_names : LibC::Char**
    enabled_extension_count : Uint32T
    pp_enabled_extension_names : LibC::Char**
  end
  alias Flags = Uint32T
  alias InstanceCreateFlags = Flags
  struct AllocationCallbacks
    p_user_data : Void*
    pfn_allocation : PfnVkAllocationFunction
    pfn_reallocation : PfnVkReallocationFunction
    pfn_free : PfnVkFreeFunction
    pfn_internal_allocation : PfnVkInternalAllocationNotification
    pfn_internal_free : PfnVkInternalFreeNotification
  end
  enum SystemAllocationScope
    VkSystemAllocationScopeCommand = 0
    VkSystemAllocationScopeObject = 1
    VkSystemAllocationScopeCache = 2
    VkSystemAllocationScopeDevice = 3
    VkSystemAllocationScopeInstance = 4
    VkSystemAllocationScopeBeginRange = 0
    VkSystemAllocationScopeEndRange = 4
    VkSystemAllocationScopeRangeSize = 5
    VkSystemAllocationScopeMaxEnum = 2147483647
  end
  alias PfnVkAllocationFunction = (Void*, LibC::SizeT, LibC::SizeT, SystemAllocationScope -> Void*)
  alias PfnVkReallocationFunction = (Void*, Void*, LibC::SizeT, LibC::SizeT, SystemAllocationScope -> Void*)
  alias PfnVkFreeFunction = (Void*, Void* -> Void)
  enum InternalAllocationType
    VkInternalAllocationTypeExecutable = 0
    VkInternalAllocationTypeBeginRange = 0
    VkInternalAllocationTypeEndRange = 0
    VkInternalAllocationTypeRangeSize = 1
    VkInternalAllocationTypeMaxEnum = 2147483647
  end
  alias PfnVkInternalAllocationNotification = (Void*, LibC::SizeT, InternalAllocationType, SystemAllocationScope -> Void)
  alias PfnVkInternalFreeNotification = (Void*, LibC::SizeT, InternalAllocationType, SystemAllocationScope -> Void)
  struct PhysicalDeviceFeatures
    robust_buffer_access : Bool32
    full_draw_index_uint32 : Bool32
    image_cube_array : Bool32
    independent_blend : Bool32
    geometry_shader : Bool32
    tessellation_shader : Bool32
    sample_rate_shading : Bool32
    dual_src_blend : Bool32
    logic_op : Bool32
    multi_draw_indirect : Bool32
    draw_indirect_first_instance : Bool32
    depth_clamp : Bool32
    depth_bias_clamp : Bool32
    fill_mode_non_solid : Bool32
    depth_bounds : Bool32
    wide_lines : Bool32
    large_points : Bool32
    alpha_to_one : Bool32
    multi_viewport : Bool32
    sampler_anisotropy : Bool32
    texture_compression_etc2 : Bool32
    texture_compression_astc_ldr : Bool32
    texture_compression_bc : Bool32
    occlusion_query_precise : Bool32
    pipeline_statistics_query : Bool32
    vertex_pipeline_stores_and_atomics : Bool32
    fragment_stores_and_atomics : Bool32
    shader_tessellation_and_geometry_point_size : Bool32
    shader_image_gather_extended : Bool32
    shader_storage_image_extended_formats : Bool32
    shader_storage_image_multisample : Bool32
    shader_storage_image_read_without_format : Bool32
    shader_storage_image_write_without_format : Bool32
    shader_uniform_buffer_array_dynamic_indexing : Bool32
    shader_sampled_image_array_dynamic_indexing : Bool32
    shader_storage_buffer_array_dynamic_indexing : Bool32
    shader_storage_image_array_dynamic_indexing : Bool32
    shader_clip_distance : Bool32
    shader_cull_distance : Bool32
    shader_float64 : Bool32
    shader_int64 : Bool32
    shader_int16 : Bool32
    shader_resource_residency : Bool32
    shader_resource_min_lod : Bool32
    sparse_binding : Bool32
    sparse_residency_buffer : Bool32
    sparse_residency_image_2d : Bool32
    sparse_residency_image_3d : Bool32
    sparse_residency_2_samples : Bool32
    sparse_residency_4_samples : Bool32
    sparse_residency_8_samples : Bool32
    sparse_residency_16_samples : Bool32
    sparse_residency_aliased : Bool32
    variable_multisample_rate : Bool32
    inherited_queries : Bool32
  end
  alias Bool32 = Uint32T
  struct FormatProperties
    linear_tiling_features : FormatFeatureFlags
    optimal_tiling_features : FormatFeatureFlags
    buffer_features : FormatFeatureFlags
  end
  alias FormatFeatureFlags = Flags
  struct Extent3D
    width : Uint32T
    height : Uint32T
    depth : Uint32T
  end
  struct ImageFormatProperties
    max_extent : Extent3D
    max_mip_levels : Uint32T
    max_array_layers : Uint32T
    sample_counts : SampleCountFlags
    max_resource_size : DeviceSize
  end
  alias SampleCountFlags = Flags
  alias X__Uint64T = LibC::ULong
  alias Uint64T = X__Uint64T
  alias DeviceSize = Uint64T
  struct PhysicalDeviceLimits
    max_image_dimension_1d : Uint32T
    max_image_dimension_2d : Uint32T
    max_image_dimension_3d : Uint32T
    max_image_dimension_cube : Uint32T
    max_image_array_layers : Uint32T
    max_texel_buffer_elements : Uint32T
    max_uniform_buffer_range : Uint32T
    max_storage_buffer_range : Uint32T
    max_push_constants_size : Uint32T
    max_memory_allocation_count : Uint32T
    max_sampler_allocation_count : Uint32T
    buffer_image_granularity : DeviceSize
    sparse_address_space_size : DeviceSize
    max_bound_descriptor_sets : Uint32T
    max_per_stage_descriptor_samplers : Uint32T
    max_per_stage_descriptor_uniform_buffers : Uint32T
    max_per_stage_descriptor_storage_buffers : Uint32T
    max_per_stage_descriptor_sampled_images : Uint32T
    max_per_stage_descriptor_storage_images : Uint32T
    max_per_stage_descriptor_input_attachments : Uint32T
    max_per_stage_resources : Uint32T
    max_descriptor_set_samplers : Uint32T
    max_descriptor_set_uniform_buffers : Uint32T
    max_descriptor_set_uniform_buffers_dynamic : Uint32T
    max_descriptor_set_storage_buffers : Uint32T
    max_descriptor_set_storage_buffers_dynamic : Uint32T
    max_descriptor_set_sampled_images : Uint32T
    max_descriptor_set_storage_images : Uint32T
    max_descriptor_set_input_attachments : Uint32T
    max_vertex_input_attributes : Uint32T
    max_vertex_input_bindings : Uint32T
    max_vertex_input_attribute_offset : Uint32T
    max_vertex_input_binding_stride : Uint32T
    max_vertex_output_components : Uint32T
    max_tessellation_generation_level : Uint32T
    max_tessellation_patch_size : Uint32T
    max_tessellation_control_per_vertex_input_components : Uint32T
    max_tessellation_control_per_vertex_output_components : Uint32T
    max_tessellation_control_per_patch_output_components : Uint32T
    max_tessellation_control_total_output_components : Uint32T
    max_tessellation_evaluation_input_components : Uint32T
    max_tessellation_evaluation_output_components : Uint32T
    max_geometry_shader_invocations : Uint32T
    max_geometry_input_components : Uint32T
    max_geometry_output_components : Uint32T
    max_geometry_output_vertices : Uint32T
    max_geometry_total_output_components : Uint32T
    max_fragment_input_components : Uint32T
    max_fragment_output_attachments : Uint32T
    max_fragment_dual_src_attachments : Uint32T
    max_fragment_combined_output_resources : Uint32T
    max_compute_shared_memory_size : Uint32T
    max_compute_work_group_count : Uint32T[3]
    max_compute_work_group_invocations : Uint32T
    max_compute_work_group_size : Uint32T[3]
    sub_pixel_precision_bits : Uint32T
    sub_texel_precision_bits : Uint32T
    mipmap_precision_bits : Uint32T
    max_draw_indexed_index_value : Uint32T
    max_draw_indirect_count : Uint32T
    max_sampler_lod_bias : LibC::Float
    max_sampler_anisotropy : LibC::Float
    max_viewports : Uint32T
    max_viewport_dimensions : Uint32T[2]
    viewport_bounds_range : LibC::Float[2]
    viewport_sub_pixel_bits : Uint32T
    min_memory_map_alignment : LibC::SizeT
    min_texel_buffer_offset_alignment : DeviceSize
    min_uniform_buffer_offset_alignment : DeviceSize
    min_storage_buffer_offset_alignment : DeviceSize
    min_texel_offset : Int32T
    max_texel_offset : Uint32T
    min_texel_gather_offset : Int32T
    max_texel_gather_offset : Uint32T
    min_interpolation_offset : LibC::Float
    max_interpolation_offset : LibC::Float
    sub_pixel_interpolation_offset_bits : Uint32T
    max_framebuffer_width : Uint32T
    max_framebuffer_height : Uint32T
    max_framebuffer_layers : Uint32T
    framebuffer_color_sample_counts : SampleCountFlags
    framebuffer_depth_sample_counts : SampleCountFlags
    framebuffer_stencil_sample_counts : SampleCountFlags
    framebuffer_no_attachments_sample_counts : SampleCountFlags
    max_color_attachments : Uint32T
    sampled_image_color_sample_counts : SampleCountFlags
    sampled_image_integer_sample_counts : SampleCountFlags
    sampled_image_depth_sample_counts : SampleCountFlags
    sampled_image_stencil_sample_counts : SampleCountFlags
    storage_image_sample_counts : SampleCountFlags
    max_sample_mask_words : Uint32T
    timestamp_compute_and_graphics : Bool32
    timestamp_period : LibC::Float
    max_clip_distances : Uint32T
    max_cull_distances : Uint32T
    max_combined_clip_and_cull_distances : Uint32T
    discrete_queue_priorities : Uint32T
    point_size_range : LibC::Float[2]
    line_width_range : LibC::Float[2]
    point_size_granularity : LibC::Float
    line_width_granularity : LibC::Float
    strict_lines : Bool32
    standard_sample_locations : Bool32
    optimal_buffer_copy_offset_alignment : DeviceSize
    optimal_buffer_copy_row_pitch_alignment : DeviceSize
    non_coherent_atom_size : DeviceSize
  end
  alias X__Int32T = LibC::Int
  alias Int32T = X__Int32T
  struct PhysicalDeviceSparseProperties
    residency_standard_2d_block_shape : Bool32
    residency_standard_2d_multisample_block_shape : Bool32
    residency_standard_3d_block_shape : Bool32
    residency_aligned_mip_size : Bool32
    residency_non_resident_strict : Bool32
  end
  struct PhysicalDeviceProperties
    api_version : Uint32T
    driver_version : Uint32T
    vendor_id : Uint32T
    device_id : Uint32T
    device_type : PhysicalDeviceType
    device_name : LibC::Char[256]
    pipeline_cache_uuid : Uint8T[16]
    limits : PhysicalDeviceLimits
    sparse_properties : PhysicalDeviceSparseProperties
  end
  enum PhysicalDeviceType
    VkPhysicalDeviceTypeOther = 0
    VkPhysicalDeviceTypeIntegratedGpu = 1
    VkPhysicalDeviceTypeDiscreteGpu = 2
    VkPhysicalDeviceTypeVirtualGpu = 3
    VkPhysicalDeviceTypeCpu = 4
    VkPhysicalDeviceTypeBeginRange = 0
    VkPhysicalDeviceTypeEndRange = 4
    VkPhysicalDeviceTypeRangeSize = 5
    VkPhysicalDeviceTypeMaxEnum = 2147483647
  end
  alias X__Uint8T = UInt8
  alias Uint8T = X__Uint8T
  struct QueueFamilyProperties
    queue_flags : QueueFlags
    queue_count : Uint32T
    timestamp_valid_bits : Uint32T
    min_image_transfer_granularity : Extent3D
  end
  alias QueueFlags = Flags
  struct MemoryType
    property_flags : MemoryPropertyFlags
    heap_index : Uint32T
  end
  alias MemoryPropertyFlags = Flags
  struct MemoryHeap
    size : DeviceSize
    flags : MemoryHeapFlags
  end
  alias MemoryHeapFlags = Flags
  struct PhysicalDeviceMemoryProperties
    memory_type_count : Uint32T
    memory_types : MemoryType[32]
    memory_heap_count : Uint32T
    memory_heaps : MemoryHeap[16]
  end
  struct DeviceQueueCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : DeviceQueueCreateFlags
    queue_family_index : Uint32T
    queue_count : Uint32T
    p_queue_priorities : LibC::Float*
  end
  alias DeviceQueueCreateFlags = Flags
  struct DeviceCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : DeviceCreateFlags
    queue_create_info_count : Uint32T
    p_queue_create_infos : DeviceQueueCreateInfo*
    enabled_layer_count : Uint32T
    pp_enabled_layer_names : LibC::Char**
    enabled_extension_count : Uint32T
    pp_enabled_extension_names : LibC::Char**
    p_enabled_features : PhysicalDeviceFeatures*
  end
  alias DeviceCreateFlags = Flags
  struct ExtensionProperties
    extension_name : LibC::Char[256]
    spec_version : Uint32T
  end
  struct LayerProperties
    layer_name : LibC::Char[256]
    spec_version : Uint32T
    implementation_version : Uint32T
    description : LibC::Char[256]
  end
  struct SubmitInfo
    s_type : StructureType
    p_next : Void*
    wait_semaphore_count : Uint32T
    p_wait_semaphores : Semaphore*
    p_wait_dst_stage_mask : PipelineStageFlags*
    command_buffer_count : Uint32T
    p_command_buffers : CommandBuffer*
    signal_semaphore_count : Uint32T
    p_signal_semaphores : Semaphore*
  end
  type Semaphore = Void*
  alias PipelineStageFlags = Flags
  type CommandBuffer = Void*
  struct MemoryAllocateInfo
    s_type : StructureType
    p_next : Void*
    allocation_size : DeviceSize
    memory_type_index : Uint32T
  end
  struct MappedMemoryRange
    s_type : StructureType
    p_next : Void*
    memory : DeviceMemory
    offset : DeviceSize
    size : DeviceSize
  end
  type DeviceMemory = Void*
  struct MemoryRequirements
    size : DeviceSize
    alignment : DeviceSize
    memory_type_bits : Uint32T
  end
  struct SparseImageFormatProperties
    aspect_mask : ImageAspectFlags
    image_granularity : Extent3D
    flags : SparseImageFormatFlags
  end
  alias ImageAspectFlags = Flags
  alias SparseImageFormatFlags = Flags
  struct SparseImageMemoryRequirements
    format_properties : SparseImageFormatProperties
    image_mip_tail_first_lod : Uint32T
    image_mip_tail_size : DeviceSize
    image_mip_tail_offset : DeviceSize
    image_mip_tail_stride : DeviceSize
  end
  struct SparseMemoryBind
    resource_offset : DeviceSize
    size : DeviceSize
    memory : DeviceMemory
    memory_offset : DeviceSize
    flags : SparseMemoryBindFlags
  end
  alias SparseMemoryBindFlags = Flags
  struct SparseBufferMemoryBindInfo
    buffer : Buffer
    bind_count : Uint32T
    p_binds : SparseMemoryBind*
  end
  type Buffer = Void*
  struct SparseImageOpaqueMemoryBindInfo
    image : Image
    bind_count : Uint32T
    p_binds : SparseMemoryBind*
  end
  type Image = Void*
  struct ImageSubresource
    aspect_mask : ImageAspectFlags
    mip_level : Uint32T
    array_layer : Uint32T
  end
  struct Offset3D
    x : Int32T
    y : Int32T
    z : Int32T
  end
  struct SparseImageMemoryBind
    subresource : ImageSubresource
    offset : Offset3D
    extent : Extent3D
    memory : DeviceMemory
    memory_offset : DeviceSize
    flags : SparseMemoryBindFlags
  end
  struct SparseImageMemoryBindInfo
    image : Image
    bind_count : Uint32T
    p_binds : SparseImageMemoryBind*
  end
  struct BindSparseInfo
    s_type : StructureType
    p_next : Void*
    wait_semaphore_count : Uint32T
    p_wait_semaphores : Semaphore*
    buffer_bind_count : Uint32T
    p_buffer_binds : SparseBufferMemoryBindInfo*
    image_opaque_bind_count : Uint32T
    p_image_opaque_binds : SparseImageOpaqueMemoryBindInfo*
    image_bind_count : Uint32T
    p_image_binds : SparseImageMemoryBindInfo*
    signal_semaphore_count : Uint32T
    p_signal_semaphores : Semaphore*
  end
  struct FenceCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : FenceCreateFlags
  end
  alias FenceCreateFlags = Flags
  struct SemaphoreCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : SemaphoreCreateFlags
  end
  alias SemaphoreCreateFlags = Flags
  struct EventCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : EventCreateFlags
  end
  alias EventCreateFlags = Flags
  struct QueryPoolCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : QueryPoolCreateFlags
    query_type : QueryType
    query_count : Uint32T
    pipeline_statistics : QueryPipelineStatisticFlags
  end
  alias QueryPoolCreateFlags = Flags
  enum QueryType
    VkQueryTypeOcclusion = 0
    VkQueryTypePipelineStatistics = 1
    VkQueryTypeTimestamp = 2
    VkQueryTypeBeginRange = 0
    VkQueryTypeEndRange = 2
    VkQueryTypeRangeSize = 3
    VkQueryTypeMaxEnum = 2147483647
  end
  alias QueryPipelineStatisticFlags = Flags
  struct BufferCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : BufferCreateFlags
    size : DeviceSize
    usage : BufferUsageFlags
    sharing_mode : SharingMode
    queue_family_index_count : Uint32T
    p_queue_family_indices : Uint32T*
  end
  alias BufferCreateFlags = Flags
  alias BufferUsageFlags = Flags
  enum SharingMode
    VkSharingModeExclusive = 0
    VkSharingModeConcurrent = 1
    VkSharingModeBeginRange = 0
    VkSharingModeEndRange = 1
    VkSharingModeRangeSize = 2
    VkSharingModeMaxEnum = 2147483647
  end
  struct BufferViewCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : BufferViewCreateFlags
    buffer : Buffer
    format : Format
    offset : DeviceSize
    range : DeviceSize
  end
  alias BufferViewCreateFlags = Flags
  enum Format
    VkFormatUndefined = 0
    VkFormatR4G4UnormPack8 = 1
    VkFormatR4G4B4A4UnormPack16 = 2
    VkFormatB4G4R4A4UnormPack16 = 3
    VkFormatR5G6B5UnormPack16 = 4
    VkFormatB5G6R5UnormPack16 = 5
    VkFormatR5G5B5A1UnormPack16 = 6
    VkFormatB5G5R5A1UnormPack16 = 7
    VkFormatA1R5G5B5UnormPack16 = 8
    VkFormatR8Unorm = 9
    VkFormatR8Snorm = 10
    VkFormatR8Uscaled = 11
    VkFormatR8Sscaled = 12
    VkFormatR8Uint = 13
    VkFormatR8Sint = 14
    VkFormatR8Srgb = 15
    VkFormatR8G8Unorm = 16
    VkFormatR8G8Snorm = 17
    VkFormatR8G8Uscaled = 18
    VkFormatR8G8Sscaled = 19
    VkFormatR8G8Uint = 20
    VkFormatR8G8Sint = 21
    VkFormatR8G8Srgb = 22
    VkFormatR8G8B8Unorm = 23
    VkFormatR8G8B8Snorm = 24
    VkFormatR8G8B8Uscaled = 25
    VkFormatR8G8B8Sscaled = 26
    VkFormatR8G8B8Uint = 27
    VkFormatR8G8B8Sint = 28
    VkFormatR8G8B8Srgb = 29
    VkFormatB8G8R8Unorm = 30
    VkFormatB8G8R8Snorm = 31
    VkFormatB8G8R8Uscaled = 32
    VkFormatB8G8R8Sscaled = 33
    VkFormatB8G8R8Uint = 34
    VkFormatB8G8R8Sint = 35
    VkFormatB8G8R8Srgb = 36
    VkFormatR8G8B8A8Unorm = 37
    VkFormatR8G8B8A8Snorm = 38
    VkFormatR8G8B8A8Uscaled = 39
    VkFormatR8G8B8A8Sscaled = 40
    VkFormatR8G8B8A8Uint = 41
    VkFormatR8G8B8A8Sint = 42
    VkFormatR8G8B8A8Srgb = 43
    VkFormatB8G8R8A8Unorm = 44
    VkFormatB8G8R8A8Snorm = 45
    VkFormatB8G8R8A8Uscaled = 46
    VkFormatB8G8R8A8Sscaled = 47
    VkFormatB8G8R8A8Uint = 48
    VkFormatB8G8R8A8Sint = 49
    VkFormatB8G8R8A8Srgb = 50
    VkFormatA8B8G8R8UnormPack32 = 51
    VkFormatA8B8G8R8SnormPack32 = 52
    VkFormatA8B8G8R8UscaledPack32 = 53
    VkFormatA8B8G8R8SscaledPack32 = 54
    VkFormatA8B8G8R8UintPack32 = 55
    VkFormatA8B8G8R8SintPack32 = 56
    VkFormatA8B8G8R8SrgbPack32 = 57
    VkFormatA2R10G10B10UnormPack32 = 58
    VkFormatA2R10G10B10SnormPack32 = 59
    VkFormatA2R10G10B10UscaledPack32 = 60
    VkFormatA2R10G10B10SscaledPack32 = 61
    VkFormatA2R10G10B10UintPack32 = 62
    VkFormatA2R10G10B10SintPack32 = 63
    VkFormatA2B10G10R10UnormPack32 = 64
    VkFormatA2B10G10R10SnormPack32 = 65
    VkFormatA2B10G10R10UscaledPack32 = 66
    VkFormatA2B10G10R10SscaledPack32 = 67
    VkFormatA2B10G10R10UintPack32 = 68
    VkFormatA2B10G10R10SintPack32 = 69
    VkFormatR16Unorm = 70
    VkFormatR16Snorm = 71
    VkFormatR16Uscaled = 72
    VkFormatR16Sscaled = 73
    VkFormatR16Uint = 74
    VkFormatR16Sint = 75
    VkFormatR16Sfloat = 76
    VkFormatR16G16Unorm = 77
    VkFormatR16G16Snorm = 78
    VkFormatR16G16Uscaled = 79
    VkFormatR16G16Sscaled = 80
    VkFormatR16G16Uint = 81
    VkFormatR16G16Sint = 82
    VkFormatR16G16Sfloat = 83
    VkFormatR16G16B16Unorm = 84
    VkFormatR16G16B16Snorm = 85
    VkFormatR16G16B16Uscaled = 86
    VkFormatR16G16B16Sscaled = 87
    VkFormatR16G16B16Uint = 88
    VkFormatR16G16B16Sint = 89
    VkFormatR16G16B16Sfloat = 90
    VkFormatR16G16B16A16Unorm = 91
    VkFormatR16G16B16A16Snorm = 92
    VkFormatR16G16B16A16Uscaled = 93
    VkFormatR16G16B16A16Sscaled = 94
    VkFormatR16G16B16A16Uint = 95
    VkFormatR16G16B16A16Sint = 96
    VkFormatR16G16B16A16Sfloat = 97
    VkFormatR32Uint = 98
    VkFormatR32Sint = 99
    VkFormatR32Sfloat = 100
    VkFormatR32G32Uint = 101
    VkFormatR32G32Sint = 102
    VkFormatR32G32Sfloat = 103
    VkFormatR32G32B32Uint = 104
    VkFormatR32G32B32Sint = 105
    VkFormatR32G32B32Sfloat = 106
    VkFormatR32G32B32A32Uint = 107
    VkFormatR32G32B32A32Sint = 108
    VkFormatR32G32B32A32Sfloat = 109
    VkFormatR64Uint = 110
    VkFormatR64Sint = 111
    VkFormatR64Sfloat = 112
    VkFormatR64G64Uint = 113
    VkFormatR64G64Sint = 114
    VkFormatR64G64Sfloat = 115
    VkFormatR64G64B64Uint = 116
    VkFormatR64G64B64Sint = 117
    VkFormatR64G64B64Sfloat = 118
    VkFormatR64G64B64A64Uint = 119
    VkFormatR64G64B64A64Sint = 120
    VkFormatR64G64B64A64Sfloat = 121
    VkFormatB10G11R11UfloatPack32 = 122
    VkFormatE5B9G9R9UfloatPack32 = 123
    VkFormatD16Unorm = 124
    VkFormatX8D24UnormPack32 = 125
    VkFormatD32Sfloat = 126
    VkFormatS8Uint = 127
    VkFormatD16UnormS8Uint = 128
    VkFormatD24UnormS8Uint = 129
    VkFormatD32SfloatS8Uint = 130
    VkFormatBc1RgbUnormBlock = 131
    VkFormatBc1RgbSrgbBlock = 132
    VkFormatBc1RgbaUnormBlock = 133
    VkFormatBc1RgbaSrgbBlock = 134
    VkFormatBc2UnormBlock = 135
    VkFormatBc2SrgbBlock = 136
    VkFormatBc3UnormBlock = 137
    VkFormatBc3SrgbBlock = 138
    VkFormatBc4UnormBlock = 139
    VkFormatBc4SnormBlock = 140
    VkFormatBc5UnormBlock = 141
    VkFormatBc5SnormBlock = 142
    VkFormatBc6HUfloatBlock = 143
    VkFormatBc6HSfloatBlock = 144
    VkFormatBc7UnormBlock = 145
    VkFormatBc7SrgbBlock = 146
    VkFormatEtc2R8G8B8UnormBlock = 147
    VkFormatEtc2R8G8B8SrgbBlock = 148
    VkFormatEtc2R8G8B8A1UnormBlock = 149
    VkFormatEtc2R8G8B8A1SrgbBlock = 150
    VkFormatEtc2R8G8B8A8UnormBlock = 151
    VkFormatEtc2R8G8B8A8SrgbBlock = 152
    VkFormatEacR11UnormBlock = 153
    VkFormatEacR11SnormBlock = 154
    VkFormatEacR11G11UnormBlock = 155
    VkFormatEacR11G11SnormBlock = 156
    VkFormatAstc4x4UnormBlock = 157
    VkFormatAstc4x4SrgbBlock = 158
    VkFormatAstc5x4UnormBlock = 159
    VkFormatAstc5x4SrgbBlock = 160
    VkFormatAstc5x5UnormBlock = 161
    VkFormatAstc5x5SrgbBlock = 162
    VkFormatAstc6x5UnormBlock = 163
    VkFormatAstc6x5SrgbBlock = 164
    VkFormatAstc6x6UnormBlock = 165
    VkFormatAstc6x6SrgbBlock = 166
    VkFormatAstc8x5UnormBlock = 167
    VkFormatAstc8x5SrgbBlock = 168
    VkFormatAstc8x6UnormBlock = 169
    VkFormatAstc8x6SrgbBlock = 170
    VkFormatAstc8x8UnormBlock = 171
    VkFormatAstc8x8SrgbBlock = 172
    VkFormatAstc10x5UnormBlock = 173
    VkFormatAstc10x5SrgbBlock = 174
    VkFormatAstc10x6UnormBlock = 175
    VkFormatAstc10x6SrgbBlock = 176
    VkFormatAstc10x8UnormBlock = 177
    VkFormatAstc10x8SrgbBlock = 178
    VkFormatAstc10x10UnormBlock = 179
    VkFormatAstc10x10SrgbBlock = 180
    VkFormatAstc12x10UnormBlock = 181
    VkFormatAstc12x10SrgbBlock = 182
    VkFormatAstc12x12UnormBlock = 183
    VkFormatAstc12x12SrgbBlock = 184
    VkFormatG8B8G8R8422Unorm = 1000156000
    VkFormatB8G8R8G8422Unorm = 1000156001
    VkFormatG8B8R83Plane420Unorm = 1000156002
    VkFormatG8B8R82Plane420Unorm = 1000156003
    VkFormatG8B8R83Plane422Unorm = 1000156004
    VkFormatG8B8R82Plane422Unorm = 1000156005
    VkFormatG8B8R83Plane444Unorm = 1000156006
    VkFormatR10X6UnormPack16 = 1000156007
    VkFormatR10X6G10X6Unorm2Pack16 = 1000156008
    VkFormatR10X6G10X6B10X6A10X6Unorm4Pack16 = 1000156009
    VkFormatG10X6B10X6G10X6R10X6422Unorm4Pack16 = 1000156010
    VkFormatB10X6G10X6R10X6G10X6422Unorm4Pack16 = 1000156011
    VkFormatG10X6B10X6R10X63Plane420Unorm3Pack16 = 1000156012
    VkFormatG10X6B10X6R10X62Plane420Unorm3Pack16 = 1000156013
    VkFormatG10X6B10X6R10X63Plane422Unorm3Pack16 = 1000156014
    VkFormatG10X6B10X6R10X62Plane422Unorm3Pack16 = 1000156015
    VkFormatG10X6B10X6R10X63Plane444Unorm3Pack16 = 1000156016
    VkFormatR12X4UnormPack16 = 1000156017
    VkFormatR12X4G12X4Unorm2Pack16 = 1000156018
    VkFormatR12X4G12X4B12X4A12X4Unorm4Pack16 = 1000156019
    VkFormatG12X4B12X4G12X4R12X4422Unorm4Pack16 = 1000156020
    VkFormatB12X4G12X4R12X4G12X4422Unorm4Pack16 = 1000156021
    VkFormatG12X4B12X4R12X43Plane420Unorm3Pack16 = 1000156022
    VkFormatG12X4B12X4R12X42Plane420Unorm3Pack16 = 1000156023
    VkFormatG12X4B12X4R12X43Plane422Unorm3Pack16 = 1000156024
    VkFormatG12X4B12X4R12X42Plane422Unorm3Pack16 = 1000156025
    VkFormatG12X4B12X4R12X43Plane444Unorm3Pack16 = 1000156026
    VkFormatG16B16G16R16422Unorm = 1000156027
    VkFormatB16G16R16G16422Unorm = 1000156028
    VkFormatG16B16R163Plane420Unorm = 1000156029
    VkFormatG16B16R162Plane420Unorm = 1000156030
    VkFormatG16B16R163Plane422Unorm = 1000156031
    VkFormatG16B16R162Plane422Unorm = 1000156032
    VkFormatG16B16R163Plane444Unorm = 1000156033
    VkFormatPvrtc12BppUnormBlockImg = 1000054000
    VkFormatPvrtc14BppUnormBlockImg = 1000054001
    VkFormatPvrtc22BppUnormBlockImg = 1000054002
    VkFormatPvrtc24BppUnormBlockImg = 1000054003
    VkFormatPvrtc12BppSrgbBlockImg = 1000054004
    VkFormatPvrtc14BppSrgbBlockImg = 1000054005
    VkFormatPvrtc22BppSrgbBlockImg = 1000054006
    VkFormatPvrtc24BppSrgbBlockImg = 1000054007
    VkFormatG8B8G8R8422UnormKhr = 1000156000
    VkFormatB8G8R8G8422UnormKhr = 1000156001
    VkFormatG8B8R83Plane420UnormKhr = 1000156002
    VkFormatG8B8R82Plane420UnormKhr = 1000156003
    VkFormatG8B8R83Plane422UnormKhr = 1000156004
    VkFormatG8B8R82Plane422UnormKhr = 1000156005
    VkFormatG8B8R83Plane444UnormKhr = 1000156006
    VkFormatR10X6UnormPack16Khr = 1000156007
    VkFormatR10X6G10X6Unorm2Pack16Khr = 1000156008
    VkFormatR10X6G10X6B10X6A10X6Unorm4Pack16Khr = 1000156009
    VkFormatG10X6B10X6G10X6R10X6422Unorm4Pack16Khr = 1000156010
    VkFormatB10X6G10X6R10X6G10X6422Unorm4Pack16Khr = 1000156011
    VkFormatG10X6B10X6R10X63Plane420Unorm3Pack16Khr = 1000156012
    VkFormatG10X6B10X6R10X62Plane420Unorm3Pack16Khr = 1000156013
    VkFormatG10X6B10X6R10X63Plane422Unorm3Pack16Khr = 1000156014
    VkFormatG10X6B10X6R10X62Plane422Unorm3Pack16Khr = 1000156015
    VkFormatG10X6B10X6R10X63Plane444Unorm3Pack16Khr = 1000156016
    VkFormatR12X4UnormPack16Khr = 1000156017
    VkFormatR12X4G12X4Unorm2Pack16Khr = 1000156018
    VkFormatR12X4G12X4B12X4A12X4Unorm4Pack16Khr = 1000156019
    VkFormatG12X4B12X4G12X4R12X4422Unorm4Pack16Khr = 1000156020
    VkFormatB12X4G12X4R12X4G12X4422Unorm4Pack16Khr = 1000156021
    VkFormatG12X4B12X4R12X43Plane420Unorm3Pack16Khr = 1000156022
    VkFormatG12X4B12X4R12X42Plane420Unorm3Pack16Khr = 1000156023
    VkFormatG12X4B12X4R12X43Plane422Unorm3Pack16Khr = 1000156024
    VkFormatG12X4B12X4R12X42Plane422Unorm3Pack16Khr = 1000156025
    VkFormatG12X4B12X4R12X43Plane444Unorm3Pack16Khr = 1000156026
    VkFormatG16B16G16R16422UnormKhr = 1000156027
    VkFormatB16G16R16G16422UnormKhr = 1000156028
    VkFormatG16B16R163Plane420UnormKhr = 1000156029
    VkFormatG16B16R162Plane420UnormKhr = 1000156030
    VkFormatG16B16R163Plane422UnormKhr = 1000156031
    VkFormatG16B16R162Plane422UnormKhr = 1000156032
    VkFormatG16B16R163Plane444UnormKhr = 1000156033
    VkFormatBeginRange = 0
    VkFormatEndRange = 184
    VkFormatRangeSize = 185
    VkFormatMaxEnum = 2147483647
  end
  struct ImageCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : ImageCreateFlags
    image_type : ImageType
    format : Format
    extent : Extent3D
    mip_levels : Uint32T
    array_layers : Uint32T
    samples : SampleCountFlagBits
    tiling : ImageTiling
    usage : ImageUsageFlags
    sharing_mode : SharingMode
    queue_family_index_count : Uint32T
    p_queue_family_indices : Uint32T*
    initial_layout : ImageLayout
  end
  alias ImageCreateFlags = Flags
  enum ImageType
    VkImageType1D = 0
    VkImageType2D = 1
    VkImageType3D = 2
    VkImageTypeBeginRange = 0
    VkImageTypeEndRange = 2
    VkImageTypeRangeSize = 3
    VkImageTypeMaxEnum = 2147483647
  end
  enum SampleCountFlagBits
    VkSampleCount1Bit = 1
    VkSampleCount2Bit = 2
    VkSampleCount4Bit = 4
    VkSampleCount8Bit = 8
    VkSampleCount16Bit = 16
    VkSampleCount32Bit = 32
    VkSampleCount64Bit = 64
    VkSampleCountFlagBitsMaxEnum = 2147483647
  end
  enum ImageTiling
    VkImageTilingOptimal = 0
    VkImageTilingLinear = 1
    VkImageTilingBeginRange = 0
    VkImageTilingEndRange = 1
    VkImageTilingRangeSize = 2
    VkImageTilingMaxEnum = 2147483647
  end
  alias ImageUsageFlags = Flags
  enum ImageLayout
    VkImageLayoutUndefined = 0
    VkImageLayoutGeneral = 1
    VkImageLayoutColorAttachmentOptimal = 2
    VkImageLayoutDepthStencilAttachmentOptimal = 3
    VkImageLayoutDepthStencilReadOnlyOptimal = 4
    VkImageLayoutShaderReadOnlyOptimal = 5
    VkImageLayoutTransferSrcOptimal = 6
    VkImageLayoutTransferDstOptimal = 7
    VkImageLayoutPreinitialized = 8
    VkImageLayoutDepthReadOnlyStencilAttachmentOptimal = 1000117000
    VkImageLayoutDepthAttachmentStencilReadOnlyOptimal = 1000117001
    VkImageLayoutPresentSrcKhr = 1000001002
    VkImageLayoutSharedPresentKhr = 1000111000
    VkImageLayoutDepthReadOnlyStencilAttachmentOptimalKhr = 1000117000
    VkImageLayoutDepthAttachmentStencilReadOnlyOptimalKhr = 1000117001
    VkImageLayoutBeginRange = 0
    VkImageLayoutEndRange = 8
    VkImageLayoutRangeSize = 9
    VkImageLayoutMaxEnum = 2147483647
  end
  struct SubresourceLayout
    offset : DeviceSize
    size : DeviceSize
    row_pitch : DeviceSize
    array_pitch : DeviceSize
    depth_pitch : DeviceSize
  end
  struct ComponentMapping
    r : ComponentSwizzle
    g : ComponentSwizzle
    b : ComponentSwizzle
    a : ComponentSwizzle
  end
  enum ComponentSwizzle
    VkComponentSwizzleIdentity = 0
    VkComponentSwizzleZero = 1
    VkComponentSwizzleOne = 2
    VkComponentSwizzleR = 3
    VkComponentSwizzleG = 4
    VkComponentSwizzleB = 5
    VkComponentSwizzleA = 6
    VkComponentSwizzleBeginRange = 0
    VkComponentSwizzleEndRange = 6
    VkComponentSwizzleRangeSize = 7
    VkComponentSwizzleMaxEnum = 2147483647
  end
  struct ImageSubresourceRange
    aspect_mask : ImageAspectFlags
    base_mip_level : Uint32T
    level_count : Uint32T
    base_array_layer : Uint32T
    layer_count : Uint32T
  end
  struct ImageViewCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : ImageViewCreateFlags
    image : Image
    view_type : ImageViewType
    format : Format
    components : ComponentMapping
    subresource_range : ImageSubresourceRange
  end
  alias ImageViewCreateFlags = Flags
  enum ImageViewType
    VkImageViewType1D = 0
    VkImageViewType2D = 1
    VkImageViewType3D = 2
    VkImageViewTypeCube = 3
    VkImageViewType1DArray = 4
    VkImageViewType2DArray = 5
    VkImageViewTypeCubeArray = 6
    VkImageViewTypeBeginRange = 0
    VkImageViewTypeEndRange = 6
    VkImageViewTypeRangeSize = 7
    VkImageViewTypeMaxEnum = 2147483647
  end
  struct ShaderModuleCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : ShaderModuleCreateFlags
    code_size : LibC::SizeT
    p_code : Uint32T*
  end
  alias ShaderModuleCreateFlags = Flags
  struct PipelineCacheCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : PipelineCacheCreateFlags
    initial_data_size : LibC::SizeT
    p_initial_data : Void*
  end
  alias PipelineCacheCreateFlags = Flags
  struct SpecializationMapEntry
    constant_id : Uint32T
    offset : Uint32T
    size : LibC::SizeT
  end
  struct SpecializationInfo
    map_entry_count : Uint32T
    p_map_entries : SpecializationMapEntry*
    data_size : LibC::SizeT
    p_data : Void*
  end
  struct PipelineShaderStageCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : PipelineShaderStageCreateFlags
    stage : ShaderStageFlagBits
    module : ShaderModule
    p_name : LibC::Char*
    p_specialization_info : SpecializationInfo*
  end
  alias PipelineShaderStageCreateFlags = Flags
  enum ShaderStageFlagBits
    VkShaderStageVertexBit = 1
    VkShaderStageTessellationControlBit = 2
    VkShaderStageTessellationEvaluationBit = 4
    VkShaderStageGeometryBit = 8
    VkShaderStageFragmentBit = 16
    VkShaderStageComputeBit = 32
    VkShaderStageAllGraphics = 31
    VkShaderStageAll = 2147483647
    VkShaderStageFlagBitsMaxEnum = 2147483647
  end
  type ShaderModule = Void*
  struct VertexInputBindingDescription
    binding : Uint32T
    stride : Uint32T
    input_rate : VertexInputRate
  end
  enum VertexInputRate
    VkVertexInputRateVertex = 0
    VkVertexInputRateInstance = 1
    VkVertexInputRateBeginRange = 0
    VkVertexInputRateEndRange = 1
    VkVertexInputRateRangeSize = 2
    VkVertexInputRateMaxEnum = 2147483647
  end
  struct VertexInputAttributeDescription
    location : Uint32T
    binding : Uint32T
    format : Format
    offset : Uint32T
  end
  struct PipelineVertexInputStateCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : PipelineVertexInputStateCreateFlags
    vertex_binding_description_count : Uint32T
    p_vertex_binding_descriptions : VertexInputBindingDescription*
    vertex_attribute_description_count : Uint32T
    p_vertex_attribute_descriptions : VertexInputAttributeDescription*
  end
  alias PipelineVertexInputStateCreateFlags = Flags
  struct PipelineInputAssemblyStateCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : PipelineInputAssemblyStateCreateFlags
    topology : PrimitiveTopology
    primitive_restart_enable : Bool32
  end
  alias PipelineInputAssemblyStateCreateFlags = Flags
  enum PrimitiveTopology
    VkPrimitiveTopologyPointList = 0
    VkPrimitiveTopologyLineList = 1
    VkPrimitiveTopologyLineStrip = 2
    VkPrimitiveTopologyTriangleList = 3
    VkPrimitiveTopologyTriangleStrip = 4
    VkPrimitiveTopologyTriangleFan = 5
    VkPrimitiveTopologyLineListWithAdjacency = 6
    VkPrimitiveTopologyLineStripWithAdjacency = 7
    VkPrimitiveTopologyTriangleListWithAdjacency = 8
    VkPrimitiveTopologyTriangleStripWithAdjacency = 9
    VkPrimitiveTopologyPatchList = 10
    VkPrimitiveTopologyBeginRange = 0
    VkPrimitiveTopologyEndRange = 10
    VkPrimitiveTopologyRangeSize = 11
    VkPrimitiveTopologyMaxEnum = 2147483647
  end
  struct PipelineTessellationStateCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : PipelineTessellationStateCreateFlags
    patch_control_points : Uint32T
  end
  alias PipelineTessellationStateCreateFlags = Flags
  struct Viewport
    x : LibC::Float
    y : LibC::Float
    width : LibC::Float
    height : LibC::Float
    min_depth : LibC::Float
    max_depth : LibC::Float
  end
  struct Offset2D
    x : Int32T
    y : Int32T
  end
  struct Extent2D
    width : Uint32T
    height : Uint32T
  end
  struct Rect2D
    offset : Offset2D
    extent : Extent2D
  end
  struct PipelineViewportStateCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : PipelineViewportStateCreateFlags
    viewport_count : Uint32T
    p_viewports : Viewport*
    scissor_count : Uint32T
    p_scissors : Rect2D*
  end
  alias PipelineViewportStateCreateFlags = Flags
  struct PipelineRasterizationStateCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : PipelineRasterizationStateCreateFlags
    depth_clamp_enable : Bool32
    rasterizer_discard_enable : Bool32
    polygon_mode : PolygonMode
    cull_mode : CullModeFlags
    front_face : FrontFace
    depth_bias_enable : Bool32
    depth_bias_constant_factor : LibC::Float
    depth_bias_clamp : LibC::Float
    depth_bias_slope_factor : LibC::Float
    line_width : LibC::Float
  end
  alias PipelineRasterizationStateCreateFlags = Flags
  enum PolygonMode
    VkPolygonModeFill = 0
    VkPolygonModeLine = 1
    VkPolygonModePoint = 2
    VkPolygonModeFillRectangleNv = 1000153000
    VkPolygonModeBeginRange = 0
    VkPolygonModeEndRange = 2
    VkPolygonModeRangeSize = 3
    VkPolygonModeMaxEnum = 2147483647
  end
  alias CullModeFlags = Flags
  enum FrontFace
    VkFrontFaceCounterClockwise = 0
    VkFrontFaceClockwise = 1
    VkFrontFaceBeginRange = 0
    VkFrontFaceEndRange = 1
    VkFrontFaceRangeSize = 2
    VkFrontFaceMaxEnum = 2147483647
  end
  struct PipelineMultisampleStateCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : PipelineMultisampleStateCreateFlags
    rasterization_samples : SampleCountFlagBits
    sample_shading_enable : Bool32
    min_sample_shading : LibC::Float
    p_sample_mask : SampleMask*
    alpha_to_coverage_enable : Bool32
    alpha_to_one_enable : Bool32
  end
  alias PipelineMultisampleStateCreateFlags = Flags
  alias SampleMask = Uint32T
  struct StencilOpState
    fail_op : StencilOp
    pass_op : StencilOp
    depth_fail_op : StencilOp
    compare_op : CompareOp
    compare_mask : Uint32T
    write_mask : Uint32T
    reference : Uint32T
  end
  enum StencilOp
    VkStencilOpKeep = 0
    VkStencilOpZero = 1
    VkStencilOpReplace = 2
    VkStencilOpIncrementAndClamp = 3
    VkStencilOpDecrementAndClamp = 4
    VkStencilOpInvert = 5
    VkStencilOpIncrementAndWrap = 6
    VkStencilOpDecrementAndWrap = 7
    VkStencilOpBeginRange = 0
    VkStencilOpEndRange = 7
    VkStencilOpRangeSize = 8
    VkStencilOpMaxEnum = 2147483647
  end
  enum CompareOp
    VkCompareOpNever = 0
    VkCompareOpLess = 1
    VkCompareOpEqual = 2
    VkCompareOpLessOrEqual = 3
    VkCompareOpGreater = 4
    VkCompareOpNotEqual = 5
    VkCompareOpGreaterOrEqual = 6
    VkCompareOpAlways = 7
    VkCompareOpBeginRange = 0
    VkCompareOpEndRange = 7
    VkCompareOpRangeSize = 8
    VkCompareOpMaxEnum = 2147483647
  end
  struct PipelineDepthStencilStateCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : PipelineDepthStencilStateCreateFlags
    depth_test_enable : Bool32
    depth_write_enable : Bool32
    depth_compare_op : CompareOp
    depth_bounds_test_enable : Bool32
    stencil_test_enable : Bool32
    front : StencilOpState
    back : StencilOpState
    min_depth_bounds : LibC::Float
    max_depth_bounds : LibC::Float
  end
  alias PipelineDepthStencilStateCreateFlags = Flags
  struct PipelineColorBlendAttachmentState
    blend_enable : Bool32
    src_color_blend_factor : BlendFactor
    dst_color_blend_factor : BlendFactor
    color_blend_op : BlendOp
    src_alpha_blend_factor : BlendFactor
    dst_alpha_blend_factor : BlendFactor
    alpha_blend_op : BlendOp
    color_write_mask : ColorComponentFlags
  end
  enum BlendFactor
    VkBlendFactorZero = 0
    VkBlendFactorOne = 1
    VkBlendFactorSrcColor = 2
    VkBlendFactorOneMinusSrcColor = 3
    VkBlendFactorDstColor = 4
    VkBlendFactorOneMinusDstColor = 5
    VkBlendFactorSrcAlpha = 6
    VkBlendFactorOneMinusSrcAlpha = 7
    VkBlendFactorDstAlpha = 8
    VkBlendFactorOneMinusDstAlpha = 9
    VkBlendFactorConstantColor = 10
    VkBlendFactorOneMinusConstantColor = 11
    VkBlendFactorConstantAlpha = 12
    VkBlendFactorOneMinusConstantAlpha = 13
    VkBlendFactorSrcAlphaSaturate = 14
    VkBlendFactorSrc1Color = 15
    VkBlendFactorOneMinusSrc1Color = 16
    VkBlendFactorSrc1Alpha = 17
    VkBlendFactorOneMinusSrc1Alpha = 18
    VkBlendFactorBeginRange = 0
    VkBlendFactorEndRange = 18
    VkBlendFactorRangeSize = 19
    VkBlendFactorMaxEnum = 2147483647
  end
  enum BlendOp
    VkBlendOpAdd = 0
    VkBlendOpSubtract = 1
    VkBlendOpReverseSubtract = 2
    VkBlendOpMin = 3
    VkBlendOpMax = 4
    VkBlendOpZeroExt = 1000148000
    VkBlendOpSrcExt = 1000148001
    VkBlendOpDstExt = 1000148002
    VkBlendOpSrcOverExt = 1000148003
    VkBlendOpDstOverExt = 1000148004
    VkBlendOpSrcInExt = 1000148005
    VkBlendOpDstInExt = 1000148006
    VkBlendOpSrcOutExt = 1000148007
    VkBlendOpDstOutExt = 1000148008
    VkBlendOpSrcAtopExt = 1000148009
    VkBlendOpDstAtopExt = 1000148010
    VkBlendOpXorExt = 1000148011
    VkBlendOpMultiplyExt = 1000148012
    VkBlendOpScreenExt = 1000148013
    VkBlendOpOverlayExt = 1000148014
    VkBlendOpDarkenExt = 1000148015
    VkBlendOpLightenExt = 1000148016
    VkBlendOpColordodgeExt = 1000148017
    VkBlendOpColorburnExt = 1000148018
    VkBlendOpHardlightExt = 1000148019
    VkBlendOpSoftlightExt = 1000148020
    VkBlendOpDifferenceExt = 1000148021
    VkBlendOpExclusionExt = 1000148022
    VkBlendOpInvertExt = 1000148023
    VkBlendOpInvertRgbExt = 1000148024
    VkBlendOpLineardodgeExt = 1000148025
    VkBlendOpLinearburnExt = 1000148026
    VkBlendOpVividlightExt = 1000148027
    VkBlendOpLinearlightExt = 1000148028
    VkBlendOpPinlightExt = 1000148029
    VkBlendOpHardmixExt = 1000148030
    VkBlendOpHslHueExt = 1000148031
    VkBlendOpHslSaturationExt = 1000148032
    VkBlendOpHslColorExt = 1000148033
    VkBlendOpHslLuminosityExt = 1000148034
    VkBlendOpPlusExt = 1000148035
    VkBlendOpPlusClampedExt = 1000148036
    VkBlendOpPlusClampedAlphaExt = 1000148037
    VkBlendOpPlusDarkerExt = 1000148038
    VkBlendOpMinusExt = 1000148039
    VkBlendOpMinusClampedExt = 1000148040
    VkBlendOpContrastExt = 1000148041
    VkBlendOpInvertOvgExt = 1000148042
    VkBlendOpRedExt = 1000148043
    VkBlendOpGreenExt = 1000148044
    VkBlendOpBlueExt = 1000148045
    VkBlendOpBeginRange = 0
    VkBlendOpEndRange = 4
    VkBlendOpRangeSize = 5
    VkBlendOpMaxEnum = 2147483647
  end
  alias ColorComponentFlags = Flags
  struct PipelineColorBlendStateCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : PipelineColorBlendStateCreateFlags
    logic_op_enable : Bool32
    logic_op : LogicOp
    attachment_count : Uint32T
    p_attachments : PipelineColorBlendAttachmentState*
    blend_constants : LibC::Float[4]
  end
  alias PipelineColorBlendStateCreateFlags = Flags
  enum LogicOp
    VkLogicOpClear = 0
    VkLogicOpAnd = 1
    VkLogicOpAndReverse = 2
    VkLogicOpCopy = 3
    VkLogicOpAndInverted = 4
    VkLogicOpNoOp = 5
    VkLogicOpXor = 6
    VkLogicOpOr = 7
    VkLogicOpNor = 8
    VkLogicOpEquivalent = 9
    VkLogicOpInvert = 10
    VkLogicOpOrReverse = 11
    VkLogicOpCopyInverted = 12
    VkLogicOpOrInverted = 13
    VkLogicOpNand = 14
    VkLogicOpSet = 15
    VkLogicOpBeginRange = 0
    VkLogicOpEndRange = 15
    VkLogicOpRangeSize = 16
    VkLogicOpMaxEnum = 2147483647
  end
  struct PipelineDynamicStateCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : PipelineDynamicStateCreateFlags
    dynamic_state_count : Uint32T
    p_dynamic_states : DynamicState*
  end
  alias PipelineDynamicStateCreateFlags = Flags
  enum DynamicState
    VkDynamicStateViewport = 0
    VkDynamicStateScissor = 1
    VkDynamicStateLineWidth = 2
    VkDynamicStateDepthBias = 3
    VkDynamicStateBlendConstants = 4
    VkDynamicStateDepthBounds = 5
    VkDynamicStateStencilCompareMask = 6
    VkDynamicStateStencilWriteMask = 7
    VkDynamicStateStencilReference = 8
    VkDynamicStateViewportWScalingNv = 1000087000
    VkDynamicStateDiscardRectangleExt = 1000099000
    VkDynamicStateSampleLocationsExt = 1000143000
    VkDynamicStateBeginRange = 0
    VkDynamicStateEndRange = 8
    VkDynamicStateRangeSize = 9
    VkDynamicStateMaxEnum = 2147483647
  end
  struct GraphicsPipelineCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : PipelineCreateFlags
    stage_count : Uint32T
    p_stages : PipelineShaderStageCreateInfo*
    p_vertex_input_state : PipelineVertexInputStateCreateInfo*
    p_input_assembly_state : PipelineInputAssemblyStateCreateInfo*
    p_tessellation_state : PipelineTessellationStateCreateInfo*
    p_viewport_state : PipelineViewportStateCreateInfo*
    p_rasterization_state : PipelineRasterizationStateCreateInfo*
    p_multisample_state : PipelineMultisampleStateCreateInfo*
    p_depth_stencil_state : PipelineDepthStencilStateCreateInfo*
    p_color_blend_state : PipelineColorBlendStateCreateInfo*
    p_dynamic_state : PipelineDynamicStateCreateInfo*
    layout : PipelineLayout
    render_pass : RenderPass
    subpass : Uint32T
    base_pipeline_handle : Pipeline
    base_pipeline_index : Int32T
  end
  alias PipelineCreateFlags = Flags
  type PipelineLayout = Void*
  type RenderPass = Void*
  type Pipeline = Void*
  struct ComputePipelineCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : PipelineCreateFlags
    stage : PipelineShaderStageCreateInfo
    layout : PipelineLayout
    base_pipeline_handle : Pipeline
    base_pipeline_index : Int32T
  end
  struct PushConstantRange
    stage_flags : ShaderStageFlags
    offset : Uint32T
    size : Uint32T
  end
  alias ShaderStageFlags = Flags
  struct PipelineLayoutCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : PipelineLayoutCreateFlags
    set_layout_count : Uint32T
    p_set_layouts : DescriptorSetLayout*
    push_constant_range_count : Uint32T
    p_push_constant_ranges : PushConstantRange*
  end
  alias PipelineLayoutCreateFlags = Flags
  type DescriptorSetLayout = Void*
  struct SamplerCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : SamplerCreateFlags
    mag_filter : Filter
    min_filter : Filter
    mipmap_mode : SamplerMipmapMode
    address_mode_u : SamplerAddressMode
    address_mode_v : SamplerAddressMode
    address_mode_w : SamplerAddressMode
    mip_lod_bias : LibC::Float
    anisotropy_enable : Bool32
    max_anisotropy : LibC::Float
    compare_enable : Bool32
    compare_op : CompareOp
    min_lod : LibC::Float
    max_lod : LibC::Float
    border_color : BorderColor
    unnormalized_coordinates : Bool32
  end
  alias SamplerCreateFlags = Flags
  enum Filter
    VkFilterNearest = 0
    VkFilterLinear = 1
    VkFilterCubicImg = 1000015000
    VkFilterBeginRange = 0
    VkFilterEndRange = 1
    VkFilterRangeSize = 2
    VkFilterMaxEnum = 2147483647
  end
  enum SamplerMipmapMode
    VkSamplerMipmapModeNearest = 0
    VkSamplerMipmapModeLinear = 1
    VkSamplerMipmapModeBeginRange = 0
    VkSamplerMipmapModeEndRange = 1
    VkSamplerMipmapModeRangeSize = 2
    VkSamplerMipmapModeMaxEnum = 2147483647
  end
  enum SamplerAddressMode
    VkSamplerAddressModeRepeat = 0
    VkSamplerAddressModeMirroredRepeat = 1
    VkSamplerAddressModeClampToEdge = 2
    VkSamplerAddressModeClampToBorder = 3
    VkSamplerAddressModeMirrorClampToEdge = 4
    VkSamplerAddressModeBeginRange = 0
    VkSamplerAddressModeEndRange = 3
    VkSamplerAddressModeRangeSize = 4
    VkSamplerAddressModeMaxEnum = 2147483647
  end
  enum BorderColor
    VkBorderColorFloatTransparentBlack = 0
    VkBorderColorIntTransparentBlack = 1
    VkBorderColorFloatOpaqueBlack = 2
    VkBorderColorIntOpaqueBlack = 3
    VkBorderColorFloatOpaqueWhite = 4
    VkBorderColorIntOpaqueWhite = 5
    VkBorderColorBeginRange = 0
    VkBorderColorEndRange = 5
    VkBorderColorRangeSize = 6
    VkBorderColorMaxEnum = 2147483647
  end
  struct DescriptorSetLayoutBinding
    binding : Uint32T
    descriptor_type : DescriptorType
    descriptor_count : Uint32T
    stage_flags : ShaderStageFlags
    p_immutable_samplers : Sampler*
  end
  enum DescriptorType
    VkDescriptorTypeSampler = 0
    VkDescriptorTypeCombinedImageSampler = 1
    VkDescriptorTypeSampledImage = 2
    VkDescriptorTypeStorageImage = 3
    VkDescriptorTypeUniformTexelBuffer = 4
    VkDescriptorTypeStorageTexelBuffer = 5
    VkDescriptorTypeUniformBuffer = 6
    VkDescriptorTypeStorageBuffer = 7
    VkDescriptorTypeUniformBufferDynamic = 8
    VkDescriptorTypeStorageBufferDynamic = 9
    VkDescriptorTypeInputAttachment = 10
    VkDescriptorTypeBeginRange = 0
    VkDescriptorTypeEndRange = 10
    VkDescriptorTypeRangeSize = 11
    VkDescriptorTypeMaxEnum = 2147483647
  end
  type Sampler = Void*
  struct DescriptorSetLayoutCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : DescriptorSetLayoutCreateFlags
    binding_count : Uint32T
    p_bindings : DescriptorSetLayoutBinding*
  end
  alias DescriptorSetLayoutCreateFlags = Flags
  struct DescriptorPoolSize
    type : DescriptorType
    descriptor_count : Uint32T
  end
  struct DescriptorPoolCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : DescriptorPoolCreateFlags
    max_sets : Uint32T
    pool_size_count : Uint32T
    p_pool_sizes : DescriptorPoolSize*
  end
  alias DescriptorPoolCreateFlags = Flags
  struct DescriptorSetAllocateInfo
    s_type : StructureType
    p_next : Void*
    descriptor_pool : DescriptorPool
    descriptor_set_count : Uint32T
    p_set_layouts : DescriptorSetLayout*
  end
  type DescriptorPool = Void*
  struct DescriptorImageInfo
    sampler : Sampler
    image_view : ImageView
    image_layout : ImageLayout
  end
  type ImageView = Void*
  struct DescriptorBufferInfo
    buffer : Buffer
    offset : DeviceSize
    range : DeviceSize
  end
  struct WriteDescriptorSet
    s_type : StructureType
    p_next : Void*
    dst_set : DescriptorSet
    dst_binding : Uint32T
    dst_array_element : Uint32T
    descriptor_count : Uint32T
    descriptor_type : DescriptorType
    p_image_info : DescriptorImageInfo*
    p_buffer_info : DescriptorBufferInfo*
    p_texel_buffer_view : BufferView*
  end
  type DescriptorSet = Void*
  type BufferView = Void*
  struct CopyDescriptorSet
    s_type : StructureType
    p_next : Void*
    src_set : DescriptorSet
    src_binding : Uint32T
    src_array_element : Uint32T
    dst_set : DescriptorSet
    dst_binding : Uint32T
    dst_array_element : Uint32T
    descriptor_count : Uint32T
  end
  struct FramebufferCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : FramebufferCreateFlags
    render_pass : RenderPass
    attachment_count : Uint32T
    p_attachments : ImageView*
    width : Uint32T
    height : Uint32T
    layers : Uint32T
  end
  alias FramebufferCreateFlags = Flags
  struct AttachmentDescription
    flags : AttachmentDescriptionFlags
    format : Format
    samples : SampleCountFlagBits
    load_op : AttachmentLoadOp
    store_op : AttachmentStoreOp
    stencil_load_op : AttachmentLoadOp
    stencil_store_op : AttachmentStoreOp
    initial_layout : ImageLayout
    final_layout : ImageLayout
  end
  alias AttachmentDescriptionFlags = Flags
  enum AttachmentLoadOp
    VkAttachmentLoadOpLoad = 0
    VkAttachmentLoadOpClear = 1
    VkAttachmentLoadOpDontCare = 2
    VkAttachmentLoadOpBeginRange = 0
    VkAttachmentLoadOpEndRange = 2
    VkAttachmentLoadOpRangeSize = 3
    VkAttachmentLoadOpMaxEnum = 2147483647
  end
  enum AttachmentStoreOp
    VkAttachmentStoreOpStore = 0
    VkAttachmentStoreOpDontCare = 1
    VkAttachmentStoreOpBeginRange = 0
    VkAttachmentStoreOpEndRange = 1
    VkAttachmentStoreOpRangeSize = 2
    VkAttachmentStoreOpMaxEnum = 2147483647
  end
  struct AttachmentReference
    attachment : Uint32T
    layout : ImageLayout
  end
  struct SubpassDescription
    flags : SubpassDescriptionFlags
    pipeline_bind_point : PipelineBindPoint
    input_attachment_count : Uint32T
    p_input_attachments : AttachmentReference*
    color_attachment_count : Uint32T
    p_color_attachments : AttachmentReference*
    p_resolve_attachments : AttachmentReference*
    p_depth_stencil_attachment : AttachmentReference*
    preserve_attachment_count : Uint32T
    p_preserve_attachments : Uint32T*
  end
  alias SubpassDescriptionFlags = Flags
  enum PipelineBindPoint
    VkPipelineBindPointGraphics = 0
    VkPipelineBindPointCompute = 1
    VkPipelineBindPointBeginRange = 0
    VkPipelineBindPointEndRange = 1
    VkPipelineBindPointRangeSize = 2
    VkPipelineBindPointMaxEnum = 2147483647
  end
  struct SubpassDependency
    src_subpass : Uint32T
    dst_subpass : Uint32T
    src_stage_mask : PipelineStageFlags
    dst_stage_mask : PipelineStageFlags
    src_access_mask : AccessFlags
    dst_access_mask : AccessFlags
    dependency_flags : DependencyFlags
  end
  alias AccessFlags = Flags
  alias DependencyFlags = Flags
  struct RenderPassCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : RenderPassCreateFlags
    attachment_count : Uint32T
    p_attachments : AttachmentDescription*
    subpass_count : Uint32T
    p_subpasses : SubpassDescription*
    dependency_count : Uint32T
    p_dependencies : SubpassDependency*
  end
  alias RenderPassCreateFlags = Flags
  struct CommandPoolCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : CommandPoolCreateFlags
    queue_family_index : Uint32T
  end
  alias CommandPoolCreateFlags = Flags
  struct CommandBufferAllocateInfo
    s_type : StructureType
    p_next : Void*
    command_pool : CommandPool
    level : CommandBufferLevel
    command_buffer_count : Uint32T
  end
  type CommandPool = Void*
  enum CommandBufferLevel
    VkCommandBufferLevelPrimary = 0
    VkCommandBufferLevelSecondary = 1
    VkCommandBufferLevelBeginRange = 0
    VkCommandBufferLevelEndRange = 1
    VkCommandBufferLevelRangeSize = 2
    VkCommandBufferLevelMaxEnum = 2147483647
  end
  struct CommandBufferInheritanceInfo
    s_type : StructureType
    p_next : Void*
    render_pass : RenderPass
    subpass : Uint32T
    framebuffer : Framebuffer
    occlusion_query_enable : Bool32
    query_flags : QueryControlFlags
    pipeline_statistics : QueryPipelineStatisticFlags
  end
  type Framebuffer = Void*
  alias QueryControlFlags = Flags
  struct CommandBufferBeginInfo
    s_type : StructureType
    p_next : Void*
    flags : CommandBufferUsageFlags
    p_inheritance_info : CommandBufferInheritanceInfo*
  end
  alias CommandBufferUsageFlags = Flags
  struct BufferCopy
    src_offset : DeviceSize
    dst_offset : DeviceSize
    size : DeviceSize
  end
  struct ImageSubresourceLayers
    aspect_mask : ImageAspectFlags
    mip_level : Uint32T
    base_array_layer : Uint32T
    layer_count : Uint32T
  end
  struct ImageCopy
    src_subresource : ImageSubresourceLayers
    src_offset : Offset3D
    dst_subresource : ImageSubresourceLayers
    dst_offset : Offset3D
    extent : Extent3D
  end
  struct ImageBlit
    src_subresource : ImageSubresourceLayers
    src_offsets : Offset3D[2]
    dst_subresource : ImageSubresourceLayers
    dst_offsets : Offset3D[2]
  end
  struct BufferImageCopy
    buffer_offset : DeviceSize
    buffer_row_length : Uint32T
    buffer_image_height : Uint32T
    image_subresource : ImageSubresourceLayers
    image_offset : Offset3D
    image_extent : Extent3D
  end
  union ClearColorValue
    float32 : LibC::Float[4]
    int32 : Int32T[4]
    uint32 : Uint32T[4]
  end
  struct ClearDepthStencilValue
    depth : LibC::Float
    stencil : Uint32T
  end
  union ClearValue
    color : ClearColorValue
    depth_stencil : ClearDepthStencilValue
  end
  struct ClearAttachment
    aspect_mask : ImageAspectFlags
    color_attachment : Uint32T
    clear_value : ClearValue
  end
  struct ClearRect
    rect : Rect2D
    base_array_layer : Uint32T
    layer_count : Uint32T
  end
  struct ImageResolve
    src_subresource : ImageSubresourceLayers
    src_offset : Offset3D
    dst_subresource : ImageSubresourceLayers
    dst_offset : Offset3D
    extent : Extent3D
  end
  struct MemoryBarrier
    s_type : StructureType
    p_next : Void*
    src_access_mask : AccessFlags
    dst_access_mask : AccessFlags
  end
  struct BufferMemoryBarrier
    s_type : StructureType
    p_next : Void*
    src_access_mask : AccessFlags
    dst_access_mask : AccessFlags
    src_queue_family_index : Uint32T
    dst_queue_family_index : Uint32T
    buffer : Buffer
    offset : DeviceSize
    size : DeviceSize
  end
  struct ImageMemoryBarrier
    s_type : StructureType
    p_next : Void*
    src_access_mask : AccessFlags
    dst_access_mask : AccessFlags
    old_layout : ImageLayout
    new_layout : ImageLayout
    src_queue_family_index : Uint32T
    dst_queue_family_index : Uint32T
    image : Image
    subresource_range : ImageSubresourceRange
  end
  struct RenderPassBeginInfo
    s_type : StructureType
    p_next : Void*
    render_pass : RenderPass
    framebuffer : Framebuffer
    render_area : Rect2D
    clear_value_count : Uint32T
    p_clear_values : ClearValue*
  end
  struct DispatchIndirectCommand
    x : Uint32T
    y : Uint32T
    z : Uint32T
  end
  struct DrawIndexedIndirectCommand
    index_count : Uint32T
    instance_count : Uint32T
    first_index : Uint32T
    vertex_offset : Int32T
    first_instance : Uint32T
  end
  struct DrawIndirectCommand
    vertex_count : Uint32T
    instance_count : Uint32T
    first_vertex : Uint32T
    first_instance : Uint32T
  end
  struct BaseOutStructure
    s_type : StructureType
    p_next : BaseOutStructure*
  end
  struct BaseInStructure
    s_type : StructureType
    p_next : BaseInStructure*
  end
  fun create_instance = vkCreateInstance(p_create_info : InstanceCreateInfo*, p_allocator : AllocationCallbacks*, p_instance : Instance*) : Result
  type Instance = Void*
  enum Result
    VkSuccess = 0
    VkNotReady = 1
    VkTimeout = 2
    VkEventSet = 3
    VkEventReset = 4
    VkIncomplete = 5
    VkErrorOutOfHostMemory = -1
    VkErrorOutOfDeviceMemory = -2
    VkErrorInitializationFailed = -3
    VkErrorDeviceLost = -4
    VkErrorMemoryMapFailed = -5
    VkErrorLayerNotPresent = -6
    VkErrorExtensionNotPresent = -7
    VkErrorFeatureNotPresent = -8
    VkErrorIncompatibleDriver = -9
    VkErrorTooManyObjects = -10
    VkErrorFormatNotSupported = -11
    VkErrorFragmentedPool = -12
    VkErrorOutOfPoolMemory = -1000069000
    VkErrorInvalidExternalHandle = -1000072003
    VkErrorSurfaceLostKhr = -1000000000
    VkErrorNativeWindowInUseKhr = -1000000001
    VkSuboptimalKhr = 1000001003
    VkErrorOutOfDateKhr = -1000001004
    VkErrorIncompatibleDisplayKhr = -1000003001
    VkErrorValidationFailedExt = -1000011001
    VkErrorInvalidShaderNv = -1000012000
    VkErrorFragmentationExt = -1000161000
    VkErrorNotPermittedExt = -1000174001
    VkErrorOutOfPoolMemoryKhr = -1000069000
    VkErrorInvalidExternalHandleKhr = -1000072003
    VkResultBeginRange = -12
    VkResultEndRange = 5
    VkResultRangeSize = 18
    VkResultMaxEnum = 2147483647
  end
  fun destroy_instance = vkDestroyInstance(instance : Instance, p_allocator : AllocationCallbacks*)
  fun enumerate_physical_devices = vkEnumeratePhysicalDevices(instance : Instance, p_physical_device_count : Uint32T*, p_physical_devices : PhysicalDevice*) : Result
  type PhysicalDevice = Void*
  fun get_physical_device_features = vkGetPhysicalDeviceFeatures(physical_device : PhysicalDevice, p_features : PhysicalDeviceFeatures*)
  fun get_physical_device_format_properties = vkGetPhysicalDeviceFormatProperties(physical_device : PhysicalDevice, format : Format, p_format_properties : FormatProperties*)
  fun get_physical_device_image_format_properties = vkGetPhysicalDeviceImageFormatProperties(physical_device : PhysicalDevice, format : Format, type : ImageType, tiling : ImageTiling, usage : ImageUsageFlags, flags : ImageCreateFlags, p_image_format_properties : ImageFormatProperties*) : Result
  fun get_physical_device_properties = vkGetPhysicalDeviceProperties(physical_device : PhysicalDevice, p_properties : PhysicalDeviceProperties*)
  fun get_physical_device_queue_family_properties = vkGetPhysicalDeviceQueueFamilyProperties(physical_device : PhysicalDevice, p_queue_family_property_count : Uint32T*, p_queue_family_properties : QueueFamilyProperties*)
  fun get_physical_device_memory_properties = vkGetPhysicalDeviceMemoryProperties(physical_device : PhysicalDevice, p_memory_properties : PhysicalDeviceMemoryProperties*)
  fun get_instance_proc_addr = vkGetInstanceProcAddr(instance : Instance, p_name : LibC::Char*) : PfnVkVoidFunction
  alias PfnVkVoidFunction = ( -> Void)
  fun get_device_proc_addr = vkGetDeviceProcAddr(device : Device, p_name : LibC::Char*) : PfnVkVoidFunction
  type Device = Void*
  fun create_device = vkCreateDevice(physical_device : PhysicalDevice, p_create_info : DeviceCreateInfo*, p_allocator : AllocationCallbacks*, p_device : Device*) : Result
  fun destroy_device = vkDestroyDevice(device : Device, p_allocator : AllocationCallbacks*)
  fun enumerate_instance_extension_properties = vkEnumerateInstanceExtensionProperties(p_layer_name : LibC::Char*, p_property_count : Uint32T*, p_properties : ExtensionProperties*) : Result
  fun enumerate_device_extension_properties = vkEnumerateDeviceExtensionProperties(physical_device : PhysicalDevice, p_layer_name : LibC::Char*, p_property_count : Uint32T*, p_properties : ExtensionProperties*) : Result
  fun enumerate_instance_layer_properties = vkEnumerateInstanceLayerProperties(p_property_count : Uint32T*, p_properties : LayerProperties*) : Result
  fun enumerate_device_layer_properties = vkEnumerateDeviceLayerProperties(physical_device : PhysicalDevice, p_property_count : Uint32T*, p_properties : LayerProperties*) : Result
  fun get_device_queue = vkGetDeviceQueue(device : Device, queue_family_index : Uint32T, queue_index : Uint32T, p_queue : Queue*)
  type Queue = Void*
  fun queue_submit = vkQueueSubmit(queue : Queue, submit_count : Uint32T, p_submits : SubmitInfo*, fence : Fence) : Result
  type Fence = Void*
  fun queue_wait_idle = vkQueueWaitIdle(queue : Queue) : Result
  fun device_wait_idle = vkDeviceWaitIdle(device : Device) : Result
  fun allocate_memory = vkAllocateMemory(device : Device, p_allocate_info : MemoryAllocateInfo*, p_allocator : AllocationCallbacks*, p_memory : DeviceMemory*) : Result
  fun free_memory = vkFreeMemory(device : Device, memory : DeviceMemory, p_allocator : AllocationCallbacks*)
  fun map_memory = vkMapMemory(device : Device, memory : DeviceMemory, offset : DeviceSize, size : DeviceSize, flags : MemoryMapFlags, pp_data : Void**) : Result
  alias MemoryMapFlags = Flags
  fun unmap_memory = vkUnmapMemory(device : Device, memory : DeviceMemory)
  fun flush_mapped_memory_ranges = vkFlushMappedMemoryRanges(device : Device, memory_range_count : Uint32T, p_memory_ranges : MappedMemoryRange*) : Result
  fun invalidate_mapped_memory_ranges = vkInvalidateMappedMemoryRanges(device : Device, memory_range_count : Uint32T, p_memory_ranges : MappedMemoryRange*) : Result
  fun get_device_memory_commitment = vkGetDeviceMemoryCommitment(device : Device, memory : DeviceMemory, p_committed_memory_in_bytes : DeviceSize*)
  fun bind_buffer_memory = vkBindBufferMemory(device : Device, buffer : Buffer, memory : DeviceMemory, memory_offset : DeviceSize) : Result
  fun bind_image_memory = vkBindImageMemory(device : Device, image : Image, memory : DeviceMemory, memory_offset : DeviceSize) : Result
  fun get_buffer_memory_requirements = vkGetBufferMemoryRequirements(device : Device, buffer : Buffer, p_memory_requirements : MemoryRequirements*)
  fun get_image_memory_requirements = vkGetImageMemoryRequirements(device : Device, image : Image, p_memory_requirements : MemoryRequirements*)
  fun get_image_sparse_memory_requirements = vkGetImageSparseMemoryRequirements(device : Device, image : Image, p_sparse_memory_requirement_count : Uint32T*, p_sparse_memory_requirements : SparseImageMemoryRequirements*)
  fun get_physical_device_sparse_image_format_properties = vkGetPhysicalDeviceSparseImageFormatProperties(physical_device : PhysicalDevice, format : Format, type : ImageType, samples : SampleCountFlagBits, usage : ImageUsageFlags, tiling : ImageTiling, p_property_count : Uint32T*, p_properties : SparseImageFormatProperties*)
  fun queue_bind_sparse = vkQueueBindSparse(queue : Queue, bind_info_count : Uint32T, p_bind_info : BindSparseInfo*, fence : Fence) : Result
  fun create_fence = vkCreateFence(device : Device, p_create_info : FenceCreateInfo*, p_allocator : AllocationCallbacks*, p_fence : Fence*) : Result
  fun destroy_fence = vkDestroyFence(device : Device, fence : Fence, p_allocator : AllocationCallbacks*)
  fun reset_fences = vkResetFences(device : Device, fence_count : Uint32T, p_fences : Fence*) : Result
  fun get_fence_status = vkGetFenceStatus(device : Device, fence : Fence) : Result
  fun wait_for_fences = vkWaitForFences(device : Device, fence_count : Uint32T, p_fences : Fence*, wait_all : Bool32, timeout : Uint64T) : Result
  fun create_semaphore = vkCreateSemaphore(device : Device, p_create_info : SemaphoreCreateInfo*, p_allocator : AllocationCallbacks*, p_semaphore : Semaphore*) : Result
  fun destroy_semaphore = vkDestroySemaphore(device : Device, semaphore : Semaphore, p_allocator : AllocationCallbacks*)
  fun create_event = vkCreateEvent(device : Device, p_create_info : EventCreateInfo*, p_allocator : AllocationCallbacks*, p_event : Event*) : Result
  type Event = Void*
  fun destroy_event = vkDestroyEvent(device : Device, event : Event, p_allocator : AllocationCallbacks*)
  fun get_event_status = vkGetEventStatus(device : Device, event : Event) : Result
  fun set_event = vkSetEvent(device : Device, event : Event) : Result
  fun reset_event = vkResetEvent(device : Device, event : Event) : Result
  fun create_query_pool = vkCreateQueryPool(device : Device, p_create_info : QueryPoolCreateInfo*, p_allocator : AllocationCallbacks*, p_query_pool : QueryPool*) : Result
  type QueryPool = Void*
  fun destroy_query_pool = vkDestroyQueryPool(device : Device, query_pool : QueryPool, p_allocator : AllocationCallbacks*)
  fun get_query_pool_results = vkGetQueryPoolResults(device : Device, query_pool : QueryPool, first_query : Uint32T, query_count : Uint32T, data_size : LibC::SizeT, p_data : Void*, stride : DeviceSize, flags : QueryResultFlags) : Result
  alias QueryResultFlags = Flags
  fun create_buffer = vkCreateBuffer(device : Device, p_create_info : BufferCreateInfo*, p_allocator : AllocationCallbacks*, p_buffer : Buffer*) : Result
  fun destroy_buffer = vkDestroyBuffer(device : Device, buffer : Buffer, p_allocator : AllocationCallbacks*)
  fun create_buffer_view = vkCreateBufferView(device : Device, p_create_info : BufferViewCreateInfo*, p_allocator : AllocationCallbacks*, p_view : BufferView*) : Result
  fun destroy_buffer_view = vkDestroyBufferView(device : Device, buffer_view : BufferView, p_allocator : AllocationCallbacks*)
  fun create_image = vkCreateImage(device : Device, p_create_info : ImageCreateInfo*, p_allocator : AllocationCallbacks*, p_image : Image*) : Result
  fun destroy_image = vkDestroyImage(device : Device, image : Image, p_allocator : AllocationCallbacks*)
  fun get_image_subresource_layout = vkGetImageSubresourceLayout(device : Device, image : Image, p_subresource : ImageSubresource*, p_layout : SubresourceLayout*)
  fun create_image_view = vkCreateImageView(device : Device, p_create_info : ImageViewCreateInfo*, p_allocator : AllocationCallbacks*, p_view : ImageView*) : Result
  fun destroy_image_view = vkDestroyImageView(device : Device, image_view : ImageView, p_allocator : AllocationCallbacks*)
  fun create_shader_module = vkCreateShaderModule(device : Device, p_create_info : ShaderModuleCreateInfo*, p_allocator : AllocationCallbacks*, p_shader_module : ShaderModule*) : Result
  fun destroy_shader_module = vkDestroyShaderModule(device : Device, shader_module : ShaderModule, p_allocator : AllocationCallbacks*)
  fun create_pipeline_cache = vkCreatePipelineCache(device : Device, p_create_info : PipelineCacheCreateInfo*, p_allocator : AllocationCallbacks*, p_pipeline_cache : PipelineCache*) : Result
  type PipelineCache = Void*
  fun destroy_pipeline_cache = vkDestroyPipelineCache(device : Device, pipeline_cache : PipelineCache, p_allocator : AllocationCallbacks*)
  fun get_pipeline_cache_data = vkGetPipelineCacheData(device : Device, pipeline_cache : PipelineCache, p_data_size : LibC::SizeT*, p_data : Void*) : Result
  fun merge_pipeline_caches = vkMergePipelineCaches(device : Device, dst_cache : PipelineCache, src_cache_count : Uint32T, p_src_caches : PipelineCache*) : Result
  fun create_graphics_pipelines = vkCreateGraphicsPipelines(device : Device, pipeline_cache : PipelineCache, create_info_count : Uint32T, p_create_infos : GraphicsPipelineCreateInfo*, p_allocator : AllocationCallbacks*, p_pipelines : Pipeline*) : Result
  fun create_compute_pipelines = vkCreateComputePipelines(device : Device, pipeline_cache : PipelineCache, create_info_count : Uint32T, p_create_infos : ComputePipelineCreateInfo*, p_allocator : AllocationCallbacks*, p_pipelines : Pipeline*) : Result
  fun destroy_pipeline = vkDestroyPipeline(device : Device, pipeline : Pipeline, p_allocator : AllocationCallbacks*)
  fun create_pipeline_layout = vkCreatePipelineLayout(device : Device, p_create_info : PipelineLayoutCreateInfo*, p_allocator : AllocationCallbacks*, p_pipeline_layout : PipelineLayout*) : Result
  fun destroy_pipeline_layout = vkDestroyPipelineLayout(device : Device, pipeline_layout : PipelineLayout, p_allocator : AllocationCallbacks*)
  fun create_sampler = vkCreateSampler(device : Device, p_create_info : SamplerCreateInfo*, p_allocator : AllocationCallbacks*, p_sampler : Sampler*) : Result
  fun destroy_sampler = vkDestroySampler(device : Device, sampler : Sampler, p_allocator : AllocationCallbacks*)
  fun create_descriptor_set_layout = vkCreateDescriptorSetLayout(device : Device, p_create_info : DescriptorSetLayoutCreateInfo*, p_allocator : AllocationCallbacks*, p_set_layout : DescriptorSetLayout*) : Result
  fun destroy_descriptor_set_layout = vkDestroyDescriptorSetLayout(device : Device, descriptor_set_layout : DescriptorSetLayout, p_allocator : AllocationCallbacks*)
  fun create_descriptor_pool = vkCreateDescriptorPool(device : Device, p_create_info : DescriptorPoolCreateInfo*, p_allocator : AllocationCallbacks*, p_descriptor_pool : DescriptorPool*) : Result
  fun destroy_descriptor_pool = vkDestroyDescriptorPool(device : Device, descriptor_pool : DescriptorPool, p_allocator : AllocationCallbacks*)
  fun reset_descriptor_pool = vkResetDescriptorPool(device : Device, descriptor_pool : DescriptorPool, flags : DescriptorPoolResetFlags) : Result
  alias DescriptorPoolResetFlags = Flags
  fun allocate_descriptor_sets = vkAllocateDescriptorSets(device : Device, p_allocate_info : DescriptorSetAllocateInfo*, p_descriptor_sets : DescriptorSet*) : Result
  fun free_descriptor_sets = vkFreeDescriptorSets(device : Device, descriptor_pool : DescriptorPool, descriptor_set_count : Uint32T, p_descriptor_sets : DescriptorSet*) : Result
  fun update_descriptor_sets = vkUpdateDescriptorSets(device : Device, descriptor_write_count : Uint32T, p_descriptor_writes : WriteDescriptorSet*, descriptor_copy_count : Uint32T, p_descriptor_copies : CopyDescriptorSet*)
  fun create_framebuffer = vkCreateFramebuffer(device : Device, p_create_info : FramebufferCreateInfo*, p_allocator : AllocationCallbacks*, p_framebuffer : Framebuffer*) : Result
  fun destroy_framebuffer = vkDestroyFramebuffer(device : Device, framebuffer : Framebuffer, p_allocator : AllocationCallbacks*)
  fun create_render_pass = vkCreateRenderPass(device : Device, p_create_info : RenderPassCreateInfo*, p_allocator : AllocationCallbacks*, p_render_pass : RenderPass*) : Result
  fun destroy_render_pass = vkDestroyRenderPass(device : Device, render_pass : RenderPass, p_allocator : AllocationCallbacks*)
  fun get_render_area_granularity = vkGetRenderAreaGranularity(device : Device, render_pass : RenderPass, p_granularity : Extent2D*)
  fun create_command_pool = vkCreateCommandPool(device : Device, p_create_info : CommandPoolCreateInfo*, p_allocator : AllocationCallbacks*, p_command_pool : CommandPool*) : Result
  fun destroy_command_pool = vkDestroyCommandPool(device : Device, command_pool : CommandPool, p_allocator : AllocationCallbacks*)
  fun reset_command_pool = vkResetCommandPool(device : Device, command_pool : CommandPool, flags : CommandPoolResetFlags) : Result
  alias CommandPoolResetFlags = Flags
  fun allocate_command_buffers = vkAllocateCommandBuffers(device : Device, p_allocate_info : CommandBufferAllocateInfo*, p_command_buffers : CommandBuffer*) : Result
  fun free_command_buffers = vkFreeCommandBuffers(device : Device, command_pool : CommandPool, command_buffer_count : Uint32T, p_command_buffers : CommandBuffer*)
  fun begin_command_buffer = vkBeginCommandBuffer(command_buffer : CommandBuffer, p_begin_info : CommandBufferBeginInfo*) : Result
  fun end_command_buffer = vkEndCommandBuffer(command_buffer : CommandBuffer) : Result
  fun reset_command_buffer = vkResetCommandBuffer(command_buffer : CommandBuffer, flags : CommandBufferResetFlags) : Result
  alias CommandBufferResetFlags = Flags
  fun cmd_bind_pipeline = vkCmdBindPipeline(command_buffer : CommandBuffer, pipeline_bind_point : PipelineBindPoint, pipeline : Pipeline)
  fun cmd_set_viewport = vkCmdSetViewport(command_buffer : CommandBuffer, first_viewport : Uint32T, viewport_count : Uint32T, p_viewports : Viewport*)
  fun cmd_set_scissor = vkCmdSetScissor(command_buffer : CommandBuffer, first_scissor : Uint32T, scissor_count : Uint32T, p_scissors : Rect2D*)
  fun cmd_set_line_width = vkCmdSetLineWidth(command_buffer : CommandBuffer, line_width : LibC::Float)
  fun cmd_set_depth_bias = vkCmdSetDepthBias(command_buffer : CommandBuffer, depth_bias_constant_factor : LibC::Float, depth_bias_clamp : LibC::Float, depth_bias_slope_factor : LibC::Float)
  fun cmd_set_blend_constants = vkCmdSetBlendConstants(command_buffer : CommandBuffer, blend_constants : LibC::Float[4])
  fun cmd_set_depth_bounds = vkCmdSetDepthBounds(command_buffer : CommandBuffer, min_depth_bounds : LibC::Float, max_depth_bounds : LibC::Float)
  fun cmd_set_stencil_compare_mask = vkCmdSetStencilCompareMask(command_buffer : CommandBuffer, face_mask : StencilFaceFlags, compare_mask : Uint32T)
  alias StencilFaceFlags = Flags
  fun cmd_set_stencil_write_mask = vkCmdSetStencilWriteMask(command_buffer : CommandBuffer, face_mask : StencilFaceFlags, write_mask : Uint32T)
  fun cmd_set_stencil_reference = vkCmdSetStencilReference(command_buffer : CommandBuffer, face_mask : StencilFaceFlags, reference : Uint32T)
  fun cmd_bind_descriptor_sets = vkCmdBindDescriptorSets(command_buffer : CommandBuffer, pipeline_bind_point : PipelineBindPoint, layout : PipelineLayout, first_set : Uint32T, descriptor_set_count : Uint32T, p_descriptor_sets : DescriptorSet*, dynamic_offset_count : Uint32T, p_dynamic_offsets : Uint32T*)
  fun cmd_bind_index_buffer = vkCmdBindIndexBuffer(command_buffer : CommandBuffer, buffer : Buffer, offset : DeviceSize, index_type : IndexType)
  enum IndexType
    VkIndexTypeUint16 = 0
    VkIndexTypeUint32 = 1
    VkIndexTypeBeginRange = 0
    VkIndexTypeEndRange = 1
    VkIndexTypeRangeSize = 2
    VkIndexTypeMaxEnum = 2147483647
  end
  fun cmd_bind_vertex_buffers = vkCmdBindVertexBuffers(command_buffer : CommandBuffer, first_binding : Uint32T, binding_count : Uint32T, p_buffers : Buffer*, p_offsets : DeviceSize*)
  fun cmd_draw = vkCmdDraw(command_buffer : CommandBuffer, vertex_count : Uint32T, instance_count : Uint32T, first_vertex : Uint32T, first_instance : Uint32T)
  fun cmd_draw_indexed = vkCmdDrawIndexed(command_buffer : CommandBuffer, index_count : Uint32T, instance_count : Uint32T, first_index : Uint32T, vertex_offset : Int32T, first_instance : Uint32T)
  fun cmd_draw_indirect = vkCmdDrawIndirect(command_buffer : CommandBuffer, buffer : Buffer, offset : DeviceSize, draw_count : Uint32T, stride : Uint32T)
  fun cmd_draw_indexed_indirect = vkCmdDrawIndexedIndirect(command_buffer : CommandBuffer, buffer : Buffer, offset : DeviceSize, draw_count : Uint32T, stride : Uint32T)
  fun cmd_dispatch = vkCmdDispatch(command_buffer : CommandBuffer, group_count_x : Uint32T, group_count_y : Uint32T, group_count_z : Uint32T)
  fun cmd_dispatch_indirect = vkCmdDispatchIndirect(command_buffer : CommandBuffer, buffer : Buffer, offset : DeviceSize)
  fun cmd_copy_buffer = vkCmdCopyBuffer(command_buffer : CommandBuffer, src_buffer : Buffer, dst_buffer : Buffer, region_count : Uint32T, p_regions : BufferCopy*)
  fun cmd_copy_image = vkCmdCopyImage(command_buffer : CommandBuffer, src_image : Image, src_image_layout : ImageLayout, dst_image : Image, dst_image_layout : ImageLayout, region_count : Uint32T, p_regions : ImageCopy*)
  fun cmd_blit_image = vkCmdBlitImage(command_buffer : CommandBuffer, src_image : Image, src_image_layout : ImageLayout, dst_image : Image, dst_image_layout : ImageLayout, region_count : Uint32T, p_regions : ImageBlit*, filter : Filter)
  fun cmd_copy_buffer_to_image = vkCmdCopyBufferToImage(command_buffer : CommandBuffer, src_buffer : Buffer, dst_image : Image, dst_image_layout : ImageLayout, region_count : Uint32T, p_regions : BufferImageCopy*)
  fun cmd_copy_image_to_buffer = vkCmdCopyImageToBuffer(command_buffer : CommandBuffer, src_image : Image, src_image_layout : ImageLayout, dst_buffer : Buffer, region_count : Uint32T, p_regions : BufferImageCopy*)
  fun cmd_update_buffer = vkCmdUpdateBuffer(command_buffer : CommandBuffer, dst_buffer : Buffer, dst_offset : DeviceSize, data_size : DeviceSize, p_data : Void*)
  fun cmd_fill_buffer = vkCmdFillBuffer(command_buffer : CommandBuffer, dst_buffer : Buffer, dst_offset : DeviceSize, size : DeviceSize, data : Uint32T)
  fun cmd_clear_color_image = vkCmdClearColorImage(command_buffer : CommandBuffer, image : Image, image_layout : ImageLayout, p_color : ClearColorValue*, range_count : Uint32T, p_ranges : ImageSubresourceRange*)
  fun cmd_clear_depth_stencil_image = vkCmdClearDepthStencilImage(command_buffer : CommandBuffer, image : Image, image_layout : ImageLayout, p_depth_stencil : ClearDepthStencilValue*, range_count : Uint32T, p_ranges : ImageSubresourceRange*)
  fun cmd_clear_attachments = vkCmdClearAttachments(command_buffer : CommandBuffer, attachment_count : Uint32T, p_attachments : ClearAttachment*, rect_count : Uint32T, p_rects : ClearRect*)
  fun cmd_resolve_image = vkCmdResolveImage(command_buffer : CommandBuffer, src_image : Image, src_image_layout : ImageLayout, dst_image : Image, dst_image_layout : ImageLayout, region_count : Uint32T, p_regions : ImageResolve*)
  fun cmd_set_event = vkCmdSetEvent(command_buffer : CommandBuffer, event : Event, stage_mask : PipelineStageFlags)
  fun cmd_reset_event = vkCmdResetEvent(command_buffer : CommandBuffer, event : Event, stage_mask : PipelineStageFlags)
  fun cmd_wait_events = vkCmdWaitEvents(command_buffer : CommandBuffer, event_count : Uint32T, p_events : Event*, src_stage_mask : PipelineStageFlags, dst_stage_mask : PipelineStageFlags, memory_barrier_count : Uint32T, p_memory_barriers : MemoryBarrier*, buffer_memory_barrier_count : Uint32T, p_buffer_memory_barriers : BufferMemoryBarrier*, image_memory_barrier_count : Uint32T, p_image_memory_barriers : ImageMemoryBarrier*)
  fun cmd_pipeline_barrier = vkCmdPipelineBarrier(command_buffer : CommandBuffer, src_stage_mask : PipelineStageFlags, dst_stage_mask : PipelineStageFlags, dependency_flags : DependencyFlags, memory_barrier_count : Uint32T, p_memory_barriers : MemoryBarrier*, buffer_memory_barrier_count : Uint32T, p_buffer_memory_barriers : BufferMemoryBarrier*, image_memory_barrier_count : Uint32T, p_image_memory_barriers : ImageMemoryBarrier*)
  fun cmd_begin_query = vkCmdBeginQuery(command_buffer : CommandBuffer, query_pool : QueryPool, query : Uint32T, flags : QueryControlFlags)
  fun cmd_end_query = vkCmdEndQuery(command_buffer : CommandBuffer, query_pool : QueryPool, query : Uint32T)
  fun cmd_reset_query_pool = vkCmdResetQueryPool(command_buffer : CommandBuffer, query_pool : QueryPool, first_query : Uint32T, query_count : Uint32T)
  fun cmd_write_timestamp = vkCmdWriteTimestamp(command_buffer : CommandBuffer, pipeline_stage : PipelineStageFlagBits, query_pool : QueryPool, query : Uint32T)
  enum PipelineStageFlagBits
    VkPipelineStageTopOfPipeBit = 1
    VkPipelineStageDrawIndirectBit = 2
    VkPipelineStageVertexInputBit = 4
    VkPipelineStageVertexShaderBit = 8
    VkPipelineStageTessellationControlShaderBit = 16
    VkPipelineStageTessellationEvaluationShaderBit = 32
    VkPipelineStageGeometryShaderBit = 64
    VkPipelineStageFragmentShaderBit = 128
    VkPipelineStageEarlyFragmentTestsBit = 256
    VkPipelineStageLateFragmentTestsBit = 512
    VkPipelineStageColorAttachmentOutputBit = 1024
    VkPipelineStageComputeShaderBit = 2048
    VkPipelineStageTransferBit = 4096
    VkPipelineStageBottomOfPipeBit = 8192
    VkPipelineStageHostBit = 16384
    VkPipelineStageAllGraphicsBit = 32768
    VkPipelineStageAllCommandsBit = 65536
    VkPipelineStageConditionalRenderingBitExt = 262144
    VkPipelineStageCommandProcessBitNvx = 131072
    VkPipelineStageFlagBitsMaxEnum = 2147483647
  end
  fun cmd_copy_query_pool_results = vkCmdCopyQueryPoolResults(command_buffer : CommandBuffer, query_pool : QueryPool, first_query : Uint32T, query_count : Uint32T, dst_buffer : Buffer, dst_offset : DeviceSize, stride : DeviceSize, flags : QueryResultFlags)
  fun cmd_push_constants = vkCmdPushConstants(command_buffer : CommandBuffer, layout : PipelineLayout, stage_flags : ShaderStageFlags, offset : Uint32T, size : Uint32T, p_values : Void*)
  fun cmd_begin_render_pass = vkCmdBeginRenderPass(command_buffer : CommandBuffer, p_render_pass_begin : RenderPassBeginInfo*, contents : SubpassContents)
  enum SubpassContents
    VkSubpassContentsInline = 0
    VkSubpassContentsSecondaryCommandBuffers = 1
    VkSubpassContentsBeginRange = 0
    VkSubpassContentsEndRange = 1
    VkSubpassContentsRangeSize = 2
    VkSubpassContentsMaxEnum = 2147483647
  end
  fun cmd_next_subpass = vkCmdNextSubpass(command_buffer : CommandBuffer, contents : SubpassContents)
  fun cmd_end_render_pass = vkCmdEndRenderPass(command_buffer : CommandBuffer)
  fun cmd_execute_commands = vkCmdExecuteCommands(command_buffer : CommandBuffer, command_buffer_count : Uint32T, p_command_buffers : CommandBuffer*)
  alias SamplerYcbcrConversionT = Void
  alias DescriptorUpdateTemplateT = Void
  struct PhysicalDeviceSubgroupProperties
    s_type : StructureType
    p_next : Void*
    subgroup_size : Uint32T
    supported_stages : ShaderStageFlags
    supported_operations : SubgroupFeatureFlags
    quad_operations_in_all_stages : Bool32
  end
  alias SubgroupFeatureFlags = Flags
  struct BindBufferMemoryInfo
    s_type : StructureType
    p_next : Void*
    buffer : Buffer
    memory : DeviceMemory
    memory_offset : DeviceSize
  end
  struct BindImageMemoryInfo
    s_type : StructureType
    p_next : Void*
    image : Image
    memory : DeviceMemory
    memory_offset : DeviceSize
  end
  struct PhysicalDevice16BitStorageFeatures
    s_type : StructureType
    p_next : Void*
    storage_buffer16_bit_access : Bool32
    uniform_and_storage_buffer16_bit_access : Bool32
    storage_push_constant16 : Bool32
    storage_input_output16 : Bool32
  end
  struct MemoryDedicatedRequirements
    s_type : StructureType
    p_next : Void*
    prefers_dedicated_allocation : Bool32
    requires_dedicated_allocation : Bool32
  end
  struct MemoryDedicatedAllocateInfo
    s_type : StructureType
    p_next : Void*
    image : Image
    buffer : Buffer
  end
  struct MemoryAllocateFlagsInfo
    s_type : StructureType
    p_next : Void*
    flags : MemoryAllocateFlags
    device_mask : Uint32T
  end
  alias MemoryAllocateFlags = Flags
  struct DeviceGroupRenderPassBeginInfo
    s_type : StructureType
    p_next : Void*
    device_mask : Uint32T
    device_render_area_count : Uint32T
    p_device_render_areas : Rect2D*
  end
  struct DeviceGroupCommandBufferBeginInfo
    s_type : StructureType
    p_next : Void*
    device_mask : Uint32T
  end
  struct DeviceGroupSubmitInfo
    s_type : StructureType
    p_next : Void*
    wait_semaphore_count : Uint32T
    p_wait_semaphore_device_indices : Uint32T*
    command_buffer_count : Uint32T
    p_command_buffer_device_masks : Uint32T*
    signal_semaphore_count : Uint32T
    p_signal_semaphore_device_indices : Uint32T*
  end
  struct DeviceGroupBindSparseInfo
    s_type : StructureType
    p_next : Void*
    resource_device_index : Uint32T
    memory_device_index : Uint32T
  end
  struct BindBufferMemoryDeviceGroupInfo
    s_type : StructureType
    p_next : Void*
    device_index_count : Uint32T
    p_device_indices : Uint32T*
  end
  struct BindImageMemoryDeviceGroupInfo
    s_type : StructureType
    p_next : Void*
    device_index_count : Uint32T
    p_device_indices : Uint32T*
    split_instance_bind_region_count : Uint32T
    p_split_instance_bind_regions : Rect2D*
  end
  struct PhysicalDeviceGroupProperties
    s_type : StructureType
    p_next : Void*
    physical_device_count : Uint32T
    physical_devices : PhysicalDevice[32]
    subset_allocation : Bool32
  end
  struct DeviceGroupDeviceCreateInfo
    s_type : StructureType
    p_next : Void*
    physical_device_count : Uint32T
    p_physical_devices : PhysicalDevice*
  end
  struct BufferMemoryRequirementsInfo2
    s_type : StructureType
    p_next : Void*
    buffer : Buffer
  end
  struct ImageMemoryRequirementsInfo2
    s_type : StructureType
    p_next : Void*
    image : Image
  end
  struct ImageSparseMemoryRequirementsInfo2
    s_type : StructureType
    p_next : Void*
    image : Image
  end
  struct MemoryRequirements2
    s_type : StructureType
    p_next : Void*
    memory_requirements : MemoryRequirements
  end
  struct SparseImageMemoryRequirements2
    s_type : StructureType
    p_next : Void*
    memory_requirements : SparseImageMemoryRequirements
  end
  struct PhysicalDeviceFeatures2
    s_type : StructureType
    p_next : Void*
    features : PhysicalDeviceFeatures
  end
  struct PhysicalDeviceProperties2
    s_type : StructureType
    p_next : Void*
    properties : PhysicalDeviceProperties
  end
  struct FormatProperties2
    s_type : StructureType
    p_next : Void*
    format_properties : FormatProperties
  end
  struct ImageFormatProperties2
    s_type : StructureType
    p_next : Void*
    image_format_properties : ImageFormatProperties
  end
  struct PhysicalDeviceImageFormatInfo2
    s_type : StructureType
    p_next : Void*
    format : Format
    type : ImageType
    tiling : ImageTiling
    usage : ImageUsageFlags
    flags : ImageCreateFlags
  end
  struct QueueFamilyProperties2
    s_type : StructureType
    p_next : Void*
    queue_family_properties : QueueFamilyProperties
  end
  struct PhysicalDeviceMemoryProperties2
    s_type : StructureType
    p_next : Void*
    memory_properties : PhysicalDeviceMemoryProperties
  end
  struct SparseImageFormatProperties2
    s_type : StructureType
    p_next : Void*
    properties : SparseImageFormatProperties
  end
  struct PhysicalDeviceSparseImageFormatInfo2
    s_type : StructureType
    p_next : Void*
    format : Format
    type : ImageType
    samples : SampleCountFlagBits
    usage : ImageUsageFlags
    tiling : ImageTiling
  end
  struct PhysicalDevicePointClippingProperties
    s_type : StructureType
    p_next : Void*
    point_clipping_behavior : PointClippingBehavior
  end
  enum PointClippingBehavior
    VkPointClippingBehaviorAllClipPlanes = 0
    VkPointClippingBehaviorUserClipPlanesOnly = 1
    VkPointClippingBehaviorAllClipPlanesKhr = 0
    VkPointClippingBehaviorUserClipPlanesOnlyKhr = 1
    VkPointClippingBehaviorBeginRange = 0
    VkPointClippingBehaviorEndRange = 1
    VkPointClippingBehaviorRangeSize = 2
    VkPointClippingBehaviorMaxEnum = 2147483647
  end
  struct InputAttachmentAspectReference
    subpass : Uint32T
    input_attachment_index : Uint32T
    aspect_mask : ImageAspectFlags
  end
  struct RenderPassInputAttachmentAspectCreateInfo
    s_type : StructureType
    p_next : Void*
    aspect_reference_count : Uint32T
    p_aspect_references : InputAttachmentAspectReference*
  end
  struct ImageViewUsageCreateInfo
    s_type : StructureType
    p_next : Void*
    usage : ImageUsageFlags
  end
  struct PipelineTessellationDomainOriginStateCreateInfo
    s_type : StructureType
    p_next : Void*
    domain_origin : TessellationDomainOrigin
  end
  enum TessellationDomainOrigin
    VkTessellationDomainOriginUpperLeft = 0
    VkTessellationDomainOriginLowerLeft = 1
    VkTessellationDomainOriginUpperLeftKhr = 0
    VkTessellationDomainOriginLowerLeftKhr = 1
    VkTessellationDomainOriginBeginRange = 0
    VkTessellationDomainOriginEndRange = 1
    VkTessellationDomainOriginRangeSize = 2
    VkTessellationDomainOriginMaxEnum = 2147483647
  end
  struct RenderPassMultiviewCreateInfo
    s_type : StructureType
    p_next : Void*
    subpass_count : Uint32T
    p_view_masks : Uint32T*
    dependency_count : Uint32T
    p_view_offsets : Int32T*
    correlation_mask_count : Uint32T
    p_correlation_masks : Uint32T*
  end
  struct PhysicalDeviceMultiviewFeatures
    s_type : StructureType
    p_next : Void*
    multiview : Bool32
    multiview_geometry_shader : Bool32
    multiview_tessellation_shader : Bool32
  end
  struct PhysicalDeviceMultiviewProperties
    s_type : StructureType
    p_next : Void*
    max_multiview_view_count : Uint32T
    max_multiview_instance_index : Uint32T
  end
  struct PhysicalDeviceVariablePointerFeatures
    s_type : StructureType
    p_next : Void*
    variable_pointers_storage_buffer : Bool32
    variable_pointers : Bool32
  end
  struct PhysicalDeviceProtectedMemoryFeatures
    s_type : StructureType
    p_next : Void*
    protected_memory : Bool32
  end
  struct PhysicalDeviceProtectedMemoryProperties
    s_type : StructureType
    p_next : Void*
    protected_no_fault : Bool32
  end
  struct DeviceQueueInfo2
    s_type : StructureType
    p_next : Void*
    flags : DeviceQueueCreateFlags
    queue_family_index : Uint32T
    queue_index : Uint32T
  end
  struct ProtectedSubmitInfo
    s_type : StructureType
    p_next : Void*
    protected_submit : Bool32
  end
  struct SamplerYcbcrConversionCreateInfo
    s_type : StructureType
    p_next : Void*
    format : Format
    ycbcr_model : SamplerYcbcrModelConversion
    ycbcr_range : SamplerYcbcrRange
    components : ComponentMapping
    x_chroma_offset : ChromaLocation
    y_chroma_offset : ChromaLocation
    chroma_filter : Filter
    force_explicit_reconstruction : Bool32
  end
  enum SamplerYcbcrModelConversion
    VkSamplerYcbcrModelConversionRgbIdentity = 0
    VkSamplerYcbcrModelConversionYcbcrIdentity = 1
    VkSamplerYcbcrModelConversionYcbcr709 = 2
    VkSamplerYcbcrModelConversionYcbcr601 = 3
    VkSamplerYcbcrModelConversionYcbcr2020 = 4
    VkSamplerYcbcrModelConversionRgbIdentityKhr = 0
    VkSamplerYcbcrModelConversionYcbcrIdentityKhr = 1
    VkSamplerYcbcrModelConversionYcbcr709Khr = 2
    VkSamplerYcbcrModelConversionYcbcr601Khr = 3
    VkSamplerYcbcrModelConversionYcbcr2020Khr = 4
    VkSamplerYcbcrModelConversionBeginRange = 0
    VkSamplerYcbcrModelConversionEndRange = 4
    VkSamplerYcbcrModelConversionRangeSize = 5
    VkSamplerYcbcrModelConversionMaxEnum = 2147483647
  end
  enum SamplerYcbcrRange
    VkSamplerYcbcrRangeItuFull = 0
    VkSamplerYcbcrRangeItuNarrow = 1
    VkSamplerYcbcrRangeItuFullKhr = 0
    VkSamplerYcbcrRangeItuNarrowKhr = 1
    VkSamplerYcbcrRangeBeginRange = 0
    VkSamplerYcbcrRangeEndRange = 1
    VkSamplerYcbcrRangeRangeSize = 2
    VkSamplerYcbcrRangeMaxEnum = 2147483647
  end
  enum ChromaLocation
    VkChromaLocationCositedEven = 0
    VkChromaLocationMidpoint = 1
    VkChromaLocationCositedEvenKhr = 0
    VkChromaLocationMidpointKhr = 1
    VkChromaLocationBeginRange = 0
    VkChromaLocationEndRange = 1
    VkChromaLocationRangeSize = 2
    VkChromaLocationMaxEnum = 2147483647
  end
  struct SamplerYcbcrConversionInfo
    s_type : StructureType
    p_next : Void*
    conversion : SamplerYcbcrConversion
  end
  type SamplerYcbcrConversion = Void*
  struct BindImagePlaneMemoryInfo
    s_type : StructureType
    p_next : Void*
    plane_aspect : ImageAspectFlagBits
  end
  enum ImageAspectFlagBits
    VkImageAspectColorBit = 1
    VkImageAspectDepthBit = 2
    VkImageAspectStencilBit = 4
    VkImageAspectMetadataBit = 8
    VkImageAspectPlane0Bit = 16
    VkImageAspectPlane1Bit = 32
    VkImageAspectPlane2Bit = 64
    VkImageAspectPlane0BitKhr = 16
    VkImageAspectPlane1BitKhr = 32
    VkImageAspectPlane2BitKhr = 64
    VkImageAspectFlagBitsMaxEnum = 2147483647
  end
  struct ImagePlaneMemoryRequirementsInfo
    s_type : StructureType
    p_next : Void*
    plane_aspect : ImageAspectFlagBits
  end
  struct PhysicalDeviceSamplerYcbcrConversionFeatures
    s_type : StructureType
    p_next : Void*
    sampler_ycbcr_conversion : Bool32
  end
  struct SamplerYcbcrConversionImageFormatProperties
    s_type : StructureType
    p_next : Void*
    combined_image_sampler_descriptor_count : Uint32T
  end
  struct DescriptorUpdateTemplateEntry
    dst_binding : Uint32T
    dst_array_element : Uint32T
    descriptor_count : Uint32T
    descriptor_type : DescriptorType
    offset : LibC::SizeT
    stride : LibC::SizeT
  end
  struct DescriptorUpdateTemplateCreateInfo
    s_type : StructureType
    p_next : Void*
    flags : DescriptorUpdateTemplateCreateFlags
    descriptor_update_entry_count : Uint32T
    p_descriptor_update_entries : DescriptorUpdateTemplateEntry*
    template_type : DescriptorUpdateTemplateType
    descriptor_set_layout : DescriptorSetLayout
    pipeline_bind_point : PipelineBindPoint
    pipeline_layout : PipelineLayout
    set : Uint32T
  end
  alias DescriptorUpdateTemplateCreateFlags = Flags
  enum DescriptorUpdateTemplateType
    VkDescriptorUpdateTemplateTypeDescriptorSet = 0
    VkDescriptorUpdateTemplateTypePushDescriptorsKhr = 1
    VkDescriptorUpdateTemplateTypeDescriptorSetKhr = 0
    VkDescriptorUpdateTemplateTypeBeginRange = 0
    VkDescriptorUpdateTemplateTypeEndRange = 0
    VkDescriptorUpdateTemplateTypeRangeSize = 1
    VkDescriptorUpdateTemplateTypeMaxEnum = 2147483647
  end
  struct ExternalMemoryProperties
    external_memory_features : ExternalMemoryFeatureFlags
    export_from_imported_handle_types : ExternalMemoryHandleTypeFlags
    compatible_handle_types : ExternalMemoryHandleTypeFlags
  end
  alias ExternalMemoryFeatureFlags = Flags
  alias ExternalMemoryHandleTypeFlags = Flags
  struct PhysicalDeviceExternalImageFormatInfo
    s_type : StructureType
    p_next : Void*
    handle_type : ExternalMemoryHandleTypeFlagBits
  end
  enum ExternalMemoryHandleTypeFlagBits
    VkExternalMemoryHandleTypeOpaqueFdBit = 1
    VkExternalMemoryHandleTypeOpaqueWin32Bit = 2
    VkExternalMemoryHandleTypeOpaqueWin32KmtBit = 4
    VkExternalMemoryHandleTypeD3D11TextureBit = 8
    VkExternalMemoryHandleTypeD3D11TextureKmtBit = 16
    VkExternalMemoryHandleTypeD3D12HeapBit = 32
    VkExternalMemoryHandleTypeD3D12ResourceBit = 64
    VkExternalMemoryHandleTypeDmaBufBitExt = 512
    VkExternalMemoryHandleTypeAndroidHardwareBufferBitAndroid = 1024
    VkExternalMemoryHandleTypeHostAllocationBitExt = 128
    VkExternalMemoryHandleTypeHostMappedForeignMemoryBitExt = 256
    VkExternalMemoryHandleTypeOpaqueFdBitKhr = 1
    VkExternalMemoryHandleTypeOpaqueWin32BitKhr = 2
    VkExternalMemoryHandleTypeOpaqueWin32KmtBitKhr = 4
    VkExternalMemoryHandleTypeD3D11TextureBitKhr = 8
    VkExternalMemoryHandleTypeD3D11TextureKmtBitKhr = 16
    VkExternalMemoryHandleTypeD3D12HeapBitKhr = 32
    VkExternalMemoryHandleTypeD3D12ResourceBitKhr = 64
    VkExternalMemoryHandleTypeFlagBitsMaxEnum = 2147483647
  end
  struct ExternalImageFormatProperties
    s_type : StructureType
    p_next : Void*
    external_memory_properties : ExternalMemoryProperties
  end
  struct PhysicalDeviceExternalBufferInfo
    s_type : StructureType
    p_next : Void*
    flags : BufferCreateFlags
    usage : BufferUsageFlags
    handle_type : ExternalMemoryHandleTypeFlagBits
  end
  struct ExternalBufferProperties
    s_type : StructureType
    p_next : Void*
    external_memory_properties : ExternalMemoryProperties
  end
  struct PhysicalDeviceIdProperties
    s_type : StructureType
    p_next : Void*
    device_uuid : Uint8T[16]
    driver_uuid : Uint8T[16]
    device_luid : Uint8T[8]
    device_node_mask : Uint32T
    device_luid_valid : Bool32
  end
  struct ExternalMemoryImageCreateInfo
    s_type : StructureType
    p_next : Void*
    handle_types : ExternalMemoryHandleTypeFlags
  end
  struct ExternalMemoryBufferCreateInfo
    s_type : StructureType
    p_next : Void*
    handle_types : ExternalMemoryHandleTypeFlags
  end
  struct ExportMemoryAllocateInfo
    s_type : StructureType
    p_next : Void*
    handle_types : ExternalMemoryHandleTypeFlags
  end
  struct PhysicalDeviceExternalFenceInfo
    s_type : StructureType
    p_next : Void*
    handle_type : ExternalFenceHandleTypeFlagBits
  end
  enum ExternalFenceHandleTypeFlagBits
    VkExternalFenceHandleTypeOpaqueFdBit = 1
    VkExternalFenceHandleTypeOpaqueWin32Bit = 2
    VkExternalFenceHandleTypeOpaqueWin32KmtBit = 4
    VkExternalFenceHandleTypeSyncFdBit = 8
    VkExternalFenceHandleTypeOpaqueFdBitKhr = 1
    VkExternalFenceHandleTypeOpaqueWin32BitKhr = 2
    VkExternalFenceHandleTypeOpaqueWin32KmtBitKhr = 4
    VkExternalFenceHandleTypeSyncFdBitKhr = 8
    VkExternalFenceHandleTypeFlagBitsMaxEnum = 2147483647
  end
  struct ExternalFenceProperties
    s_type : StructureType
    p_next : Void*
    export_from_imported_handle_types : ExternalFenceHandleTypeFlags
    compatible_handle_types : ExternalFenceHandleTypeFlags
    external_fence_features : ExternalFenceFeatureFlags
  end
  alias ExternalFenceHandleTypeFlags = Flags
  alias ExternalFenceFeatureFlags = Flags
  struct ExportFenceCreateInfo
    s_type : StructureType
    p_next : Void*
    handle_types : ExternalFenceHandleTypeFlags
  end
  struct ExportSemaphoreCreateInfo
    s_type : StructureType
    p_next : Void*
    handle_types : ExternalSemaphoreHandleTypeFlags
  end
  alias ExternalSemaphoreHandleTypeFlags = Flags
  struct PhysicalDeviceExternalSemaphoreInfo
    s_type : StructureType
    p_next : Void*
    handle_type : ExternalSemaphoreHandleTypeFlagBits
  end
  enum ExternalSemaphoreHandleTypeFlagBits
    VkExternalSemaphoreHandleTypeOpaqueFdBit = 1
    VkExternalSemaphoreHandleTypeOpaqueWin32Bit = 2
    VkExternalSemaphoreHandleTypeOpaqueWin32KmtBit = 4
    VkExternalSemaphoreHandleTypeD3D12FenceBit = 8
    VkExternalSemaphoreHandleTypeSyncFdBit = 16
    VkExternalSemaphoreHandleTypeOpaqueFdBitKhr = 1
    VkExternalSemaphoreHandleTypeOpaqueWin32BitKhr = 2
    VkExternalSemaphoreHandleTypeOpaqueWin32KmtBitKhr = 4
    VkExternalSemaphoreHandleTypeD3D12FenceBitKhr = 8
    VkExternalSemaphoreHandleTypeSyncFdBitKhr = 16
    VkExternalSemaphoreHandleTypeFlagBitsMaxEnum = 2147483647
  end
  struct ExternalSemaphoreProperties
    s_type : StructureType
    p_next : Void*
    export_from_imported_handle_types : ExternalSemaphoreHandleTypeFlags
    compatible_handle_types : ExternalSemaphoreHandleTypeFlags
    external_semaphore_features : ExternalSemaphoreFeatureFlags
  end
  alias ExternalSemaphoreFeatureFlags = Flags
  struct PhysicalDeviceMaintenance3Properties
    s_type : StructureType
    p_next : Void*
    max_per_set_descriptors : Uint32T
    max_memory_allocation_size : DeviceSize
  end
  struct DescriptorSetLayoutSupport
    s_type : StructureType
    p_next : Void*
    supported : Bool32
  end
  struct PhysicalDeviceShaderDrawParameterFeatures
    s_type : StructureType
    p_next : Void*
    shader_draw_parameters : Bool32
  end
  fun enumerate_instance_version = vkEnumerateInstanceVersion(p_api_version : Uint32T*) : Result
  fun bind_buffer_memory2 = vkBindBufferMemory2(device : Device, bind_info_count : Uint32T, p_bind_infos : BindBufferMemoryInfo*) : Result
  fun bind_image_memory2 = vkBindImageMemory2(device : Device, bind_info_count : Uint32T, p_bind_infos : BindImageMemoryInfo*) : Result
  fun get_device_group_peer_memory_features = vkGetDeviceGroupPeerMemoryFeatures(device : Device, heap_index : Uint32T, local_device_index : Uint32T, remote_device_index : Uint32T, p_peer_memory_features : PeerMemoryFeatureFlags*)
  alias PeerMemoryFeatureFlags = Flags
  fun cmd_set_device_mask = vkCmdSetDeviceMask(command_buffer : CommandBuffer, device_mask : Uint32T)
  fun cmd_dispatch_base = vkCmdDispatchBase(command_buffer : CommandBuffer, base_group_x : Uint32T, base_group_y : Uint32T, base_group_z : Uint32T, group_count_x : Uint32T, group_count_y : Uint32T, group_count_z : Uint32T)
  fun enumerate_physical_device_groups = vkEnumeratePhysicalDeviceGroups(instance : Instance, p_physical_device_group_count : Uint32T*, p_physical_device_group_properties : PhysicalDeviceGroupProperties*) : Result
  fun get_image_memory_requirements2 = vkGetImageMemoryRequirements2(device : Device, p_info : ImageMemoryRequirementsInfo2*, p_memory_requirements : MemoryRequirements2*)
  fun get_buffer_memory_requirements2 = vkGetBufferMemoryRequirements2(device : Device, p_info : BufferMemoryRequirementsInfo2*, p_memory_requirements : MemoryRequirements2*)
  fun get_image_sparse_memory_requirements2 = vkGetImageSparseMemoryRequirements2(device : Device, p_info : ImageSparseMemoryRequirementsInfo2*, p_sparse_memory_requirement_count : Uint32T*, p_sparse_memory_requirements : SparseImageMemoryRequirements2*)
  fun get_physical_device_features2 = vkGetPhysicalDeviceFeatures2(physical_device : PhysicalDevice, p_features : PhysicalDeviceFeatures2*)
  fun get_physical_device_properties2 = vkGetPhysicalDeviceProperties2(physical_device : PhysicalDevice, p_properties : PhysicalDeviceProperties2*)
  fun get_physical_device_format_properties2 = vkGetPhysicalDeviceFormatProperties2(physical_device : PhysicalDevice, format : Format, p_format_properties : FormatProperties2*)
  fun get_physical_device_image_format_properties2 = vkGetPhysicalDeviceImageFormatProperties2(physical_device : PhysicalDevice, p_image_format_info : PhysicalDeviceImageFormatInfo2*, p_image_format_properties : ImageFormatProperties2*) : Result
  fun get_physical_device_queue_family_properties2 = vkGetPhysicalDeviceQueueFamilyProperties2(physical_device : PhysicalDevice, p_queue_family_property_count : Uint32T*, p_queue_family_properties : QueueFamilyProperties2*)
  fun get_physical_device_memory_properties2 = vkGetPhysicalDeviceMemoryProperties2(physical_device : PhysicalDevice, p_memory_properties : PhysicalDeviceMemoryProperties2*)
  fun get_physical_device_sparse_image_format_properties2 = vkGetPhysicalDeviceSparseImageFormatProperties2(physical_device : PhysicalDevice, p_format_info : PhysicalDeviceSparseImageFormatInfo2*, p_property_count : Uint32T*, p_properties : SparseImageFormatProperties2*)
  fun trim_command_pool = vkTrimCommandPool(device : Device, command_pool : CommandPool, flags : CommandPoolTrimFlags)
  alias CommandPoolTrimFlags = Flags
  fun get_device_queue2 = vkGetDeviceQueue2(device : Device, p_queue_info : DeviceQueueInfo2*, p_queue : Queue*)
  fun create_sampler_ycbcr_conversion = vkCreateSamplerYcbcrConversion(device : Device, p_create_info : SamplerYcbcrConversionCreateInfo*, p_allocator : AllocationCallbacks*, p_ycbcr_conversion : SamplerYcbcrConversion*) : Result
  fun destroy_sampler_ycbcr_conversion = vkDestroySamplerYcbcrConversion(device : Device, ycbcr_conversion : SamplerYcbcrConversion, p_allocator : AllocationCallbacks*)
  fun create_descriptor_update_template = vkCreateDescriptorUpdateTemplate(device : Device, p_create_info : DescriptorUpdateTemplateCreateInfo*, p_allocator : AllocationCallbacks*, p_descriptor_update_template : DescriptorUpdateTemplate*) : Result
  type DescriptorUpdateTemplate = Void*
  fun destroy_descriptor_update_template = vkDestroyDescriptorUpdateTemplate(device : Device, descriptor_update_template : DescriptorUpdateTemplate, p_allocator : AllocationCallbacks*)
  fun update_descriptor_set_with_template = vkUpdateDescriptorSetWithTemplate(device : Device, descriptor_set : DescriptorSet, descriptor_update_template : DescriptorUpdateTemplate, p_data : Void*)
  fun get_physical_device_external_buffer_properties = vkGetPhysicalDeviceExternalBufferProperties(physical_device : PhysicalDevice, p_external_buffer_info : PhysicalDeviceExternalBufferInfo*, p_external_buffer_properties : ExternalBufferProperties*)
  fun get_physical_device_external_fence_properties = vkGetPhysicalDeviceExternalFenceProperties(physical_device : PhysicalDevice, p_external_fence_info : PhysicalDeviceExternalFenceInfo*, p_external_fence_properties : ExternalFenceProperties*)
  fun get_physical_device_external_semaphore_properties = vkGetPhysicalDeviceExternalSemaphoreProperties(physical_device : PhysicalDevice, p_external_semaphore_info : PhysicalDeviceExternalSemaphoreInfo*, p_external_semaphore_properties : ExternalSemaphoreProperties*)
  fun get_descriptor_set_layout_support = vkGetDescriptorSetLayoutSupport(device : Device, p_create_info : DescriptorSetLayoutCreateInfo*, p_support : DescriptorSetLayoutSupport*)
  alias SurfaceKhrT = Void
  struct SurfaceCapabilitiesKhr
    min_image_count : Uint32T
    max_image_count : Uint32T
    current_extent : Extent2D
    min_image_extent : Extent2D
    max_image_extent : Extent2D
    max_image_array_layers : Uint32T
    supported_transforms : SurfaceTransformFlagsKhr
    current_transform : SurfaceTransformFlagBitsKhr
    supported_composite_alpha : CompositeAlphaFlagsKhr
    supported_usage_flags : ImageUsageFlags
  end
  alias SurfaceTransformFlagsKhr = Flags
  enum SurfaceTransformFlagBitsKhr
    VkSurfaceTransformIdentityBitKhr = 1
    VkSurfaceTransformRotate90BitKhr = 2
    VkSurfaceTransformRotate180BitKhr = 4
    VkSurfaceTransformRotate270BitKhr = 8
    VkSurfaceTransformHorizontalMirrorBitKhr = 16
    VkSurfaceTransformHorizontalMirrorRotate90BitKhr = 32
    VkSurfaceTransformHorizontalMirrorRotate180BitKhr = 64
    VkSurfaceTransformHorizontalMirrorRotate270BitKhr = 128
    VkSurfaceTransformInheritBitKhr = 256
    VkSurfaceTransformFlagBitsMaxEnumKhr = 2147483647
  end
  alias CompositeAlphaFlagsKhr = Flags
  struct SurfaceFormatKhr
    format : Format
    color_space : ColorSpaceKhr
  end
  enum ColorSpaceKhr
    VkColorSpaceSrgbNonlinearKhr = 0
    VkColorSpaceDisplayP3NonlinearExt = 1000104001
    VkColorSpaceExtendedSrgbLinearExt = 1000104002
    VkColorSpaceDciP3LinearExt = 1000104003
    VkColorSpaceDciP3NonlinearExt = 1000104004
    VkColorSpaceBt709LinearExt = 1000104005
    VkColorSpaceBt709NonlinearExt = 1000104006
    VkColorSpaceBt2020LinearExt = 1000104007
    VkColorSpaceHdr10St2084Ext = 1000104008
    VkColorSpaceDolbyvisionExt = 1000104009
    VkColorSpaceHdr10HlgExt = 1000104010
    VkColorSpaceAdobergbLinearExt = 1000104011
    VkColorSpaceAdobergbNonlinearExt = 1000104012
    VkColorSpacePassThroughExt = 1000104013
    VkColorSpaceExtendedSrgbNonlinearExt = 1000104014
    VkColorSpaceBeginRangeKhr = 0
    VkColorSpaceEndRangeKhr = 0
    VkColorSpaceRangeSizeKhr = 1
    VkColorSpaceMaxEnumKhr = 2147483647
  end
  fun destroy_surface_khr = vkDestroySurfaceKHR(instance : Instance, surface : SurfaceKhr, p_allocator : AllocationCallbacks*)
  type SurfaceKhr = Void*
  fun get_physical_device_surface_support_khr = vkGetPhysicalDeviceSurfaceSupportKHR(physical_device : PhysicalDevice, queue_family_index : Uint32T, surface : SurfaceKhr, p_supported : Bool32*) : Result
  fun get_physical_device_surface_capabilities_khr = vkGetPhysicalDeviceSurfaceCapabilitiesKHR(physical_device : PhysicalDevice, surface : SurfaceKhr, p_surface_capabilities : SurfaceCapabilitiesKhr*) : Result
  fun get_physical_device_surface_formats_khr = vkGetPhysicalDeviceSurfaceFormatsKHR(physical_device : PhysicalDevice, surface : SurfaceKhr, p_surface_format_count : Uint32T*, p_surface_formats : SurfaceFormatKhr*) : Result
  fun get_physical_device_surface_present_modes_khr = vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device : PhysicalDevice, surface : SurfaceKhr, p_present_mode_count : Uint32T*, p_present_modes : PresentModeKhr*) : Result
  enum PresentModeKhr
    VkPresentModeImmediateKhr = 0
    VkPresentModeMailboxKhr = 1
    VkPresentModeFifoKhr = 2
    VkPresentModeFifoRelaxedKhr = 3
    VkPresentModeSharedDemandRefreshKhr = 1000111000
    VkPresentModeSharedContinuousRefreshKhr = 1000111001
    VkPresentModeBeginRangeKhr = 0
    VkPresentModeEndRangeKhr = 3
    VkPresentModeRangeSizeKhr = 4
    VkPresentModeMaxEnumKhr = 2147483647
  end
  alias SwapchainKhrT = Void
  struct SwapchainCreateInfoKhr
    s_type : StructureType
    p_next : Void*
    flags : SwapchainCreateFlagsKhr
    surface : SurfaceKhr
    min_image_count : Uint32T
    image_format : Format
    image_color_space : ColorSpaceKhr
    image_extent : Extent2D
    image_array_layers : Uint32T
    image_usage : ImageUsageFlags
    image_sharing_mode : SharingMode
    queue_family_index_count : Uint32T
    p_queue_family_indices : Uint32T*
    pre_transform : SurfaceTransformFlagBitsKhr
    composite_alpha : CompositeAlphaFlagBitsKhr
    present_mode : PresentModeKhr
    clipped : Bool32
    old_swapchain : SwapchainKhr
  end
  alias SwapchainCreateFlagsKhr = Flags
  enum CompositeAlphaFlagBitsKhr
    VkCompositeAlphaOpaqueBitKhr = 1
    VkCompositeAlphaPreMultipliedBitKhr = 2
    VkCompositeAlphaPostMultipliedBitKhr = 4
    VkCompositeAlphaInheritBitKhr = 8
    VkCompositeAlphaFlagBitsMaxEnumKhr = 2147483647
  end
  type SwapchainKhr = Void*
  struct PresentInfoKhr
    s_type : StructureType
    p_next : Void*
    wait_semaphore_count : Uint32T
    p_wait_semaphores : Semaphore*
    swapchain_count : Uint32T
    p_swapchains : SwapchainKhr*
    p_image_indices : Uint32T*
    p_results : Result*
  end
  struct ImageSwapchainCreateInfoKhr
    s_type : StructureType
    p_next : Void*
    swapchain : SwapchainKhr
  end
  struct BindImageMemorySwapchainInfoKhr
    s_type : StructureType
    p_next : Void*
    swapchain : SwapchainKhr
    image_index : Uint32T
  end
  struct AcquireNextImageInfoKhr
    s_type : StructureType
    p_next : Void*
    swapchain : SwapchainKhr
    timeout : Uint64T
    semaphore : Semaphore
    fence : Fence
    device_mask : Uint32T
  end
  struct DeviceGroupPresentCapabilitiesKhr
    s_type : StructureType
    p_next : Void*
    present_mask : Uint32T[32]
    modes : DeviceGroupPresentModeFlagsKhr
  end
  alias DeviceGroupPresentModeFlagsKhr = Flags
  struct DeviceGroupPresentInfoKhr
    s_type : StructureType
    p_next : Void*
    swapchain_count : Uint32T
    p_device_masks : Uint32T*
    mode : DeviceGroupPresentModeFlagBitsKhr
  end
  enum DeviceGroupPresentModeFlagBitsKhr
    VkDeviceGroupPresentModeLocalBitKhr = 1
    VkDeviceGroupPresentModeRemoteBitKhr = 2
    VkDeviceGroupPresentModeSumBitKhr = 4
    VkDeviceGroupPresentModeLocalMultiDeviceBitKhr = 8
    VkDeviceGroupPresentModeFlagBitsMaxEnumKhr = 2147483647
  end
  struct DeviceGroupSwapchainCreateInfoKhr
    s_type : StructureType
    p_next : Void*
    modes : DeviceGroupPresentModeFlagsKhr
  end
  fun create_swapchain_khr = vkCreateSwapchainKHR(device : Device, p_create_info : SwapchainCreateInfoKhr*, p_allocator : AllocationCallbacks*, p_swapchain : SwapchainKhr*) : Result
  fun destroy_swapchain_khr = vkDestroySwapchainKHR(device : Device, swapchain : SwapchainKhr, p_allocator : AllocationCallbacks*)
  fun get_swapchain_images_khr = vkGetSwapchainImagesKHR(device : Device, swapchain : SwapchainKhr, p_swapchain_image_count : Uint32T*, p_swapchain_images : Image*) : Result
  fun acquire_next_image_khr = vkAcquireNextImageKHR(device : Device, swapchain : SwapchainKhr, timeout : Uint64T, semaphore : Semaphore, fence : Fence, p_image_index : Uint32T*) : Result
  fun queue_present_khr = vkQueuePresentKHR(queue : Queue, p_present_info : PresentInfoKhr*) : Result
  fun get_device_group_present_capabilities_khr = vkGetDeviceGroupPresentCapabilitiesKHR(device : Device, p_device_group_present_capabilities : DeviceGroupPresentCapabilitiesKhr*) : Result
  fun get_device_group_surface_present_modes_khr = vkGetDeviceGroupSurfacePresentModesKHR(device : Device, surface : SurfaceKhr, p_modes : DeviceGroupPresentModeFlagsKhr*) : Result
  fun get_physical_device_present_rectangles_khr = vkGetPhysicalDevicePresentRectanglesKHR(physical_device : PhysicalDevice, surface : SurfaceKhr, p_rect_count : Uint32T*, p_rects : Rect2D*) : Result
  fun acquire_next_image2_khr = vkAcquireNextImage2KHR(device : Device, p_acquire_info : AcquireNextImageInfoKhr*, p_image_index : Uint32T*) : Result
  alias DisplayKhrT = Void
  alias DisplayModeKhrT = Void
  struct DisplayPropertiesKhr
    display : DisplayKhr
    display_name : LibC::Char*
    physical_dimensions : Extent2D
    physical_resolution : Extent2D
    supported_transforms : SurfaceTransformFlagsKhr
    plane_reorder_possible : Bool32
    persistent_content : Bool32
  end
  type DisplayKhr = Void*
  struct DisplayModeParametersKhr
    visible_region : Extent2D
    refresh_rate : Uint32T
  end
  struct DisplayModePropertiesKhr
    display_mode : DisplayModeKhr
    parameters : DisplayModeParametersKhr
  end
  type DisplayModeKhr = Void*
  struct DisplayModeCreateInfoKhr
    s_type : StructureType
    p_next : Void*
    flags : DisplayModeCreateFlagsKhr
    parameters : DisplayModeParametersKhr
  end
  alias DisplayModeCreateFlagsKhr = Flags
  struct DisplayPlaneCapabilitiesKhr
    supported_alpha : DisplayPlaneAlphaFlagsKhr
    min_src_position : Offset2D
    max_src_position : Offset2D
    min_src_extent : Extent2D
    max_src_extent : Extent2D
    min_dst_position : Offset2D
    max_dst_position : Offset2D
    min_dst_extent : Extent2D
    max_dst_extent : Extent2D
  end
  alias DisplayPlaneAlphaFlagsKhr = Flags
  struct DisplayPlanePropertiesKhr
    current_display : DisplayKhr
    current_stack_index : Uint32T
  end
  struct DisplaySurfaceCreateInfoKhr
    s_type : StructureType
    p_next : Void*
    flags : DisplaySurfaceCreateFlagsKhr
    display_mode : DisplayModeKhr
    plane_index : Uint32T
    plane_stack_index : Uint32T
    transform : SurfaceTransformFlagBitsKhr
    global_alpha : LibC::Float
    alpha_mode : DisplayPlaneAlphaFlagBitsKhr
    image_extent : Extent2D
  end
  alias DisplaySurfaceCreateFlagsKhr = Flags
  enum DisplayPlaneAlphaFlagBitsKhr
    VkDisplayPlaneAlphaOpaqueBitKhr = 1
    VkDisplayPlaneAlphaGlobalBitKhr = 2
    VkDisplayPlaneAlphaPerPixelBitKhr = 4
    VkDisplayPlaneAlphaPerPixelPremultipliedBitKhr = 8
    VkDisplayPlaneAlphaFlagBitsMaxEnumKhr = 2147483647
  end
  fun get_physical_device_display_properties_khr = vkGetPhysicalDeviceDisplayPropertiesKHR(physical_device : PhysicalDevice, p_property_count : Uint32T*, p_properties : DisplayPropertiesKhr*) : Result
  fun get_physical_device_display_plane_properties_khr = vkGetPhysicalDeviceDisplayPlanePropertiesKHR(physical_device : PhysicalDevice, p_property_count : Uint32T*, p_properties : DisplayPlanePropertiesKhr*) : Result
  fun get_display_plane_supported_displays_khr = vkGetDisplayPlaneSupportedDisplaysKHR(physical_device : PhysicalDevice, plane_index : Uint32T, p_display_count : Uint32T*, p_displays : DisplayKhr*) : Result
  fun get_display_mode_properties_khr = vkGetDisplayModePropertiesKHR(physical_device : PhysicalDevice, display : DisplayKhr, p_property_count : Uint32T*, p_properties : DisplayModePropertiesKhr*) : Result
  fun create_display_mode_khr = vkCreateDisplayModeKHR(physical_device : PhysicalDevice, display : DisplayKhr, p_create_info : DisplayModeCreateInfoKhr*, p_allocator : AllocationCallbacks*, p_mode : DisplayModeKhr*) : Result
  fun get_display_plane_capabilities_khr = vkGetDisplayPlaneCapabilitiesKHR(physical_device : PhysicalDevice, mode : DisplayModeKhr, plane_index : Uint32T, p_capabilities : DisplayPlaneCapabilitiesKhr*) : Result
  fun create_display_plane_surface_khr = vkCreateDisplayPlaneSurfaceKHR(instance : Instance, p_create_info : DisplaySurfaceCreateInfoKhr*, p_allocator : AllocationCallbacks*, p_surface : SurfaceKhr*) : Result
  struct DisplayPresentInfoKhr
    s_type : StructureType
    p_next : Void*
    src_rect : Rect2D
    dst_rect : Rect2D
    persistent : Bool32
  end
  fun create_shared_swapchains_khr = vkCreateSharedSwapchainsKHR(device : Device, swapchain_count : Uint32T, p_create_infos : SwapchainCreateInfoKhr*, p_allocator : AllocationCallbacks*, p_swapchains : SwapchainKhr*) : Result
  fun get_physical_device_features2_khr = vkGetPhysicalDeviceFeatures2KHR(physical_device : PhysicalDevice, p_features : PhysicalDeviceFeatures2*)
  fun get_physical_device_properties2_khr = vkGetPhysicalDeviceProperties2KHR(physical_device : PhysicalDevice, p_properties : PhysicalDeviceProperties2*)
  fun get_physical_device_format_properties2_khr = vkGetPhysicalDeviceFormatProperties2KHR(physical_device : PhysicalDevice, format : Format, p_format_properties : FormatProperties2*)
  fun get_physical_device_image_format_properties2_khr = vkGetPhysicalDeviceImageFormatProperties2KHR(physical_device : PhysicalDevice, p_image_format_info : PhysicalDeviceImageFormatInfo2*, p_image_format_properties : ImageFormatProperties2*) : Result
  fun get_physical_device_queue_family_properties2_khr = vkGetPhysicalDeviceQueueFamilyProperties2KHR(physical_device : PhysicalDevice, p_queue_family_property_count : Uint32T*, p_queue_family_properties : QueueFamilyProperties2*)
  fun get_physical_device_memory_properties2_khr = vkGetPhysicalDeviceMemoryProperties2KHR(physical_device : PhysicalDevice, p_memory_properties : PhysicalDeviceMemoryProperties2*)
  fun get_physical_device_sparse_image_format_properties2_khr = vkGetPhysicalDeviceSparseImageFormatProperties2KHR(physical_device : PhysicalDevice, p_format_info : PhysicalDeviceSparseImageFormatInfo2*, p_property_count : Uint32T*, p_properties : SparseImageFormatProperties2*)
  fun get_device_group_peer_memory_features_khr = vkGetDeviceGroupPeerMemoryFeaturesKHR(device : Device, heap_index : Uint32T, local_device_index : Uint32T, remote_device_index : Uint32T, p_peer_memory_features : PeerMemoryFeatureFlags*)
  fun cmd_set_device_mask_khr = vkCmdSetDeviceMaskKHR(command_buffer : CommandBuffer, device_mask : Uint32T)
  fun cmd_dispatch_base_khr = vkCmdDispatchBaseKHR(command_buffer : CommandBuffer, base_group_x : Uint32T, base_group_y : Uint32T, base_group_z : Uint32T, group_count_x : Uint32T, group_count_y : Uint32T, group_count_z : Uint32T)
  fun trim_command_pool_khr = vkTrimCommandPoolKHR(device : Device, command_pool : CommandPool, flags : CommandPoolTrimFlags)
  fun enumerate_physical_device_groups_khr = vkEnumeratePhysicalDeviceGroupsKHR(instance : Instance, p_physical_device_group_count : Uint32T*, p_physical_device_group_properties : PhysicalDeviceGroupProperties*) : Result
  fun get_physical_device_external_buffer_properties_khr = vkGetPhysicalDeviceExternalBufferPropertiesKHR(physical_device : PhysicalDevice, p_external_buffer_info : PhysicalDeviceExternalBufferInfo*, p_external_buffer_properties : ExternalBufferProperties*)
  struct ImportMemoryFdInfoKhr
    s_type : StructureType
    p_next : Void*
    handle_type : ExternalMemoryHandleTypeFlagBits
    fd : LibC::Int
  end
  struct MemoryFdPropertiesKhr
    s_type : StructureType
    p_next : Void*
    memory_type_bits : Uint32T
  end
  struct MemoryGetFdInfoKhr
    s_type : StructureType
    p_next : Void*
    memory : DeviceMemory
    handle_type : ExternalMemoryHandleTypeFlagBits
  end
  fun get_memory_fd_khr = vkGetMemoryFdKHR(device : Device, p_get_fd_info : MemoryGetFdInfoKhr*, p_fd : LibC::Int*) : Result
  fun get_memory_fd_properties_khr = vkGetMemoryFdPropertiesKHR(device : Device, handle_type : ExternalMemoryHandleTypeFlagBits, fd : LibC::Int, p_memory_fd_properties : MemoryFdPropertiesKhr*) : Result
  fun get_physical_device_external_semaphore_properties_khr = vkGetPhysicalDeviceExternalSemaphorePropertiesKHR(physical_device : PhysicalDevice, p_external_semaphore_info : PhysicalDeviceExternalSemaphoreInfo*, p_external_semaphore_properties : ExternalSemaphoreProperties*)
  struct ImportSemaphoreFdInfoKhr
    s_type : StructureType
    p_next : Void*
    semaphore : Semaphore
    flags : SemaphoreImportFlags
    handle_type : ExternalSemaphoreHandleTypeFlagBits
    fd : LibC::Int
  end
  alias SemaphoreImportFlags = Flags
  struct SemaphoreGetFdInfoKhr
    s_type : StructureType
    p_next : Void*
    semaphore : Semaphore
    handle_type : ExternalSemaphoreHandleTypeFlagBits
  end
  fun import_semaphore_fd_khr = vkImportSemaphoreFdKHR(device : Device, p_import_semaphore_fd_info : ImportSemaphoreFdInfoKhr*) : Result
  fun get_semaphore_fd_khr = vkGetSemaphoreFdKHR(device : Device, p_get_fd_info : SemaphoreGetFdInfoKhr*, p_fd : LibC::Int*) : Result
  struct PhysicalDevicePushDescriptorPropertiesKhr
    s_type : StructureType
    p_next : Void*
    max_push_descriptors : Uint32T
  end
  fun cmd_push_descriptor_set_khr = vkCmdPushDescriptorSetKHR(command_buffer : CommandBuffer, pipeline_bind_point : PipelineBindPoint, layout : PipelineLayout, set : Uint32T, descriptor_write_count : Uint32T, p_descriptor_writes : WriteDescriptorSet*)
  fun cmd_push_descriptor_set_with_template_khr = vkCmdPushDescriptorSetWithTemplateKHR(command_buffer : CommandBuffer, descriptor_update_template : DescriptorUpdateTemplate, layout : PipelineLayout, set : Uint32T, p_data : Void*)
  struct RectLayerKhr
    offset : Offset2D
    extent : Extent2D
    layer : Uint32T
  end
  struct PresentRegionKhr
    rectangle_count : Uint32T
    p_rectangles : RectLayerKhr*
  end
  struct PresentRegionsKhr
    s_type : StructureType
    p_next : Void*
    swapchain_count : Uint32T
    p_regions : PresentRegionKhr*
  end
  fun create_descriptor_update_template_khr = vkCreateDescriptorUpdateTemplateKHR(device : Device, p_create_info : DescriptorUpdateTemplateCreateInfo*, p_allocator : AllocationCallbacks*, p_descriptor_update_template : DescriptorUpdateTemplate*) : Result
  fun destroy_descriptor_update_template_khr = vkDestroyDescriptorUpdateTemplateKHR(device : Device, descriptor_update_template : DescriptorUpdateTemplate, p_allocator : AllocationCallbacks*)
  fun update_descriptor_set_with_template_khr = vkUpdateDescriptorSetWithTemplateKHR(device : Device, descriptor_set : DescriptorSet, descriptor_update_template : DescriptorUpdateTemplate, p_data : Void*)
  struct AttachmentDescription2Khr
    s_type : StructureType
    p_next : Void*
    flags : AttachmentDescriptionFlags
    format : Format
    samples : SampleCountFlagBits
    load_op : AttachmentLoadOp
    store_op : AttachmentStoreOp
    stencil_load_op : AttachmentLoadOp
    stencil_store_op : AttachmentStoreOp
    initial_layout : ImageLayout
    final_layout : ImageLayout
  end
  struct AttachmentReference2Khr
    s_type : StructureType
    p_next : Void*
    attachment : Uint32T
    layout : ImageLayout
    aspect_mask : ImageAspectFlags
  end
  struct SubpassDescription2Khr
    s_type : StructureType
    p_next : Void*
    flags : SubpassDescriptionFlags
    pipeline_bind_point : PipelineBindPoint
    view_mask : Uint32T
    input_attachment_count : Uint32T
    p_input_attachments : AttachmentReference2Khr*
    color_attachment_count : Uint32T
    p_color_attachments : AttachmentReference2Khr*
    p_resolve_attachments : AttachmentReference2Khr*
    p_depth_stencil_attachment : AttachmentReference2Khr*
    preserve_attachment_count : Uint32T
    p_preserve_attachments : Uint32T*
  end
  struct SubpassDependency2Khr
    s_type : StructureType
    p_next : Void*
    src_subpass : Uint32T
    dst_subpass : Uint32T
    src_stage_mask : PipelineStageFlags
    dst_stage_mask : PipelineStageFlags
    src_access_mask : AccessFlags
    dst_access_mask : AccessFlags
    dependency_flags : DependencyFlags
    view_offset : Int32T
  end
  struct RenderPassCreateInfo2Khr
    s_type : StructureType
    p_next : Void*
    flags : RenderPassCreateFlags
    attachment_count : Uint32T
    p_attachments : AttachmentDescription2Khr*
    subpass_count : Uint32T
    p_subpasses : SubpassDescription2Khr*
    dependency_count : Uint32T
    p_dependencies : SubpassDependency2Khr*
    correlated_view_mask_count : Uint32T
    p_correlated_view_masks : Uint32T*
  end
  struct SubpassBeginInfoKhr
    s_type : StructureType
    p_next : Void*
    contents : SubpassContents
  end
  struct SubpassEndInfoKhr
    s_type : StructureType
    p_next : Void*
  end
  fun create_render_pass2_khr = vkCreateRenderPass2KHR(device : Device, p_create_info : RenderPassCreateInfo2Khr*, p_allocator : AllocationCallbacks*, p_render_pass : RenderPass*) : Result
  fun cmd_begin_render_pass2_khr = vkCmdBeginRenderPass2KHR(command_buffer : CommandBuffer, p_render_pass_begin : RenderPassBeginInfo*, p_subpass_begin_info : SubpassBeginInfoKhr*)
  fun cmd_next_subpass2_khr = vkCmdNextSubpass2KHR(command_buffer : CommandBuffer, p_subpass_begin_info : SubpassBeginInfoKhr*, p_subpass_end_info : SubpassEndInfoKhr*)
  fun cmd_end_render_pass2_khr = vkCmdEndRenderPass2KHR(command_buffer : CommandBuffer, p_subpass_end_info : SubpassEndInfoKhr*)
  struct SharedPresentSurfaceCapabilitiesKhr
    s_type : StructureType
    p_next : Void*
    shared_present_supported_usage_flags : ImageUsageFlags
  end
  fun get_swapchain_status_khr = vkGetSwapchainStatusKHR(device : Device, swapchain : SwapchainKhr) : Result
  fun get_physical_device_external_fence_properties_khr = vkGetPhysicalDeviceExternalFencePropertiesKHR(physical_device : PhysicalDevice, p_external_fence_info : PhysicalDeviceExternalFenceInfo*, p_external_fence_properties : ExternalFenceProperties*)
  struct ImportFenceFdInfoKhr
    s_type : StructureType
    p_next : Void*
    fence : Fence
    flags : FenceImportFlags
    handle_type : ExternalFenceHandleTypeFlagBits
    fd : LibC::Int
  end
  alias FenceImportFlags = Flags
  struct FenceGetFdInfoKhr
    s_type : StructureType
    p_next : Void*
    fence : Fence
    handle_type : ExternalFenceHandleTypeFlagBits
  end
  fun import_fence_fd_khr = vkImportFenceFdKHR(device : Device, p_import_fence_fd_info : ImportFenceFdInfoKhr*) : Result
  fun get_fence_fd_khr = vkGetFenceFdKHR(device : Device, p_get_fd_info : FenceGetFdInfoKhr*, p_fd : LibC::Int*) : Result
  struct PhysicalDeviceSurfaceInfo2Khr
    s_type : StructureType
    p_next : Void*
    surface : SurfaceKhr
  end
  struct SurfaceCapabilities2Khr
    s_type : StructureType
    p_next : Void*
    surface_capabilities : SurfaceCapabilitiesKhr
  end
  struct SurfaceFormat2Khr
    s_type : StructureType
    p_next : Void*
    surface_format : SurfaceFormatKhr
  end
  fun get_physical_device_surface_capabilities2_khr = vkGetPhysicalDeviceSurfaceCapabilities2KHR(physical_device : PhysicalDevice, p_surface_info : PhysicalDeviceSurfaceInfo2Khr*, p_surface_capabilities : SurfaceCapabilities2Khr*) : Result
  fun get_physical_device_surface_formats2_khr = vkGetPhysicalDeviceSurfaceFormats2KHR(physical_device : PhysicalDevice, p_surface_info : PhysicalDeviceSurfaceInfo2Khr*, p_surface_format_count : Uint32T*, p_surface_formats : SurfaceFormat2Khr*) : Result
  struct DisplayProperties2Khr
    s_type : StructureType
    p_next : Void*
    display_properties : DisplayPropertiesKhr
  end
  struct DisplayPlaneProperties2Khr
    s_type : StructureType
    p_next : Void*
    display_plane_properties : DisplayPlanePropertiesKhr
  end
  struct DisplayModeProperties2Khr
    s_type : StructureType
    p_next : Void*
    display_mode_properties : DisplayModePropertiesKhr
  end
  struct DisplayPlaneInfo2Khr
    s_type : StructureType
    p_next : Void*
    mode : DisplayModeKhr
    plane_index : Uint32T
  end
  struct DisplayPlaneCapabilities2Khr
    s_type : StructureType
    p_next : Void*
    capabilities : DisplayPlaneCapabilitiesKhr
  end
  fun get_physical_device_display_properties2_khr = vkGetPhysicalDeviceDisplayProperties2KHR(physical_device : PhysicalDevice, p_property_count : Uint32T*, p_properties : DisplayProperties2Khr*) : Result
  fun get_physical_device_display_plane_properties2_khr = vkGetPhysicalDeviceDisplayPlaneProperties2KHR(physical_device : PhysicalDevice, p_property_count : Uint32T*, p_properties : DisplayPlaneProperties2Khr*) : Result
  fun get_display_mode_properties2_khr = vkGetDisplayModeProperties2KHR(physical_device : PhysicalDevice, display : DisplayKhr, p_property_count : Uint32T*, p_properties : DisplayModeProperties2Khr*) : Result
  fun get_display_plane_capabilities2_khr = vkGetDisplayPlaneCapabilities2KHR(physical_device : PhysicalDevice, p_display_plane_info : DisplayPlaneInfo2Khr*, p_capabilities : DisplayPlaneCapabilities2Khr*) : Result
  fun get_image_memory_requirements2_khr = vkGetImageMemoryRequirements2KHR(device : Device, p_info : ImageMemoryRequirementsInfo2*, p_memory_requirements : MemoryRequirements2*)
  fun get_buffer_memory_requirements2_khr = vkGetBufferMemoryRequirements2KHR(device : Device, p_info : BufferMemoryRequirementsInfo2*, p_memory_requirements : MemoryRequirements2*)
  fun get_image_sparse_memory_requirements2_khr = vkGetImageSparseMemoryRequirements2KHR(device : Device, p_info : ImageSparseMemoryRequirementsInfo2*, p_sparse_memory_requirement_count : Uint32T*, p_sparse_memory_requirements : SparseImageMemoryRequirements2*)
  struct ImageFormatListCreateInfoKhr
    s_type : StructureType
    p_next : Void*
    view_format_count : Uint32T
    p_view_formats : Format*
  end
  fun create_sampler_ycbcr_conversion_khr = vkCreateSamplerYcbcrConversionKHR(device : Device, p_create_info : SamplerYcbcrConversionCreateInfo*, p_allocator : AllocationCallbacks*, p_ycbcr_conversion : SamplerYcbcrConversion*) : Result
  fun destroy_sampler_ycbcr_conversion_khr = vkDestroySamplerYcbcrConversionKHR(device : Device, ycbcr_conversion : SamplerYcbcrConversion, p_allocator : AllocationCallbacks*)
  fun bind_buffer_memory2_khr = vkBindBufferMemory2KHR(device : Device, bind_info_count : Uint32T, p_bind_infos : BindBufferMemoryInfo*) : Result
  fun bind_image_memory2_khr = vkBindImageMemory2KHR(device : Device, bind_info_count : Uint32T, p_bind_infos : BindImageMemoryInfo*) : Result
  fun get_descriptor_set_layout_support_khr = vkGetDescriptorSetLayoutSupportKHR(device : Device, p_create_info : DescriptorSetLayoutCreateInfo*, p_support : DescriptorSetLayoutSupport*)
  fun cmd_draw_indirect_count_khr = vkCmdDrawIndirectCountKHR(command_buffer : CommandBuffer, buffer : Buffer, offset : DeviceSize, count_buffer : Buffer, count_buffer_offset : DeviceSize, max_draw_count : Uint32T, stride : Uint32T)
  fun cmd_draw_indexed_indirect_count_khr = vkCmdDrawIndexedIndirectCountKHR(command_buffer : CommandBuffer, buffer : Buffer, offset : DeviceSize, count_buffer : Buffer, count_buffer_offset : DeviceSize, max_draw_count : Uint32T, stride : Uint32T)
  struct PhysicalDevice8BitStorageFeaturesKhr
    s_type : StructureType
    p_next : Void*
    storage_buffer8_bit_access : Bool32
    uniform_and_storage_buffer8_bit_access : Bool32
    storage_push_constant8 : Bool32
  end
  alias DebugReportCallbackExtT = Void
  struct DebugReportCallbackCreateInfoExt
    s_type : StructureType
    p_next : Void*
    flags : DebugReportFlagsExt
    pfn_callback : PfnVkDebugReportCallbackExt
    p_user_data : Void*
  end
  alias DebugReportFlagsExt = Flags
  enum DebugReportObjectTypeExt
    VkDebugReportObjectTypeUnknownExt = 0
    VkDebugReportObjectTypeInstanceExt = 1
    VkDebugReportObjectTypePhysicalDeviceExt = 2
    VkDebugReportObjectTypeDeviceExt = 3
    VkDebugReportObjectTypeQueueExt = 4
    VkDebugReportObjectTypeSemaphoreExt = 5
    VkDebugReportObjectTypeCommandBufferExt = 6
    VkDebugReportObjectTypeFenceExt = 7
    VkDebugReportObjectTypeDeviceMemoryExt = 8
    VkDebugReportObjectTypeBufferExt = 9
    VkDebugReportObjectTypeImageExt = 10
    VkDebugReportObjectTypeEventExt = 11
    VkDebugReportObjectTypeQueryPoolExt = 12
    VkDebugReportObjectTypeBufferViewExt = 13
    VkDebugReportObjectTypeImageViewExt = 14
    VkDebugReportObjectTypeShaderModuleExt = 15
    VkDebugReportObjectTypePipelineCacheExt = 16
    VkDebugReportObjectTypePipelineLayoutExt = 17
    VkDebugReportObjectTypeRenderPassExt = 18
    VkDebugReportObjectTypePipelineExt = 19
    VkDebugReportObjectTypeDescriptorSetLayoutExt = 20
    VkDebugReportObjectTypeSamplerExt = 21
    VkDebugReportObjectTypeDescriptorPoolExt = 22
    VkDebugReportObjectTypeDescriptorSetExt = 23
    VkDebugReportObjectTypeFramebufferExt = 24
    VkDebugReportObjectTypeCommandPoolExt = 25
    VkDebugReportObjectTypeSurfaceKhrExt = 26
    VkDebugReportObjectTypeSwapchainKhrExt = 27
    VkDebugReportObjectTypeDebugReportCallbackExtExt = 28
    VkDebugReportObjectTypeDisplayKhrExt = 29
    VkDebugReportObjectTypeDisplayModeKhrExt = 30
    VkDebugReportObjectTypeObjectTableNvxExt = 31
    VkDebugReportObjectTypeIndirectCommandsLayoutNvxExt = 32
    VkDebugReportObjectTypeValidationCacheExtExt = 33
    VkDebugReportObjectTypeSamplerYcbcrConversionExt = 1000156000
    VkDebugReportObjectTypeDescriptorUpdateTemplateExt = 1000085000
    VkDebugReportObjectTypeDescriptorUpdateTemplateKhrExt = 1000085000
    VkDebugReportObjectTypeSamplerYcbcrConversionKhrExt = 1000156000
    VkDebugReportObjectTypeBeginRangeExt = 0
    VkDebugReportObjectTypeEndRangeExt = 33
    VkDebugReportObjectTypeRangeSizeExt = 34
    VkDebugReportObjectTypeMaxEnumExt = 2147483647
  end
  alias PfnVkDebugReportCallbackExt = (DebugReportFlagsExt, DebugReportObjectTypeExt, Uint64T, LibC::SizeT, Int32T, LibC::Char*, LibC::Char*, Void* -> Bool32)
  fun create_debug_report_callback_ext = vkCreateDebugReportCallbackEXT(instance : Instance, p_create_info : DebugReportCallbackCreateInfoExt*, p_allocator : AllocationCallbacks*, p_callback : DebugReportCallbackExt*) : Result
  type DebugReportCallbackExt = Void*
  fun destroy_debug_report_callback_ext = vkDestroyDebugReportCallbackEXT(instance : Instance, callback : DebugReportCallbackExt, p_allocator : AllocationCallbacks*)
  fun debug_report_message_ext = vkDebugReportMessageEXT(instance : Instance, flags : DebugReportFlagsExt, object_type : DebugReportObjectTypeExt, object : Uint64T, location : LibC::SizeT, message_code : Int32T, p_layer_prefix : LibC::Char*, p_message : LibC::Char*)
  struct PipelineRasterizationStateRasterizationOrderAmd
    s_type : StructureType
    p_next : Void*
    rasterization_order : RasterizationOrderAmd
  end
  enum RasterizationOrderAmd
    VkRasterizationOrderStrictAmd = 0
    VkRasterizationOrderRelaxedAmd = 1
    VkRasterizationOrderBeginRangeAmd = 0
    VkRasterizationOrderEndRangeAmd = 1
    VkRasterizationOrderRangeSizeAmd = 2
    VkRasterizationOrderMaxEnumAmd = 2147483647
  end
  struct DebugMarkerObjectNameInfoExt
    s_type : StructureType
    p_next : Void*
    object_type : DebugReportObjectTypeExt
    object : Uint64T
    p_object_name : LibC::Char*
  end
  struct DebugMarkerObjectTagInfoExt
    s_type : StructureType
    p_next : Void*
    object_type : DebugReportObjectTypeExt
    object : Uint64T
    tag_name : Uint64T
    tag_size : LibC::SizeT
    p_tag : Void*
  end
  struct DebugMarkerMarkerInfoExt
    s_type : StructureType
    p_next : Void*
    p_marker_name : LibC::Char*
    color : LibC::Float[4]
  end
  fun debug_marker_set_object_tag_ext = vkDebugMarkerSetObjectTagEXT(device : Device, p_tag_info : DebugMarkerObjectTagInfoExt*) : Result
  fun debug_marker_set_object_name_ext = vkDebugMarkerSetObjectNameEXT(device : Device, p_name_info : DebugMarkerObjectNameInfoExt*) : Result
  fun cmd_debug_marker_begin_ext = vkCmdDebugMarkerBeginEXT(command_buffer : CommandBuffer, p_marker_info : DebugMarkerMarkerInfoExt*)
  fun cmd_debug_marker_end_ext = vkCmdDebugMarkerEndEXT(command_buffer : CommandBuffer)
  fun cmd_debug_marker_insert_ext = vkCmdDebugMarkerInsertEXT(command_buffer : CommandBuffer, p_marker_info : DebugMarkerMarkerInfoExt*)
  struct DedicatedAllocationImageCreateInfoNv
    s_type : StructureType
    p_next : Void*
    dedicated_allocation : Bool32
  end
  struct DedicatedAllocationBufferCreateInfoNv
    s_type : StructureType
    p_next : Void*
    dedicated_allocation : Bool32
  end
  struct DedicatedAllocationMemoryAllocateInfoNv
    s_type : StructureType
    p_next : Void*
    image : Image
    buffer : Buffer
  end
  fun cmd_draw_indirect_count_amd = vkCmdDrawIndirectCountAMD(command_buffer : CommandBuffer, buffer : Buffer, offset : DeviceSize, count_buffer : Buffer, count_buffer_offset : DeviceSize, max_draw_count : Uint32T, stride : Uint32T)
  fun cmd_draw_indexed_indirect_count_amd = vkCmdDrawIndexedIndirectCountAMD(command_buffer : CommandBuffer, buffer : Buffer, offset : DeviceSize, count_buffer : Buffer, count_buffer_offset : DeviceSize, max_draw_count : Uint32T, stride : Uint32T)
  struct TextureLodGatherFormatPropertiesAmd
    s_type : StructureType
    p_next : Void*
    supports_texture_gather_lod_bias_amd : Bool32
  end
  struct ShaderResourceUsageAmd
    num_used_vgprs : Uint32T
    num_used_sgprs : Uint32T
    lds_size_per_local_work_group : Uint32T
    lds_usage_size_in_bytes : LibC::SizeT
    scratch_mem_usage_in_bytes : LibC::SizeT
  end
  struct ShaderStatisticsInfoAmd
    shader_stage_mask : ShaderStageFlags
    resource_usage : ShaderResourceUsageAmd
    num_physical_vgprs : Uint32T
    num_physical_sgprs : Uint32T
    num_available_vgprs : Uint32T
    num_available_sgprs : Uint32T
    compute_work_group_size : Uint32T[3]
  end
  fun get_shader_info_amd = vkGetShaderInfoAMD(device : Device, pipeline : Pipeline, shader_stage : ShaderStageFlagBits, info_type : ShaderInfoTypeAmd, p_info_size : LibC::SizeT*, p_info : Void*) : Result
  enum ShaderInfoTypeAmd
    VkShaderInfoTypeStatisticsAmd = 0
    VkShaderInfoTypeBinaryAmd = 1
    VkShaderInfoTypeDisassemblyAmd = 2
    VkShaderInfoTypeBeginRangeAmd = 0
    VkShaderInfoTypeEndRangeAmd = 2
    VkShaderInfoTypeRangeSizeAmd = 3
    VkShaderInfoTypeMaxEnumAmd = 2147483647
  end
  struct ExternalImageFormatPropertiesNv
    image_format_properties : ImageFormatProperties
    external_memory_features : ExternalMemoryFeatureFlagsNv
    export_from_imported_handle_types : ExternalMemoryHandleTypeFlagsNv
    compatible_handle_types : ExternalMemoryHandleTypeFlagsNv
  end
  alias ExternalMemoryFeatureFlagsNv = Flags
  alias ExternalMemoryHandleTypeFlagsNv = Flags
  fun get_physical_device_external_image_format_properties_nv = vkGetPhysicalDeviceExternalImageFormatPropertiesNV(physical_device : PhysicalDevice, format : Format, type : ImageType, tiling : ImageTiling, usage : ImageUsageFlags, flags : ImageCreateFlags, external_handle_type : ExternalMemoryHandleTypeFlagsNv, p_external_image_format_properties : ExternalImageFormatPropertiesNv*) : Result
  struct ExternalMemoryImageCreateInfoNv
    s_type : StructureType
    p_next : Void*
    handle_types : ExternalMemoryHandleTypeFlagsNv
  end
  struct ExportMemoryAllocateInfoNv
    s_type : StructureType
    p_next : Void*
    handle_types : ExternalMemoryHandleTypeFlagsNv
  end
  struct ValidationFlagsExt
    s_type : StructureType
    p_next : Void*
    disabled_validation_check_count : Uint32T
    p_disabled_validation_checks : ValidationCheckExt*
  end
  enum ValidationCheckExt
    VkValidationCheckAllExt = 0
    VkValidationCheckShadersExt = 1
    VkValidationCheckBeginRangeExt = 0
    VkValidationCheckEndRangeExt = 1
    VkValidationCheckRangeSizeExt = 2
    VkValidationCheckMaxEnumExt = 2147483647
  end
  struct ConditionalRenderingBeginInfoExt
    s_type : StructureType
    p_next : Void*
    buffer : Buffer
    offset : DeviceSize
    flags : ConditionalRenderingFlagsExt
  end
  alias ConditionalRenderingFlagsExt = Flags
  struct PhysicalDeviceConditionalRenderingFeaturesExt
    s_type : StructureType
    p_next : Void*
    conditional_rendering : Bool32
    inherited_conditional_rendering : Bool32
  end
  struct CommandBufferInheritanceConditionalRenderingInfoExt
    s_type : StructureType
    p_next : Void*
    conditional_rendering_enable : Bool32
  end
  fun cmd_begin_conditional_rendering_ext = vkCmdBeginConditionalRenderingEXT(command_buffer : CommandBuffer, p_conditional_rendering_begin : ConditionalRenderingBeginInfoExt*)
  fun cmd_end_conditional_rendering_ext = vkCmdEndConditionalRenderingEXT(command_buffer : CommandBuffer)
  alias ObjectTableNvxT = Void
  alias IndirectCommandsLayoutNvxT = Void
  struct DeviceGeneratedCommandsFeaturesNvx
    s_type : StructureType
    p_next : Void*
    compute_binding_point_support : Bool32
  end
  struct DeviceGeneratedCommandsLimitsNvx
    s_type : StructureType
    p_next : Void*
    max_indirect_commands_layout_token_count : Uint32T
    max_object_entry_counts : Uint32T
    min_sequence_count_buffer_offset_alignment : Uint32T
    min_sequence_index_buffer_offset_alignment : Uint32T
    min_commands_token_buffer_offset_alignment : Uint32T
  end
  struct IndirectCommandsTokenNvx
    token_type : IndirectCommandsTokenTypeNvx
    buffer : Buffer
    offset : DeviceSize
  end
  enum IndirectCommandsTokenTypeNvx
    VkIndirectCommandsTokenTypePipelineNvx = 0
    VkIndirectCommandsTokenTypeDescriptorSetNvx = 1
    VkIndirectCommandsTokenTypeIndexBufferNvx = 2
    VkIndirectCommandsTokenTypeVertexBufferNvx = 3
    VkIndirectCommandsTokenTypePushConstantNvx = 4
    VkIndirectCommandsTokenTypeDrawIndexedNvx = 5
    VkIndirectCommandsTokenTypeDrawNvx = 6
    VkIndirectCommandsTokenTypeDispatchNvx = 7
    VkIndirectCommandsTokenTypeBeginRangeNvx = 0
    VkIndirectCommandsTokenTypeEndRangeNvx = 7
    VkIndirectCommandsTokenTypeRangeSizeNvx = 8
    VkIndirectCommandsTokenTypeMaxEnumNvx = 2147483647
  end
  struct IndirectCommandsLayoutTokenNvx
    token_type : IndirectCommandsTokenTypeNvx
    binding_unit : Uint32T
    dynamic_count : Uint32T
    divisor : Uint32T
  end
  struct IndirectCommandsLayoutCreateInfoNvx
    s_type : StructureType
    p_next : Void*
    pipeline_bind_point : PipelineBindPoint
    flags : IndirectCommandsLayoutUsageFlagsNvx
    token_count : Uint32T
    p_tokens : IndirectCommandsLayoutTokenNvx*
  end
  alias IndirectCommandsLayoutUsageFlagsNvx = Flags
  struct CmdProcessCommandsInfoNvx
    s_type : StructureType
    p_next : Void*
    object_table : ObjectTableNvx
    indirect_commands_layout : IndirectCommandsLayoutNvx
    indirect_commands_token_count : Uint32T
    p_indirect_commands_tokens : IndirectCommandsTokenNvx*
    max_sequences_count : Uint32T
    target_command_buffer : CommandBuffer
    sequences_count_buffer : Buffer
    sequences_count_offset : DeviceSize
    sequences_index_buffer : Buffer
    sequences_index_offset : DeviceSize
  end
  type ObjectTableNvx = Void*
  type IndirectCommandsLayoutNvx = Void*
  struct CmdReserveSpaceForCommandsInfoNvx
    s_type : StructureType
    p_next : Void*
    object_table : ObjectTableNvx
    indirect_commands_layout : IndirectCommandsLayoutNvx
    max_sequences_count : Uint32T
  end
  struct ObjectTableCreateInfoNvx
    s_type : StructureType
    p_next : Void*
    object_count : Uint32T
    p_object_entry_types : ObjectEntryTypeNvx*
    p_object_entry_counts : Uint32T*
    p_object_entry_usage_flags : ObjectEntryUsageFlagsNvx*
    max_uniform_buffers_per_descriptor : Uint32T
    max_storage_buffers_per_descriptor : Uint32T
    max_storage_images_per_descriptor : Uint32T
    max_sampled_images_per_descriptor : Uint32T
    max_pipeline_layouts : Uint32T
  end
  enum ObjectEntryTypeNvx
    VkObjectEntryTypeDescriptorSetNvx = 0
    VkObjectEntryTypePipelineNvx = 1
    VkObjectEntryTypeIndexBufferNvx = 2
    VkObjectEntryTypeVertexBufferNvx = 3
    VkObjectEntryTypePushConstantNvx = 4
    VkObjectEntryTypeBeginRangeNvx = 0
    VkObjectEntryTypeEndRangeNvx = 4
    VkObjectEntryTypeRangeSizeNvx = 5
    VkObjectEntryTypeMaxEnumNvx = 2147483647
  end
  alias ObjectEntryUsageFlagsNvx = Flags
  struct ObjectTableEntryNvx
    type : ObjectEntryTypeNvx
    flags : ObjectEntryUsageFlagsNvx
  end
  struct ObjectTablePipelineEntryNvx
    type : ObjectEntryTypeNvx
    flags : ObjectEntryUsageFlagsNvx
    pipeline : Pipeline
  end
  struct ObjectTableDescriptorSetEntryNvx
    type : ObjectEntryTypeNvx
    flags : ObjectEntryUsageFlagsNvx
    pipeline_layout : PipelineLayout
    descriptor_set : DescriptorSet
  end
  struct ObjectTableVertexBufferEntryNvx
    type : ObjectEntryTypeNvx
    flags : ObjectEntryUsageFlagsNvx
    buffer : Buffer
  end
  struct ObjectTableIndexBufferEntryNvx
    type : ObjectEntryTypeNvx
    flags : ObjectEntryUsageFlagsNvx
    buffer : Buffer
    index_type : IndexType
  end
  struct ObjectTablePushConstantEntryNvx
    type : ObjectEntryTypeNvx
    flags : ObjectEntryUsageFlagsNvx
    pipeline_layout : PipelineLayout
    stage_flags : ShaderStageFlags
  end
  fun cmd_process_commands_nvx = vkCmdProcessCommandsNVX(command_buffer : CommandBuffer, p_process_commands_info : CmdProcessCommandsInfoNvx*)
  fun cmd_reserve_space_for_commands_nvx = vkCmdReserveSpaceForCommandsNVX(command_buffer : CommandBuffer, p_reserve_space_info : CmdReserveSpaceForCommandsInfoNvx*)
  fun create_indirect_commands_layout_nvx = vkCreateIndirectCommandsLayoutNVX(device : Device, p_create_info : IndirectCommandsLayoutCreateInfoNvx*, p_allocator : AllocationCallbacks*, p_indirect_commands_layout : IndirectCommandsLayoutNvx*) : Result
  fun destroy_indirect_commands_layout_nvx = vkDestroyIndirectCommandsLayoutNVX(device : Device, indirect_commands_layout : IndirectCommandsLayoutNvx, p_allocator : AllocationCallbacks*)
  fun create_object_table_nvx = vkCreateObjectTableNVX(device : Device, p_create_info : ObjectTableCreateInfoNvx*, p_allocator : AllocationCallbacks*, p_object_table : ObjectTableNvx*) : Result
  fun destroy_object_table_nvx = vkDestroyObjectTableNVX(device : Device, object_table : ObjectTableNvx, p_allocator : AllocationCallbacks*)
  fun register_objects_nvx = vkRegisterObjectsNVX(device : Device, object_table : ObjectTableNvx, object_count : Uint32T, pp_object_table_entries : ObjectTableEntryNvx**, p_object_indices : Uint32T*) : Result
  fun unregister_objects_nvx = vkUnregisterObjectsNVX(device : Device, object_table : ObjectTableNvx, object_count : Uint32T, p_object_entry_types : ObjectEntryTypeNvx*, p_object_indices : Uint32T*) : Result
  fun get_physical_device_generated_commands_properties_nvx = vkGetPhysicalDeviceGeneratedCommandsPropertiesNVX(physical_device : PhysicalDevice, p_features : DeviceGeneratedCommandsFeaturesNvx*, p_limits : DeviceGeneratedCommandsLimitsNvx*)
  struct ViewportWScalingNv
    xcoeff : LibC::Float
    ycoeff : LibC::Float
  end
  struct PipelineViewportWScalingStateCreateInfoNv
    s_type : StructureType
    p_next : Void*
    viewport_w_scaling_enable : Bool32
    viewport_count : Uint32T
    p_viewport_w_scalings : ViewportWScalingNv*
  end
  fun cmd_set_viewport_w_scaling_nv = vkCmdSetViewportWScalingNV(command_buffer : CommandBuffer, first_viewport : Uint32T, viewport_count : Uint32T, p_viewport_w_scalings : ViewportWScalingNv*)
  fun release_display_ext = vkReleaseDisplayEXT(physical_device : PhysicalDevice, display : DisplayKhr) : Result
  struct SurfaceCapabilities2Ext
    s_type : StructureType
    p_next : Void*
    min_image_count : Uint32T
    max_image_count : Uint32T
    current_extent : Extent2D
    min_image_extent : Extent2D
    max_image_extent : Extent2D
    max_image_array_layers : Uint32T
    supported_transforms : SurfaceTransformFlagsKhr
    current_transform : SurfaceTransformFlagBitsKhr
    supported_composite_alpha : CompositeAlphaFlagsKhr
    supported_usage_flags : ImageUsageFlags
    supported_surface_counters : SurfaceCounterFlagsExt
  end
  alias SurfaceCounterFlagsExt = Flags
  fun get_physical_device_surface_capabilities2_ext = vkGetPhysicalDeviceSurfaceCapabilities2EXT(physical_device : PhysicalDevice, surface : SurfaceKhr, p_surface_capabilities : SurfaceCapabilities2Ext*) : Result
  struct DisplayPowerInfoExt
    s_type : StructureType
    p_next : Void*
    power_state : DisplayPowerStateExt
  end
  enum DisplayPowerStateExt
    VkDisplayPowerStateOffExt = 0
    VkDisplayPowerStateSuspendExt = 1
    VkDisplayPowerStateOnExt = 2
    VkDisplayPowerStateBeginRangeExt = 0
    VkDisplayPowerStateEndRangeExt = 2
    VkDisplayPowerStateRangeSizeExt = 3
    VkDisplayPowerStateMaxEnumExt = 2147483647
  end
  struct DeviceEventInfoExt
    s_type : StructureType
    p_next : Void*
    device_event : DeviceEventTypeExt
  end
  enum DeviceEventTypeExt
    VkDeviceEventTypeDisplayHotplugExt = 0
    VkDeviceEventTypeBeginRangeExt = 0
    VkDeviceEventTypeEndRangeExt = 0
    VkDeviceEventTypeRangeSizeExt = 1
    VkDeviceEventTypeMaxEnumExt = 2147483647
  end
  struct DisplayEventInfoExt
    s_type : StructureType
    p_next : Void*
    display_event : DisplayEventTypeExt
  end
  enum DisplayEventTypeExt
    VkDisplayEventTypeFirstPixelOutExt = 0
    VkDisplayEventTypeBeginRangeExt = 0
    VkDisplayEventTypeEndRangeExt = 0
    VkDisplayEventTypeRangeSizeExt = 1
    VkDisplayEventTypeMaxEnumExt = 2147483647
  end
  struct SwapchainCounterCreateInfoExt
    s_type : StructureType
    p_next : Void*
    surface_counters : SurfaceCounterFlagsExt
  end
  fun display_power_control_ext = vkDisplayPowerControlEXT(device : Device, display : DisplayKhr, p_display_power_info : DisplayPowerInfoExt*) : Result
  fun register_device_event_ext = vkRegisterDeviceEventEXT(device : Device, p_device_event_info : DeviceEventInfoExt*, p_allocator : AllocationCallbacks*, p_fence : Fence*) : Result
  fun register_display_event_ext = vkRegisterDisplayEventEXT(device : Device, display : DisplayKhr, p_display_event_info : DisplayEventInfoExt*, p_allocator : AllocationCallbacks*, p_fence : Fence*) : Result
  fun get_swapchain_counter_ext = vkGetSwapchainCounterEXT(device : Device, swapchain : SwapchainKhr, counter : SurfaceCounterFlagBitsExt, p_counter_value : Uint64T*) : Result
  enum SurfaceCounterFlagBitsExt
    VkSurfaceCounterVblankExt = 1
    VkSurfaceCounterFlagBitsMaxEnumExt = 2147483647
  end
  struct RefreshCycleDurationGoogle
    refresh_duration : Uint64T
  end
  struct PastPresentationTimingGoogle
    present_id : Uint32T
    desired_present_time : Uint64T
    actual_present_time : Uint64T
    earliest_present_time : Uint64T
    present_margin : Uint64T
  end
  struct PresentTimeGoogle
    present_id : Uint32T
    desired_present_time : Uint64T
  end
  struct PresentTimesInfoGoogle
    s_type : StructureType
    p_next : Void*
    swapchain_count : Uint32T
    p_times : PresentTimeGoogle*
  end
  fun get_refresh_cycle_duration_google = vkGetRefreshCycleDurationGOOGLE(device : Device, swapchain : SwapchainKhr, p_display_timing_properties : RefreshCycleDurationGoogle*) : Result
  fun get_past_presentation_timing_google = vkGetPastPresentationTimingGOOGLE(device : Device, swapchain : SwapchainKhr, p_presentation_timing_count : Uint32T*, p_presentation_timings : PastPresentationTimingGoogle*) : Result
  struct PhysicalDeviceMultiviewPerViewAttributesPropertiesNvx
    s_type : StructureType
    p_next : Void*
    per_view_position_all_components : Bool32
  end
  struct ViewportSwizzleNv
    x : ViewportCoordinateSwizzleNv
    y : ViewportCoordinateSwizzleNv
    z : ViewportCoordinateSwizzleNv
    w : ViewportCoordinateSwizzleNv
  end
  enum ViewportCoordinateSwizzleNv
    VkViewportCoordinateSwizzlePositiveXNv = 0
    VkViewportCoordinateSwizzleNegativeXNv = 1
    VkViewportCoordinateSwizzlePositiveYNv = 2
    VkViewportCoordinateSwizzleNegativeYNv = 3
    VkViewportCoordinateSwizzlePositiveZNv = 4
    VkViewportCoordinateSwizzleNegativeZNv = 5
    VkViewportCoordinateSwizzlePositiveWNv = 6
    VkViewportCoordinateSwizzleNegativeWNv = 7
    VkViewportCoordinateSwizzleBeginRangeNv = 0
    VkViewportCoordinateSwizzleEndRangeNv = 7
    VkViewportCoordinateSwizzleRangeSizeNv = 8
    VkViewportCoordinateSwizzleMaxEnumNv = 2147483647
  end
  struct PipelineViewportSwizzleStateCreateInfoNv
    s_type : StructureType
    p_next : Void*
    flags : PipelineViewportSwizzleStateCreateFlagsNv
    viewport_count : Uint32T
    p_viewport_swizzles : ViewportSwizzleNv*
  end
  alias PipelineViewportSwizzleStateCreateFlagsNv = Flags
  struct PhysicalDeviceDiscardRectanglePropertiesExt
    s_type : StructureType
    p_next : Void*
    max_discard_rectangles : Uint32T
  end
  struct PipelineDiscardRectangleStateCreateInfoExt
    s_type : StructureType
    p_next : Void*
    flags : PipelineDiscardRectangleStateCreateFlagsExt
    discard_rectangle_mode : DiscardRectangleModeExt
    discard_rectangle_count : Uint32T
    p_discard_rectangles : Rect2D*
  end
  alias PipelineDiscardRectangleStateCreateFlagsExt = Flags
  enum DiscardRectangleModeExt
    VkDiscardRectangleModeInclusiveExt = 0
    VkDiscardRectangleModeExclusiveExt = 1
    VkDiscardRectangleModeBeginRangeExt = 0
    VkDiscardRectangleModeEndRangeExt = 1
    VkDiscardRectangleModeRangeSizeExt = 2
    VkDiscardRectangleModeMaxEnumExt = 2147483647
  end
  fun cmd_set_discard_rectangle_ext = vkCmdSetDiscardRectangleEXT(command_buffer : CommandBuffer, first_discard_rectangle : Uint32T, discard_rectangle_count : Uint32T, p_discard_rectangles : Rect2D*)
  struct PhysicalDeviceConservativeRasterizationPropertiesExt
    s_type : StructureType
    p_next : Void*
    primitive_overestimation_size : LibC::Float
    max_extra_primitive_overestimation_size : LibC::Float
    extra_primitive_overestimation_size_granularity : LibC::Float
    primitive_underestimation : Bool32
    conservative_point_and_line_rasterization : Bool32
    degenerate_triangles_rasterized : Bool32
    degenerate_lines_rasterized : Bool32
    fully_covered_fragment_shader_input_variable : Bool32
    conservative_rasterization_post_depth_coverage : Bool32
  end
  struct PipelineRasterizationConservativeStateCreateInfoExt
    s_type : StructureType
    p_next : Void*
    flags : PipelineRasterizationConservativeStateCreateFlagsExt
    conservative_rasterization_mode : ConservativeRasterizationModeExt
    extra_primitive_overestimation_size : LibC::Float
  end
  alias PipelineRasterizationConservativeStateCreateFlagsExt = Flags
  enum ConservativeRasterizationModeExt
    VkConservativeRasterizationModeDisabledExt = 0
    VkConservativeRasterizationModeOverestimateExt = 1
    VkConservativeRasterizationModeUnderestimateExt = 2
    VkConservativeRasterizationModeBeginRangeExt = 0
    VkConservativeRasterizationModeEndRangeExt = 2
    VkConservativeRasterizationModeRangeSizeExt = 3
    VkConservativeRasterizationModeMaxEnumExt = 2147483647
  end
  struct XyColorExt
    x : LibC::Float
    y : LibC::Float
  end
  struct HdrMetadataExt
    s_type : StructureType
    p_next : Void*
    display_primary_red : XyColorExt
    display_primary_green : XyColorExt
    display_primary_blue : XyColorExt
    white_point : XyColorExt
    max_luminance : LibC::Float
    min_luminance : LibC::Float
    max_content_light_level : LibC::Float
    max_frame_average_light_level : LibC::Float
  end
  fun set_hdr_metadata_ext = vkSetHdrMetadataEXT(device : Device, swapchain_count : Uint32T, p_swapchains : SwapchainKhr*, p_metadata : HdrMetadataExt*)
  alias DebugUtilsMessengerExtT = Void
  struct DebugUtilsObjectNameInfoExt
    s_type : StructureType
    p_next : Void*
    object_type : ObjectType
    object_handle : Uint64T
    p_object_name : LibC::Char*
  end
  enum ObjectType
    VkObjectTypeUnknown = 0
    VkObjectTypeInstance = 1
    VkObjectTypePhysicalDevice = 2
    VkObjectTypeDevice = 3
    VkObjectTypeQueue = 4
    VkObjectTypeSemaphore = 5
    VkObjectTypeCommandBuffer = 6
    VkObjectTypeFence = 7
    VkObjectTypeDeviceMemory = 8
    VkObjectTypeBuffer = 9
    VkObjectTypeImage = 10
    VkObjectTypeEvent = 11
    VkObjectTypeQueryPool = 12
    VkObjectTypeBufferView = 13
    VkObjectTypeImageView = 14
    VkObjectTypeShaderModule = 15
    VkObjectTypePipelineCache = 16
    VkObjectTypePipelineLayout = 17
    VkObjectTypeRenderPass = 18
    VkObjectTypePipeline = 19
    VkObjectTypeDescriptorSetLayout = 20
    VkObjectTypeSampler = 21
    VkObjectTypeDescriptorPool = 22
    VkObjectTypeDescriptorSet = 23
    VkObjectTypeFramebuffer = 24
    VkObjectTypeCommandPool = 25
    VkObjectTypeSamplerYcbcrConversion = 1000156000
    VkObjectTypeDescriptorUpdateTemplate = 1000085000
    VkObjectTypeSurfaceKhr = 1000000000
    VkObjectTypeSwapchainKhr = 1000001000
    VkObjectTypeDisplayKhr = 1000002000
    VkObjectTypeDisplayModeKhr = 1000002001
    VkObjectTypeDebugReportCallbackExt = 1000011000
    VkObjectTypeObjectTableNvx = 1000086000
    VkObjectTypeIndirectCommandsLayoutNvx = 1000086001
    VkObjectTypeDebugUtilsMessengerExt = 1000128000
    VkObjectTypeValidationCacheExt = 1000160000
    VkObjectTypeDescriptorUpdateTemplateKhr = 1000085000
    VkObjectTypeSamplerYcbcrConversionKhr = 1000156000
    VkObjectTypeBeginRange = 0
    VkObjectTypeEndRange = 25
    VkObjectTypeRangeSize = 26
    VkObjectTypeMaxEnum = 2147483647
  end
  struct DebugUtilsObjectTagInfoExt
    s_type : StructureType
    p_next : Void*
    object_type : ObjectType
    object_handle : Uint64T
    tag_name : Uint64T
    tag_size : LibC::SizeT
    p_tag : Void*
  end
  struct DebugUtilsLabelExt
    s_type : StructureType
    p_next : Void*
    p_label_name : LibC::Char*
    color : LibC::Float[4]
  end
  struct DebugUtilsMessengerCallbackDataExt
    s_type : StructureType
    p_next : Void*
    flags : DebugUtilsMessengerCallbackDataFlagsExt
    p_message_id_name : LibC::Char*
    message_id_number : Int32T
    p_message : LibC::Char*
    queue_label_count : Uint32T
    p_queue_labels : DebugUtilsLabelExt*
    cmd_buf_label_count : Uint32T
    p_cmd_buf_labels : DebugUtilsLabelExt*
    object_count : Uint32T
    p_objects : DebugUtilsObjectNameInfoExt*
  end
  alias DebugUtilsMessengerCallbackDataFlagsExt = Flags
  struct DebugUtilsMessengerCreateInfoExt
    s_type : StructureType
    p_next : Void*
    flags : DebugUtilsMessengerCreateFlagsExt
    message_severity : DebugUtilsMessageSeverityFlagsExt
    message_type : DebugUtilsMessageTypeFlagsExt
    pfn_user_callback : PfnVkDebugUtilsMessengerCallbackExt
    p_user_data : Void*
  end
  alias DebugUtilsMessengerCreateFlagsExt = Flags
  alias DebugUtilsMessageSeverityFlagsExt = Flags
  alias DebugUtilsMessageTypeFlagsExt = Flags
  enum DebugUtilsMessageSeverityFlagBitsExt
    VkDebugUtilsMessageSeverityVerboseBitExt = 1
    VkDebugUtilsMessageSeverityInfoBitExt = 16
    VkDebugUtilsMessageSeverityWarningBitExt = 256
    VkDebugUtilsMessageSeverityErrorBitExt = 4096
    VkDebugUtilsMessageSeverityFlagBitsMaxEnumExt = 2147483647
  end
  alias PfnVkDebugUtilsMessengerCallbackExt = (DebugUtilsMessageSeverityFlagBitsExt, DebugUtilsMessageTypeFlagsExt, DebugUtilsMessengerCallbackDataExt*, Void* -> Bool32)
  fun set_debug_utils_object_name_ext = vkSetDebugUtilsObjectNameEXT(device : Device, p_name_info : DebugUtilsObjectNameInfoExt*) : Result
  fun set_debug_utils_object_tag_ext = vkSetDebugUtilsObjectTagEXT(device : Device, p_tag_info : DebugUtilsObjectTagInfoExt*) : Result
  fun queue_begin_debug_utils_label_ext = vkQueueBeginDebugUtilsLabelEXT(queue : Queue, p_label_info : DebugUtilsLabelExt*)
  fun queue_end_debug_utils_label_ext = vkQueueEndDebugUtilsLabelEXT(queue : Queue)
  fun queue_insert_debug_utils_label_ext = vkQueueInsertDebugUtilsLabelEXT(queue : Queue, p_label_info : DebugUtilsLabelExt*)
  fun cmd_begin_debug_utils_label_ext = vkCmdBeginDebugUtilsLabelEXT(command_buffer : CommandBuffer, p_label_info : DebugUtilsLabelExt*)
  fun cmd_end_debug_utils_label_ext = vkCmdEndDebugUtilsLabelEXT(command_buffer : CommandBuffer)
  fun cmd_insert_debug_utils_label_ext = vkCmdInsertDebugUtilsLabelEXT(command_buffer : CommandBuffer, p_label_info : DebugUtilsLabelExt*)
  fun create_debug_utils_messenger_ext = vkCreateDebugUtilsMessengerEXT(instance : Instance, p_create_info : DebugUtilsMessengerCreateInfoExt*, p_allocator : AllocationCallbacks*, p_messenger : DebugUtilsMessengerExt*) : Result
  type DebugUtilsMessengerExt = Void*
  fun destroy_debug_utils_messenger_ext = vkDestroyDebugUtilsMessengerEXT(instance : Instance, messenger : DebugUtilsMessengerExt, p_allocator : AllocationCallbacks*)
  fun submit_debug_utils_message_ext = vkSubmitDebugUtilsMessageEXT(instance : Instance, message_severity : DebugUtilsMessageSeverityFlagBitsExt, message_types : DebugUtilsMessageTypeFlagsExt, p_callback_data : DebugUtilsMessengerCallbackDataExt*)
  struct SamplerReductionModeCreateInfoExt
    s_type : StructureType
    p_next : Void*
    reduction_mode : SamplerReductionModeExt
  end
  enum SamplerReductionModeExt
    VkSamplerReductionModeWeightedAverageExt = 0
    VkSamplerReductionModeMinExt = 1
    VkSamplerReductionModeMaxExt = 2
    VkSamplerReductionModeBeginRangeExt = 0
    VkSamplerReductionModeEndRangeExt = 2
    VkSamplerReductionModeRangeSizeExt = 3
    VkSamplerReductionModeMaxEnumExt = 2147483647
  end
  struct PhysicalDeviceSamplerFilterMinmaxPropertiesExt
    s_type : StructureType
    p_next : Void*
    filter_minmax_single_component_formats : Bool32
    filter_minmax_image_component_mapping : Bool32
  end
  struct SampleLocationExt
    x : LibC::Float
    y : LibC::Float
  end
  struct SampleLocationsInfoExt
    s_type : StructureType
    p_next : Void*
    sample_locations_per_pixel : SampleCountFlagBits
    sample_location_grid_size : Extent2D
    sample_locations_count : Uint32T
    p_sample_locations : SampleLocationExt*
  end
  struct AttachmentSampleLocationsExt
    attachment_index : Uint32T
    sample_locations_info : SampleLocationsInfoExt
  end
  struct SubpassSampleLocationsExt
    subpass_index : Uint32T
    sample_locations_info : SampleLocationsInfoExt
  end
  struct RenderPassSampleLocationsBeginInfoExt
    s_type : StructureType
    p_next : Void*
    attachment_initial_sample_locations_count : Uint32T
    p_attachment_initial_sample_locations : AttachmentSampleLocationsExt*
    post_subpass_sample_locations_count : Uint32T
    p_post_subpass_sample_locations : SubpassSampleLocationsExt*
  end
  struct PipelineSampleLocationsStateCreateInfoExt
    s_type : StructureType
    p_next : Void*
    sample_locations_enable : Bool32
    sample_locations_info : SampleLocationsInfoExt
  end
  struct PhysicalDeviceSampleLocationsPropertiesExt
    s_type : StructureType
    p_next : Void*
    sample_location_sample_counts : SampleCountFlags
    max_sample_location_grid_size : Extent2D
    sample_location_coordinate_range : LibC::Float[2]
    sample_location_sub_pixel_bits : Uint32T
    variable_sample_locations : Bool32
  end
  struct MultisamplePropertiesExt
    s_type : StructureType
    p_next : Void*
    max_sample_location_grid_size : Extent2D
  end
  fun cmd_set_sample_locations_ext = vkCmdSetSampleLocationsEXT(command_buffer : CommandBuffer, p_sample_locations_info : SampleLocationsInfoExt*)
  fun get_physical_device_multisample_properties_ext = vkGetPhysicalDeviceMultisamplePropertiesEXT(physical_device : PhysicalDevice, samples : SampleCountFlagBits, p_multisample_properties : MultisamplePropertiesExt*)
  struct PhysicalDeviceBlendOperationAdvancedFeaturesExt
    s_type : StructureType
    p_next : Void*
    advanced_blend_coherent_operations : Bool32
  end
  struct PhysicalDeviceBlendOperationAdvancedPropertiesExt
    s_type : StructureType
    p_next : Void*
    advanced_blend_max_color_attachments : Uint32T
    advanced_blend_independent_blend : Bool32
    advanced_blend_non_premultiplied_src_color : Bool32
    advanced_blend_non_premultiplied_dst_color : Bool32
    advanced_blend_correlated_overlap : Bool32
    advanced_blend_all_operations : Bool32
  end
  struct PipelineColorBlendAdvancedStateCreateInfoExt
    s_type : StructureType
    p_next : Void*
    src_premultiplied : Bool32
    dst_premultiplied : Bool32
    blend_overlap : BlendOverlapExt
  end
  enum BlendOverlapExt
    VkBlendOverlapUncorrelatedExt = 0
    VkBlendOverlapDisjointExt = 1
    VkBlendOverlapConjointExt = 2
    VkBlendOverlapBeginRangeExt = 0
    VkBlendOverlapEndRangeExt = 2
    VkBlendOverlapRangeSizeExt = 3
    VkBlendOverlapMaxEnumExt = 2147483647
  end
  struct PipelineCoverageToColorStateCreateInfoNv
    s_type : StructureType
    p_next : Void*
    flags : PipelineCoverageToColorStateCreateFlagsNv
    coverage_to_color_enable : Bool32
    coverage_to_color_location : Uint32T
  end
  alias PipelineCoverageToColorStateCreateFlagsNv = Flags
  struct PipelineCoverageModulationStateCreateInfoNv
    s_type : StructureType
    p_next : Void*
    flags : PipelineCoverageModulationStateCreateFlagsNv
    coverage_modulation_mode : CoverageModulationModeNv
    coverage_modulation_table_enable : Bool32
    coverage_modulation_table_count : Uint32T
    p_coverage_modulation_table : LibC::Float*
  end
  alias PipelineCoverageModulationStateCreateFlagsNv = Flags
  enum CoverageModulationModeNv
    VkCoverageModulationModeNoneNv = 0
    VkCoverageModulationModeRgbNv = 1
    VkCoverageModulationModeAlphaNv = 2
    VkCoverageModulationModeRgbaNv = 3
    VkCoverageModulationModeBeginRangeNv = 0
    VkCoverageModulationModeEndRangeNv = 3
    VkCoverageModulationModeRangeSizeNv = 4
    VkCoverageModulationModeMaxEnumNv = 2147483647
  end
  alias ValidationCacheExtT = Void
  struct ValidationCacheCreateInfoExt
    s_type : StructureType
    p_next : Void*
    flags : ValidationCacheCreateFlagsExt
    initial_data_size : LibC::SizeT
    p_initial_data : Void*
  end
  alias ValidationCacheCreateFlagsExt = Flags
  struct ShaderModuleValidationCacheCreateInfoExt
    s_type : StructureType
    p_next : Void*
    validation_cache : ValidationCacheExt
  end
  type ValidationCacheExt = Void*
  fun create_validation_cache_ext = vkCreateValidationCacheEXT(device : Device, p_create_info : ValidationCacheCreateInfoExt*, p_allocator : AllocationCallbacks*, p_validation_cache : ValidationCacheExt*) : Result
  fun destroy_validation_cache_ext = vkDestroyValidationCacheEXT(device : Device, validation_cache : ValidationCacheExt, p_allocator : AllocationCallbacks*)
  fun merge_validation_caches_ext = vkMergeValidationCachesEXT(device : Device, dst_cache : ValidationCacheExt, src_cache_count : Uint32T, p_src_caches : ValidationCacheExt*) : Result
  fun get_validation_cache_data_ext = vkGetValidationCacheDataEXT(device : Device, validation_cache : ValidationCacheExt, p_data_size : LibC::SizeT*, p_data : Void*) : Result
  struct DescriptorSetLayoutBindingFlagsCreateInfoExt
    s_type : StructureType
    p_next : Void*
    binding_count : Uint32T
    p_binding_flags : DescriptorBindingFlagsExt*
  end
  alias DescriptorBindingFlagsExt = Flags
  struct PhysicalDeviceDescriptorIndexingFeaturesExt
    s_type : StructureType
    p_next : Void*
    shader_input_attachment_array_dynamic_indexing : Bool32
    shader_uniform_texel_buffer_array_dynamic_indexing : Bool32
    shader_storage_texel_buffer_array_dynamic_indexing : Bool32
    shader_uniform_buffer_array_non_uniform_indexing : Bool32
    shader_sampled_image_array_non_uniform_indexing : Bool32
    shader_storage_buffer_array_non_uniform_indexing : Bool32
    shader_storage_image_array_non_uniform_indexing : Bool32
    shader_input_attachment_array_non_uniform_indexing : Bool32
    shader_uniform_texel_buffer_array_non_uniform_indexing : Bool32
    shader_storage_texel_buffer_array_non_uniform_indexing : Bool32
    descriptor_binding_uniform_buffer_update_after_bind : Bool32
    descriptor_binding_sampled_image_update_after_bind : Bool32
    descriptor_binding_storage_image_update_after_bind : Bool32
    descriptor_binding_storage_buffer_update_after_bind : Bool32
    descriptor_binding_uniform_texel_buffer_update_after_bind : Bool32
    descriptor_binding_storage_texel_buffer_update_after_bind : Bool32
    descriptor_binding_update_unused_while_pending : Bool32
    descriptor_binding_partially_bound : Bool32
    descriptor_binding_variable_descriptor_count : Bool32
    runtime_descriptor_array : Bool32
  end
  struct PhysicalDeviceDescriptorIndexingPropertiesExt
    s_type : StructureType
    p_next : Void*
    max_update_after_bind_descriptors_in_all_pools : Uint32T
    shader_uniform_buffer_array_non_uniform_indexing_native : Bool32
    shader_sampled_image_array_non_uniform_indexing_native : Bool32
    shader_storage_buffer_array_non_uniform_indexing_native : Bool32
    shader_storage_image_array_non_uniform_indexing_native : Bool32
    shader_input_attachment_array_non_uniform_indexing_native : Bool32
    robust_buffer_access_update_after_bind : Bool32
    quad_divergent_implicit_lod : Bool32
    max_per_stage_descriptor_update_after_bind_samplers : Uint32T
    max_per_stage_descriptor_update_after_bind_uniform_buffers : Uint32T
    max_per_stage_descriptor_update_after_bind_storage_buffers : Uint32T
    max_per_stage_descriptor_update_after_bind_sampled_images : Uint32T
    max_per_stage_descriptor_update_after_bind_storage_images : Uint32T
    max_per_stage_descriptor_update_after_bind_input_attachments : Uint32T
    max_per_stage_update_after_bind_resources : Uint32T
    max_descriptor_set_update_after_bind_samplers : Uint32T
    max_descriptor_set_update_after_bind_uniform_buffers : Uint32T
    max_descriptor_set_update_after_bind_uniform_buffers_dynamic : Uint32T
    max_descriptor_set_update_after_bind_storage_buffers : Uint32T
    max_descriptor_set_update_after_bind_storage_buffers_dynamic : Uint32T
    max_descriptor_set_update_after_bind_sampled_images : Uint32T
    max_descriptor_set_update_after_bind_storage_images : Uint32T
    max_descriptor_set_update_after_bind_input_attachments : Uint32T
  end
  struct DescriptorSetVariableDescriptorCountAllocateInfoExt
    s_type : StructureType
    p_next : Void*
    descriptor_set_count : Uint32T
    p_descriptor_counts : Uint32T*
  end
  struct DescriptorSetVariableDescriptorCountLayoutSupportExt
    s_type : StructureType
    p_next : Void*
    max_variable_descriptor_count : Uint32T
  end
  struct DeviceQueueGlobalPriorityCreateInfoExt
    s_type : StructureType
    p_next : Void*
    global_priority : QueueGlobalPriorityExt
  end
  enum QueueGlobalPriorityExt
    VkQueueGlobalPriorityLowExt = 128
    VkQueueGlobalPriorityMediumExt = 256
    VkQueueGlobalPriorityHighExt = 512
    VkQueueGlobalPriorityRealtimeExt = 1024
    VkQueueGlobalPriorityBeginRangeExt = 128
    VkQueueGlobalPriorityEndRangeExt = 1024
    VkQueueGlobalPriorityRangeSizeExt = 897
    VkQueueGlobalPriorityMaxEnumExt = 2147483647
  end
  struct ImportMemoryHostPointerInfoExt
    s_type : StructureType
    p_next : Void*
    handle_type : ExternalMemoryHandleTypeFlagBits
    p_host_pointer : Void*
  end
  struct MemoryHostPointerPropertiesExt
    s_type : StructureType
    p_next : Void*
    memory_type_bits : Uint32T
  end
  struct PhysicalDeviceExternalMemoryHostPropertiesExt
    s_type : StructureType
    p_next : Void*
    min_imported_host_pointer_alignment : DeviceSize
  end
  fun get_memory_host_pointer_properties_ext = vkGetMemoryHostPointerPropertiesEXT(device : Device, handle_type : ExternalMemoryHandleTypeFlagBits, p_host_pointer : Void*, p_memory_host_pointer_properties : MemoryHostPointerPropertiesExt*) : Result
  fun cmd_write_buffer_marker_amd = vkCmdWriteBufferMarkerAMD(command_buffer : CommandBuffer, pipeline_stage : PipelineStageFlagBits, dst_buffer : Buffer, dst_offset : DeviceSize, marker : Uint32T)
  struct PhysicalDeviceShaderCorePropertiesAmd
    s_type : StructureType
    p_next : Void*
    shader_engine_count : Uint32T
    shader_arrays_per_engine_count : Uint32T
    compute_units_per_shader_array : Uint32T
    simd_per_compute_unit : Uint32T
    wavefronts_per_simd : Uint32T
    wavefront_size : Uint32T
    sgprs_per_simd : Uint32T
    min_sgpr_allocation : Uint32T
    max_sgpr_allocation : Uint32T
    sgpr_allocation_granularity : Uint32T
    vgprs_per_simd : Uint32T
    min_vgpr_allocation : Uint32T
    max_vgpr_allocation : Uint32T
    vgpr_allocation_granularity : Uint32T
  end
  struct PhysicalDeviceVertexAttributeDivisorPropertiesExt
    s_type : StructureType
    p_next : Void*
    max_vertex_attrib_divisor : Uint32T
  end
  struct VertexInputBindingDivisorDescriptionExt
    binding : Uint32T
    divisor : Uint32T
  end
  struct PipelineVertexInputDivisorStateCreateInfoExt
    s_type : StructureType
    p_next : Void*
    vertex_binding_divisor_count : Uint32T
    p_vertex_binding_divisors : VertexInputBindingDivisorDescriptionExt*
  end
  struct QueueFamilyCheckpointPropertiesNv
    s_type : StructureType
    p_next : Void*
    checkpoint_execution_stage_mask : PipelineStageFlags
  end
  struct CheckpointDataNv
    s_type : StructureType
    p_next : Void*
    stage : PipelineStageFlagBits
    p_checkpoint_marker : Void*
  end
  fun cmd_set_checkpoint_nv = vkCmdSetCheckpointNV(command_buffer : CommandBuffer, p_checkpoint_marker : Void*)
  fun get_queue_checkpoint_data_nv = vkGetQueueCheckpointDataNV(queue : Queue, p_checkpoint_data_count : Uint32T*, p_checkpoint_data : CheckpointDataNv*)
end

