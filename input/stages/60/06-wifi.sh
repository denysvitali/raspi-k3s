#!/bin/sh

if [ "$WIFI_ENABLED" != "true" ]; then
  echo "=== WIFI IS DISABLED - SKIPPING ==="
  return
fi

# wifi stuff
chroot_exec apk add wireless-tools iwd dbus openresolv
chroot_exec rc-update add iwd default
chroot_exec rc-update add dbus
echo "brcmfmac" >>"$ROOTFS_PATH"/etc/modules

cat >>"$ROOTFS_PATH"/etc/network/interfaces.alpine-builder <<EOF

auto wlan0
iface wlan0 inet dhcp
EOF
cp "$ROOTFS_PATH"/etc/network/interfaces.alpine-builder "$DATAFS_PATH"/etc/network/interfaces

cat > "$ROOTFS_PATH"/etc/iwd/main.conf <<EOF
[General]
EnableNetworkConfiguration=True

[Network]
NameResolvingService=resolvconf
EOF

mkdir -p "$DATAFS_PATH"/var/lib/iwd
cat > "$DATAFS_PATH"/var/lib/iwd/"$WIFI_SSID".psk <<EOF
[Security]
Passphrase=$WIFI_PSK

[Settings]
AutoConnect=true
Hidden=true
EOF

cat >> "$ROOTFS_PATH"/etc/modprobe.d/wifi.conf <<EOF
options brcmfmac feature_disable=0x82000
EOF

echo "=== WIFI SETUP COMPLETE ==="
