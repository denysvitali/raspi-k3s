#!/bin/sh

# install deps and add services to runlevels
chroot_exec apk add \
  --no-cache \
  dropbear-scp \
  e2fsprogs \
  eudev \
  htop \
  k3s \
  linux-firmware-brcm \
  openssh-sftp-server \
  python3 \
  tailscale \
  tcpdump \
  util-linux \
  vim

# Add services to runlevels
chroot_exec rc-update add k3s default
chroot_exec rc-update add dropbear default
chroot_exec rc-update add udev sysinit

mkdir -p "${ROOTFS_PATH}"/etc/dropbear
