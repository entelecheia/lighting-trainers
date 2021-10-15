#!/bin/bash
DATESTAMP=`date +'%y%m%d%H%M%S'`
LOGFILE=.jupyter-$DATESTAMP.log
printf "Logs written to %s\n" "$LOGFILE"

nohup jupyter lab --no-browser --port=8888 --ip=0.0.0.0 --allow-root > $LOGFILE &
