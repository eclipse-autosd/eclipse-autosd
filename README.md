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

Running depends on the target it was built, but, the following command can be used to run it
using QEMU (minor modifications may apply depending on your environment):

```
/usr/bin/qemu-system-x86_64 \
-drive file=/usr/share/OVMF/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on \
-drive file=/usr/share/OVMF/OVMF_VARS.fd,if=pflash,format=raw,unit=1,snapshot=on,readonly=off \
-smp 20 \
-nographic \
-enable-kvm \
-m 2G \
-machine q35 \
-cpu host \
-device virtio-net-pci,netdev=n0 \
-netdev user,id=n0,net=10.0.2.0/24,hostfwd=tcp::2222-:22 \
-drive file=outputs/disk.qcow2,index=0,media=disk,format=qcow2,if=virtio,id=rootdisk,snapshot=off
```

Login using `root`/`password`.

## License

[Apache-2.0](./LICENSE)
