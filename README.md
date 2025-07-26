# autosd-image-eclipse-sdv

AutoSD image manifests to run EclipeSDV projects and blueprints.

This branch contains the base image definition to be used and extended when running Eclipse SDV blueprints.

Specialized branches are provided per blueprint, so, a "eclipse-sdv-blueprint/service-to-signal" branch has all the code needed
to run that blueprint.

## Geting Started

### Building

Prepare scripts and local directories:

```sh
make prepare
```

Build an image (defaults to qemu target) by running (requires sudo or needs to be run as root):

```sh
make build
```

## Running

Run the image using qemu:

```
make run/qemu
```

Login using `root`/`password`.

## License

[MIT](./LICENSE)
