libvulkan = "./src/kimberlite/libvulkan.cr"
body = File.read(libvulkan)
version = File.read("./VULKAN_VERSION")

# Some renamings that are done by crystal_lib create incorrect/inconsistent names
# like dimension2D -> dimension2_d.
# So this script fixes them. Those incorrect names currently are:
#
# - sparse_residency_image2_d
# - sparse_residency_image3_d
# - sparse_residency2_samples
# - sparse_residency4_samples
# - sparse_residency8_samples
# - sparse_residency16_samples
# - max_image_dimension1_d
# - max_image_dimension2_d
# - max_image_dimension3_d
# - residency_standard2_d_block_shape
# - residency_standard2_d_multisample_block_shape
# - residency_standard3_d_block_shape

body = body.gsub(/sparse_residency_image(\d+)_d/, "sparse_residency_image_\\1d")
body = body.gsub(/sparse_residency(\d+)_samples/, "sparse_residency_\\1_samples")
body = body.gsub(/max_image_dimension(\d+)_d/, "max_image_dimension_\\1d")
body = body.gsub(/residency_standard(\d+)_d_/, "residency_standard_\\1d_")

body = <<-TXT
# ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
# ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛ THIS FILE IS MACHINE GENERATED ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
# ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
# Vulkan: #{version}

#{body}
TXT

File.write(libvulkan, body)
