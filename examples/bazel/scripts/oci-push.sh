#!/bin/bash

skopeo copy \
  --authfile ~/.docker/config.json \
  oci:./bazel-bin/images/sample_image \
  docker://quay.io/my_username/image_name:latest
