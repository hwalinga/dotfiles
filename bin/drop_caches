#!/usr/bin/sudo bash

service postgresql stop
sync
echo 3 > /proc/sys/vm/drop_caches
service postgresql start
