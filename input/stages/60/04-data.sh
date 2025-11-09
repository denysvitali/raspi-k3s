#!/bin/sh

mkdir -p "${DATAFS_PATH}"/var/log
mkdir -p "${DATAFS_PATH}"/etc/rancher
mkdir -p "${DATAFS_PATH}"/var/lib
mkdir -p "${DATAFS_PATH}"/var/jfsCache
touch "${DATAFS_PATH}"/etc/updatedb.conf

# Create initial resolv.conf with Cloudflare DNS
cat > "${DATAFS_PATH}"/etc/resolv.conf <<EOF
nameserver 1.1.1.1
EOF

# Mount points are now created in the SSD service stage script
