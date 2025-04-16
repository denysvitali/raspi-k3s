#!/bin/sh

# Define the output file path
VERSIONS_FILE="${OUTPUT_PATH}/versions.txt"

# Helper function to append content to versions file
add_to_v() {
    echo "$1" >> "$VERSIONS_FILE"
}

# Helper function to append section header to versions file
append_section() {
    add_to_v ""
    add_to_v "### $1"
}


# System Information section
append_section "System Information"
append_section "$(chroot_exec cat /etc/alpine-release 2>&1)"
add_to_v "$(uname -a >> "$VERSIONS_FILE" 2>&1)"

# K3s Information section
append_section "K3s Information"
add_to_v "$(chroot_exec k3s --version 2>&1)"

# Package Versions section
append_section "Package Versions"
add_to_v "$(chroot_exec apk list -I | awk '{print $1}')"

# Network Configuration section
append_section "Network Configuration"
if [ "$WIFI_ENABLED" = "true" ]; then
    add_to_v "WiFi: Enabled (SSID: ${WIFI_SSID})"
else
    add_to_v "WiFi: Disabled"
fi
