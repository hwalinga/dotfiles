#!/bin/bash
/home/hielke/bin/conf_kdb.sh

# When system starts a pause is required for correct execution 
# (but maybe it can be less than 3 seconds.)
sleep 3
/home/hielke/bin/start_conky.sh
