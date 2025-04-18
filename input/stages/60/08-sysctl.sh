#!/bin/sh

cat << EOF > "${ROOTFS_PATH}"/etc/sysctl.conf
fs.inotify.max_user_instances = 1024
fs.inotify.max_user_watches = 524288
# Optimize filesystem for container workloads
vm.dirty_ratio = 80
vm.dirty_background_ratio = 5
vm.dirty_expire_centisecs = 12000
EOF

# Install udev rules to identify SSDs
cat << EOF > "${ROOTFS_PATH}"/etc/udev/rules.d/90-ssd-mount.rules
# Auto-detect SSD drives - let the startup script handle the mounting
KERNEL=="sd*", SUBSYSTEM=="block", ENV{ID_TYPE}=="disk", ACTION=="add", RUN+="/bin/sh -c 'echo SSD device detected: %k >> /var/log/ssd-detect.log'"
EOF
