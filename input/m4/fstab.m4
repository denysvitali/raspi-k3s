# NOTE:
#   Runtime bind-mounts for SSD-backed storage are handled by:
#     - /etc/init.d/ssd-mount
#   This service:
#     - Detects and validates the SSD (with .ssd marker)
#     - Mounts it at /mnt/ssd
#     - Binds:
#         /mnt/ssd/var/lib  -> /var/lib
#         /mnt/ssd/var/log  -> /var/log
#         /mnt/ssd/data     -> /data
#   As a result:
#     - /var/lib, /var/log, /data, and anything under /data are SSD-backed.
#     - Additional bind mounts here would be redundant or confusing.
#
# Therefore, fstab is intentionally minimal; do not reintroduce per-path binds
# that duplicate what ssd-mount manages dynamically.

/data/etc/dropbear          /etc/dropbear       none    defaults,bind               0   0
/data/etc/rancher           /etc/rancher        none    defaults,bind               0   0
/data/etc/updatedb.conf     /etc/updatedb.conf  none    defaults,bind               0   0
/data/var/jfsCache          /var/jfsCache       none    defaults,bind,shared        0   0