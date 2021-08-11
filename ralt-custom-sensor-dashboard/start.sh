#!/bin/bash
cd /home/root/Software/server &
/usr/sbin/apache2 -k start &
python3 app.py