#!/bin/bash

INSTALLED_KERNEL=$(kernel-install list --json short | jq -r 'map(select(.has_kernel == true)) | .[0].version')
DRACUT_NO_XATTR=1 dracut -v --force --zstd --reproducible --no-hostonly --add "dmsquash-live dmsquash-live-autooverlay" "/usr/lib/modules/${INSTALLED_KERNEL}/initramfs.img" "${INSTALLED_KERNEL}"
