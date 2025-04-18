#!/bin/sh

cat << EOF > "${ROOTFS_PATH}"/etc/sysctl.conf
fs.inotify.max_user_instances = 1024
fs.inotify.max_user_watches = 524288
# Optimize filesystem for container workloads
vm.dirty_ratio = 80
vm.dirty_background_ratio = 5
vm.dirty_expire_centisecs = 12000
EOF

# Create udev directory structure
mkdir -p "${ROOTFS_PATH}"/etc/udev/rules.d
mkdir -p "${ROOTFS_PATH}"/var/log

# Install udev rules to identify SSDs
cat << EOF > "${ROOTFS_PATH}"/etc/udev/rules.d/90-ssd-mount.rules
# Auto-detect SSD drives - let the startup script handle the mounting
KERNEL=="sd*1", SUBSYSTEM=="block", ACTION=="add", \
    RUN+="/bin/sh -c 'logger -t ssd-detect \"SSD device detected: %k\"; touch /var/log/ssd-detect.log; echo SSD device detected: %k >> /var/log/ssd-detect.log'"
EOF

# Create a helper script to trigger SSD mount service after udev detects an SSD
cat << EOF > "${ROOTFS_PATH}"/usr/local/bin/ssd-hotplug-helper
#!/bin/sh
# This script is called by udev when a new SSD is detected
# It checks if ssd-mount service is running and restarts it to detect the new SSD

# Log the event
logger -t ssd-hotplug "SSD device hotplug event detected"

# Check if ssd-mount service exists and restart it
if [ -x /etc/init.d/ssd-mount ]; then
    /etc/init.d/ssd-mount restart
fi
EOF

chmod +x "${ROOTFS_PATH}"/usr/local/bin/ssd-hotplug-helper

# Enhance udev rules to call the helper script
cat << EOF > "${ROOTFS_PATH}"/etc/udev/rules.d/91-ssd-hotplug.rules
# Call the hotplug helper script when an SSD is added
KERNEL=="sd*1", SUBSYSTEM=="block", ACTION=="add", RUN+="/usr/local/bin/ssd-hotplug-helper"
EOF
