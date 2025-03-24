#!/bin/sh

cat << EOF > "${ROOTFS_PATH}"/etc/sysctl.d/90-inotify.conf
fs.inotify.max_user_instances = 1024
fs.inotify.max_user_watches = 524288
EOF
