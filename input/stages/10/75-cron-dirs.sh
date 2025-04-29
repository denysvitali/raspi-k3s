#!/bin/sh

# Create periodic directories for cron jobs
mkdir -p "${ROOTFS_PATH}"/etc/periodic/15min
mkdir -p "${ROOTFS_PATH}"/etc/periodic/hourly
mkdir -p "${ROOTFS_PATH}"/etc/periodic/daily
mkdir -p "${ROOTFS_PATH}"/etc/periodic/weekly
mkdir -p "${ROOTFS_PATH}"/etc/periodic/monthly