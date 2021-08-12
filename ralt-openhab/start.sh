#!/bin/bash
echo Y | /usr/share/openhab/runtime/bin/restore /home/root/Software/RALT-OpenHAB-Backup/openhab-backup-21_08_05-10_46_53.zip &
echo badrobot0! | sudo systemctl stop openhab2.service
sudo rm -rf /var/lib/openhab2/cache/*
sudo rm -rf /var/lib/openhab2/tmp/*
sudo systemctl start openhab2.service
