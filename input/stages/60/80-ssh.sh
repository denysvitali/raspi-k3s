#!/bin/sh

mkdir -p "${ROOTFS_PATH}"/etc/ssh
cp "${INPUT_PATH}"/config/authorized_keys "${ROOTFS_PATH}"/etc/ssh/authorized_keys

# Configure dropbear
cat > "${ROOTFS_PATH}"/etc/dropbear/dropbear.conf << EOF
DROPBEAR_OPTS="-g"
EOF