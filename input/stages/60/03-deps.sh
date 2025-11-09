#!/bin/sh

# Add edge repository
echo "@edge-community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> ${ROOTFS_PATH}/etc/apk/repositories


# install deps and add services to runlevels
chroot_exec apk add \
  --no-cache \
  chrony \
  dropbear-scp \
  dua \
  e2fsprogs \
  eudev \
  htop \
  k3s@edge-community \
  linux-firmware-brcm \
  logrotate \
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
