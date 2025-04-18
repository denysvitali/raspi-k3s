#!/bin/sh

# Copy files from the organized structure
cp -r "${INPUT_PATH}"/files/* "${ROOTFS_PATH}"/

# Make sure scripts are executable
chmod 755 "${ROOTFS_PATH}"/etc/init.d/ssd-mount
chmod 755 "${ROOTFS_PATH}"/usr/local/bin/prepare-ssd
chmod 755 "${ROOTFS_PATH}"/etc/local.d/99-startup.start

# Add SSD mount service to boot runlevel
chroot_exec rc-update add ssd-mount boot

# Create mount points
mkdir -p "${ROOTFS_PATH}"/mnt/ssd
mkdir -p "${ROOTFS_PATH}"/mnt/root
