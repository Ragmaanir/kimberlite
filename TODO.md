

**Low Effort Simplification**

- Hide all the `pointerof` stuff
- Often the `XXXInfo` structures are not necessary because they are basically empty and can be replaced by crystal parameters.
- Several `XXXInfo` structures have a `x_count` and `p_xs` to store lists. This can be moved to crystal.
- Every `XXXInfo` structure has a `s_type` member which is usually redundant. Maybe use `lib_extensions` to provide a default value matching the structure?

**Advanced Simplifications**

- Provide builders for complex objects, like the `Pipeline`, `RenderPass`, `Swapchain`, `Framebuffer`
- Provide builders/DSL for `CommandBuffer`
- Provide default implementation for staging-buffers for uploading data to the graphics memory
