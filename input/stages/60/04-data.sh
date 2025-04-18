#!/bin/sh

mkdir -p "${DATAFS_PATH}"/var/log
mkdir -p "${DATAFS_PATH}"/etc/rancher
mkdir -p "${DATAFS_PATH}"/var/lib
mkdir -p "${DATAFS_PATH}"/var/jfsCache
touch "${DATAFS_PATH}"/etc/updatedb.conf

# Mount points are now created in the SSD service stage script
