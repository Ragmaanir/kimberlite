# kimberlite

Vulkan and VEZ bindings for crystal.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  kimberlite:
    github: ragmaanir/kimberlite
```

## Usage

```crystal
require "kimberlite"
```

TODO: Write usage instructions here

## Development

- [ ] Keep some `vulkan.h` namings instead of converting to crystal convention so copy&paste is simpler (?)
- [ ] Remove prefixes from enum values (e.g `PresentModeKhr` in `VkPresentModeImmediateKhr`)

Use `bin/build` to generate `libvulkan.cr`:

A docker container is used to generate `libvulkan.cr` from the `vulkan.h` of the Vulkan SDK (used version is specified in `VULKAN_VERSION` file) using `crystal_lib`. `postprocess_libvulkan.cr` is used to fix some incorrect renamings done by `crystal_lib`. `crystal_lib` is used as a submodule in `./crystal_lib` because there might be changes to it that are vulkan specific.

## Contributing

1. Fork it (<https://github.com/ragmaanir/kimberlite/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [ragmaanir](https://github.com/ragmaanir) Ragmaanir - creator, maintainer
