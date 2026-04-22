# Eclipse Automotive Integration for AutoSD

## Table of Contents

- [Eclipse Automotive Integration for AutoSD](#eclipse-automotive-integration-for-autosd)
  - [Description](#description)
    - [A Consistent Automotive Platform](#a-consistent-automotive-platform)
  - [The Eclipse AutoSD Integration Framework](#the-eclipse-autosd-integration-framework)
    - [First Phase: Container Image](#first-phase-container-image)
    - [Second Phase: Disk Image](#second-phase-disk-image)
  - [License](#license)

## Description

Eclipse Automotive Integration for AutoSD uses an AutoSD image, built and tailored for its community, to run and test both Eclipse SDV projects and blueprints.

Eclipse Automotive Integration for AutoSD offers a foundation for projects to build, run and test their stack, components and services, including blueprints.

The image setup will expose projects into thinking how their projects or blueprints would work in an [Mixed Critical Orchestration](https://sigs.centos.org/automotive/latest/features-and-concepts/con_mixed-criticality.html)  architecture.

Several upstream tools from the CentOS Automotive SIG can used, [from building images](https://gitlab.com/CentOS/automotive/src/automotive-image-builder) to [performance testing](https://sigs.centos.org/automotive/latest/performance/performance_monitoring_with_pcp.html), but this integration project could also provide its own set of specialized tools for Eclipse SDV, to ease the process of deploying blueprints into this reference AutoSD image and so on.

This integration project gets several [supported platforms](https://sigs.centos.org/automotive/provisioning/) for free, including virtual ones, such a AWS and Azure, allowing the possibility of running blueprints tests in said cloud providers. 

### A Consistent Automotive Platform

Environment disparity is a common problem with build, testing and deploying software. This is even more true than ever when talking about edge computing and automotive, due to platform (physical or virtual) variety.

AutoSD adresses that problem by using containers with a distinct tool: [bootc](https://bootc.dev/). Bootc stands for *bootable container*, this is a tool that allows container images to be either converted or apply updates to an OS image, which is AutoSD in this case.

Bootc allows the usage of existing OCI compliant tools, such as podman, docker, etc, to build container images that be either converted or used to apply system/rootfs changes to a Linux OS image that was also built with Bootc. AutoSD is such a case.

## The Eclipse AutoSD Integration Framework

We propose a development framework that focuses on using bootc based containers to build and test bluerprints, apps, etc, and then deploying these same containers into a deployed AutoSD image, reducing environment disparity in the whole development process.

This becomes a two step process:

* Build a container image with any OCI compliant tool from  an AutoSD bootc image provided by this project
* Deploy that container in an running AutoSD image using the bootc cli (apply OS rootfs changes from a bootc container image)
* Reboot and run tests

### First Phase: Container Image

The container images can be used for lightweight testing or local development with your tool of choice: podman, docker, docker-compose, etc.

Image are hosted in this organization Github container registry using the following name format: `ghcr.io/eclipse-autosd/eclipse-autosd-bootc-$target:latest`.

`$target` being the target platform, it has a "target platform" because these container images can be converted to disk images (.img, .qcow2) with the `automotive-image-builder` cli. Available targets are `qemu` and `rpi4` but more can be added based on user request.

Images are built for both `x86_64` and `aarch64` architectures.  If you need to pull a specific architecture image, just add a `-amd64` or `arm64` sufix to the image tag (so `latest-amd64` or `latest-arm64`).

One use-case is to extend that container image in a Dockerfile:

```
FROM ubuntu:24.04 AS builder

RUN apt update -y && \
run apt install cargo

COPY . /workspace

RUN (cd /workspace; cargo build --release)

FROM ghcr.io/eclipse-autosd/eclipse-autosd-bootc-qemu:latest

COPY --from=builder /workspace/target/my-artifact /usr/bin/my-artifact

# add more files such as systemd unit files, etc.
```

You can then use that container image in a CI pipeline, docker compose, etc. It has the whole rootfs used in an AutoSD image running in a real hardware device.

You should also push that image in some registry to pull it in an AutoSD image, if you plan to test it in a VM or a virtual 

### Second Phase: Disk Image

Now that you have your software or stack deployed in a custom bootc image, you can boot any pre-built AutoSD disk images to apply the changes from that container image, it's important to note that you need to run the same platform (target) that you built your custom container image from.

So, assuming that QEMU was used, you can run the pre-built image qcow2 disk file with qemu (under releases). The following command (`air`) is a wrapper script of qemu-system, provided by the Automotive SIG:

```
# sample command, change as needed
$ wget -O air 'https://gitlab.com/CentOS/automotive/src/automotive-image-builder/-/raw/main/bin/aib?ref_type=heads'
$ chmod +x air
# add --nographics to stream qemu's serial console into your own
# change the path to the actual qcow2 disk file
$ ./air disk.qcow2 
```

You can login or ssh into that image using `root` / `password` (these are just available for development!) or login directly into QEMU's serial console.

Once logged, you can apply your images by running `bootc switch $image`. A reboot is required to apply your changes which can be accomplished by adding a `--apply` argumet to that bootc command (it will reboot after applying all changes) or by running `systemctl reboot`.

Once rebooted you can check or test your software inside that autosd image.

## License

[Apache-2.0](./LICENSE)
