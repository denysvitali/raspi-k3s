#!/bin/sh

# See https://github.com/k3s-io/k3s/issues/11973

chroot_exec k3s --version

# Patch k3s
wget -O "$ROOTFS_PATH"/usr/bin/k3s "https://github.com/k3s-io/k3s/releases/download/v1.32.3-rc4%2Bk3s1/k3s-arm64"
chmod +x "$ROOTFS_PATH"/usr/bin/k3s

chroot_exec k3s --version
