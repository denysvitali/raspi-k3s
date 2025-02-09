# raspi-k3s

Deploy K3S master node on a Raspberry Pi 4 with automated setup and WiFi configuration.

## Overview

This project provides automation scripts and configuration files to easily deploy a K3S master node on Raspberry Pi 4 hardware.
The setup follows an A/B partition scheme (thanks to raspi-alpine/builder) to allow for easy updates and rollbacks.

## Prerequisites

- Raspberry Pi 4 (any RAM size)
- SD card (min 8GB recommended, but at least `SIZE_ROOT_PART * 2 + SIZE_DATA`)
- [raspi-alpine/builder](https://gitlab.com/raspi-alpine/builder/) dependency

## Quick Start

1. Clone this repository
2. Configure environment:
    ```bash
    cp .env.example .env
    ```
    Edit `.env` to set your WiFi credentials (`WIFI_SSID` and `WIFI_PSK`)

3. Add SSH keys:
    ```bash
    ssh-add -L > input/config/authorized_keys
    ```

4. Build image:
    ```bash
    ./build_image.sh
    ```

5. Flash the resulting `output/sdcard.img` to your SD card

## Updating the System

To update an existing installation:

1. Transfer update image:
    ```bash
    scp output/sdcard_update.img.gz output/sdcard_update.img.gz.sha256 root@master:/tmp
    ```

2. Apply update on device:
    ```bash
    ab_flash /tmp/sdcard_update.img.gz && reboot
    ```

## Security Notes

- Always change default passwords
- Use SSH keys for authentication
- Update the system regularly (re-build the image and apply the update)

## Support

For issues and feature requests, please use the GitHub issue tracker.

