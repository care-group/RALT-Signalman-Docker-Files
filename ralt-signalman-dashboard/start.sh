#!/bin/bash
cd /home/root/Software/server &
/usr/sbin/apache2 -k start &
sleep 2
python3 app.py