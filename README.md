# autosd-image-soafee

An AutoSD image with Eclipse SDV components.

## Geting Started

### Building

Create a `_build` and `outputs` directory

```sh
mkdir -p _build outputs
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
_build/main.json
```

Build the image using `osbuild`:

```sh
sudo osbuild \
--store _build/osbuild_store \
--output-directory output \
--export qcow2 \
_build/main.json
```

## Running

Run the image using qemu:

```
sudo ./scripts/runvm outputs/qcow2/disk.qcow2
```

Login using `root`/`password`.

## License

[MIT](./LICENSE)
