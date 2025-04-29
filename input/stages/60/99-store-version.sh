#!/bin/bash

touch "${INPUT_PATH}"/etc/raspi-k3s-version
cp "${INPUT_PATH}"/etc/raspi "${ROOTFS_PATH}"/etc/raspi-k3s-version
