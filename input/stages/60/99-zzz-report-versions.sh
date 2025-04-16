#!/bin/sh

# Define the output file path
VERSIONS_FILE="${OUTPUT_PATH}/versions.txt"

# Helper function to append content to versions file
append_to_versions() {
    echo "$1" >> "$VERSIONS_FILE"
}

# Helper function to append section header to versions file
append_section() {
    append_to_versions ""
    append_to_versions "### $1"
}


# System Information section
append_section "System Information"
chroot_exec cat /etc/alpine-release | sed 's/^/Alpine Linux: /' >> "$VERSIONS_FILE"
chroot_exec uname -a >> "$VERSIONS_FILE"

# K3s Information section
append_section "K3s Information"
chroot_exec k3s --version >> "$VERSIONS_FILE"

# Package Versions section
append_section "Package Versions"
chroot_exec apk info -v k3s tailscale linux-firmware-brcm dropbear | sort >> "$VERSIONS_FILE"

# Network Configuration section
append_section "Network Configuration"
if [ "$WIFI_ENABLED" = "true" ]; then
    append_to_versions "WiFi: Enabled (SSID: ${WIFI_SSID})"
else
    append_to_versions "WiFi: Disabled"
fi

# Print message that versions file is ready
echo "Version information generated at $VERSIONS_FILE"
cat "$VERSIONS_FILE"
