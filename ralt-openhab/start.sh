#!/bin/bash
echo Y | /usr/share/openhab/runtime/bin/restore /home/root/Software/RALT-OpenHAB-Backup/openhab-backup-21_08_05-10_46_53.zip &
openhab-cli start
