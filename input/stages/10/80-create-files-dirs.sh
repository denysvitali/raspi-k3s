#!/bin/sh

mkdir -p "${ROOTFS_PATH}"/etc/dropbear
mkdir -p "${ROOTFS_PATH}"/var/log
mkdir -p "${ROOTFS_PATH}"/var/lib
mkdir -p "${ROOTFS_PATH}"/var/lib/rancher
mkdir -p "${ROOTFS_PATH}"/etc/rancher
mkdir -p "${ROOTFS_PATH}"/var/jfsCache

touch "${ROOTFS_PATH}"/etc/updatedb.conf
