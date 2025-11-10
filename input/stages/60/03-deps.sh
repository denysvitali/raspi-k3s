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

# Ensure CNI plugin path expected by k3s exists and contains flannel
mkdir -p "${ROOTFS_PATH}"/opt/cni/bin
# If flannel binary exists in its Alpine location, expose it where k3s looks for CNI plugins
if [ -x "${ROOTFS_PATH}"/usr/libexec/cni/flannel ] && [ ! -e "${ROOTFS_PATH}"/opt/cni/bin/flannel ]; then
  ln -s /usr/libexec/cni/flannel "${ROOTFS_PATH}"/opt/cni/bin/flannel
fi
