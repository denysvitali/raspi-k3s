#!/bin/sh

# Make sure the OS version file exists
if [ ! -f "${INPUT_PATH}"/files/etc/raspi-k3s-version ]; then
    echo "OS version file not found. Creating a new one."
    echo "devel" >>  "${INPUT_PATH}"/files/etc/raspi-k3s-version
fi

# Copy files from the organized structure
cp -r "${INPUT_PATH}"/files/* "${ROOTFS_PATH}"/
