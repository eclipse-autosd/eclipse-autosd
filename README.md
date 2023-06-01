# autosd-image-eclipse-sdv

An AutoSD image with Eclipse SDV components.

## Geting Started

### Building

Create an `outputs` directory

```sh
mkdir -p outputs
```

Generate a osbuild json file using `osbuild-mpp`:

```sh
osbuild-mpp \
-I manifests/ \
-D image_type='"regular"' \
-D arch='"x86_64"' \
-D distro_name='"cs9"' \
-D target='"qemu"' \
manifests/main.mpp.yml \
outputs/main.json
```

Build the image using `osbuild`:

```sh
sudo osbuild \
--store outputs/osbuild_store \
--output-directory outputs \
--export qcow2 \
outputs/main.json
```

## Running

Run the image using qemu:

```
sudo ./scripts/runvm outputs/qcow2/disk.qcow2
```

Login using `root`/`password`.

## License

[MIT](./LICENSE)
