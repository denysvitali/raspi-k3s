#!/bin/sh

# Make sure scripts are executable
chmod 755 "${ROOTFS_PATH}"/etc/init.d/ssd-mount
chmod 755 "${ROOTFS_PATH}"/etc/init.d/fs-rshared
chmod 755 "${ROOTFS_PATH}"/etc/init.d/k3s
chmod 755 "${ROOTFS_PATH}"/usr/local/bin/prepare-ssd
chmod 755 "${ROOTFS_PATH}"/etc/local.d/99-startup.start
chmod 755 "${ROOTFS_PATH}"/etc/periodic/15min/fs-rshared

# Make sure the periodic directory exists
mkdir -p "${ROOTFS_PATH}"/etc/periodic/15min

chroot_exec rc-update add ssd-mount boot
chroot_exec rc-update add fs-rshared boot
chroot_exec rc-update add crond default

# Create mount points
mkdir -p "${ROOTFS_PATH}"/mnt/ssd
mkdir -p "${ROOTFS_PATH}"/mnt/root
