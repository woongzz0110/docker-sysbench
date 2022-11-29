#!/bin/bash

LOG_STR=""
for SRC in /opt/woongzz0110/sysbench/src/run/*.sh; do
    NAME=${SRC#"/opt/woongzz0110/sysbench/src/run/"}
    NAME=${NAME%".sh"}
    nohup $SRC > /opt/woongzz0110/sysbench/log/$NAME.log 2>&1 &
    LOG_STR="$LOG_STR -f /opt/woongzz0110/sysbench/log/$NAME.log"
done

tail $LOG_STR