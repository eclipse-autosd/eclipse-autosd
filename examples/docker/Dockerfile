FROM quay.io/centos/centos:stream10 AS builder

RUN dnf install -y gcc

COPY src/ /workspace/src

RUN mkdir -p /workspace/_build

RUN gcc -o /workspace/_build/sample /workspace/src/sample.c

FROM ghcr.io/eclipse-autosd/eclipse-autosd-bootc-qemu:latest

COPY --from=builder /workspace/_build/sample /usr/bin/sample

COPY files/sample.service /etc/systemd/system/sample2.service

RUN systemctl enable sample2.service
