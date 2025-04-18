#!/bin/sh

# Create essential directories
mkdir -p "${ROOTFS_PATH}"/etc/dropbear
mkdir -p "${ROOTFS_PATH}"/var/log
mkdir -p "${ROOTFS_PATH}"/var/lib
mkdir -p "${ROOTFS_PATH}"/var/lib/rancher
mkdir -p "${ROOTFS_PATH}"/etc/rancher
mkdir -p "${ROOTFS_PATH}"/var/jfsCache
mkdir -p "${ROOTFS_PATH}"/etc/udev/rules.d
mkdir -p "${ROOTFS_PATH}"/usr/share/doc
mkdir -p "${ROOTFS_PATH}"/usr/local/bin
mkdir -p "${ROOTFS_PATH}"/mnt/ssd
mkdir -p "${ROOTFS_PATH}"/mnt/root

touch "${ROOTFS_PATH}"/etc/updatedb.conf
