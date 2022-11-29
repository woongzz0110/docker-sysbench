#!/bin/bash

LOG_STR=""
for SRC in $SB_HOME/src/run/*.sh; do
    NAME=${SRC#"$SB_HOME/src/run/"}
    NAME=${NAME%".sh"}
    nohup $SRC > $SB_HOME/log/$NAME.log 2>&1 &
    LOG_STR="$LOG_STR -f $SB_HOME/log/$NAME.log"
done

tail $LOG_STR