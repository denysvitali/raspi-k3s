#!/bin/sh

# install deps and add avahi to default runlevel
chroot_exec apk add \
  dropbear-scp \
  htop \
  linux-firmware-brcm \
  openssh-sftp-server \
  tailscale \
  vim

# Add edge repository
echo "@edge-community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> ${ROOTFS_PATH}/etc/apk/repositories


chroot_exec apk add k3s@edge-community
