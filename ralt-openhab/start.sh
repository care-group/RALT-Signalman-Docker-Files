#!/bin/bash
echo Y | /usr/share/openhab/runtime/bin/restore /home/root/Software/RALT-OpenHAB-Backup/openhab-backup-21_08_05-10_46_53.zip &
rm -rf /var/lib/openhab/cache/*
rm -rf /var/lib/openhab/tmp/*
openhab-cli start --debug
