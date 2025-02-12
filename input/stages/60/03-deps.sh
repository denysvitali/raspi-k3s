#!/bin/sh

# Add edge repository
echo "@edge-community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> ${ROOTFS_PATH}/etc/apk/repositories

# install deps and add avahi to default runlevel
chroot_exec apk add \
  --no-cache \
  dropbear-scp \
  htop \
  linux-firmware-brcm \
  k3s@edge-community \
  openssh-sftp-server \
  tailscale \
  vim

chroot_exec rc-update add k3s default
chroot_exec rc-update add dropbear default

mkdir -p "${ROOTFS_PATH}"/etc/dropbear
