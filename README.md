# autosd-image-eclipse-sdv

AutoSD image manifests to run EclipeSDV projects.

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
