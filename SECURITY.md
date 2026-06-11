# Security Policy

This project implements the [Eclipse Foundation Security Policy](https://www.eclipse.org/security).

## Supported Versions

This project generate AutoSD images (containers, qemu, etc) and these being rolled weekly,
always being tagged as the "latest release", replacing the previous one.

New artifacts will be genarated outside of that scheduled if a security patch is needed,
so users should update their images with their tool of choice (docker, podman, bootc, etc)
in order to have the latest images with the most recent patches available.

## Reporting a Vulnerability

Please report vulnerabilities to the Eclipse Foundation Security Team at
<security@eclipse.org>.
