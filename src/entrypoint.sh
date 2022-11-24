#!/bin/bash

LOG_STR=""
for SRC in /woongzz0110/sysbench/src/run/*.sh; do
    NAME=${SRC#"/woongzz0110/sysbench/src/run/"}
    NAME=${NAME%".sh"}
    nohup $SRC > /woongzz0110/sysbench/log/$NAME.log 2>&1 &
    LOG_STR="$LOG_STR -f /woongzz0110/sysbench/log/$NAME.log"
done

tail $LOG_STR