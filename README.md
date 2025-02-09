# raspi-k3s

This repository contains the necessary files to deploy the K3S master node on a Raspberry Pi 4.

## Prerequisites

- [raspi-alpine/builder](https://gitlab.com/raspi-alpine/builder/) (until they release the newest Docker image)

## Usage

Copy the `.env.example` file to `.env`:

```bash
cp .env.example .env
```

Edit the `.env` file and fill in the necessary values - you probably only need to change the `WIFI_SSID` and `WIFI_PSK`.

Then, run the following command:

```bash
./build_image.sh
```

Your image will be available in the `output` directory. Flash the `sdcard.img` on an SD card and boot your Raspberry Pi 4.

## Flashing upgrades

```bash
scp sdcard_update.img.gz sdcard_update.img.gz.sha256 root@your-device:/tmp
```

Then on your device:

```bash
# ab_flash /tmp/sdcard_update.img.gz
# reboot
```
