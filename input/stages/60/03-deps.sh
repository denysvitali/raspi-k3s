#!/bin/sh

# Add edge repository
echo "@edge-community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> ${ROOTFS_PATH}/etc/apk/repositories

# install deps and add services to runlevels
chroot_exec apk add \
  --no-cache \
  dropbear-scp \
  htop \
  linux-firmware-brcm \
  k3s@edge-community \
  openssh-sftp-server \
  tailscale \
  python3 \
  vim \
  eudev \
  e2fsprogs \
  util-linux

# Add services to runlevels
chroot_exec rc-update add k3s default
chroot_exec rc-update add dropbear default
chroot_exec rc-update add udev sysinit

mkdir -p "${ROOTFS_PATH}"/etc/dropbear
