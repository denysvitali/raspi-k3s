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
  vim \
  cni-plugin-flannel

# Add services to runlevels
chroot_exec rc-update add k3s default
chroot_exec rc-update add dropbear default
chroot_exec rc-update add udev sysinit

mkdir -p "${ROOTFS_PATH}"/etc/dropbear

# Ensure CNI plugin path expected by k3s exists and mirrors /usr/libexec/cni
if [ -d "${ROOTFS_PATH}"/usr/libexec/cni ]; then
  # Create parent directory for the CNI bin path
  mkdir -p "${ROOTFS_PATH}"/opt/cni

  # If /opt/cni/bin already exists and is not a symlink, remove it to avoid conflicts
  if [ -e "${ROOTFS_PATH}"/opt/cni/bin ] && [ ! -L "${ROOTFS_PATH}"/opt/cni/bin ]; then
    rm -rf "${ROOTFS_PATH}"/opt/cni/bin
  fi

  # Create a symlink so /opt/cni/bin contains the same plugins as /usr/libexec/cni
  if [ ! -e "${ROOTFS_PATH}"/opt/cni/bin ]; then
    ln -s /usr/libexec/cni "${ROOTFS_PATH}"/opt/cni/bin
  fi
fi
