#!/bin/bash
# Script: daily_log.sh
TODAY=$(date +"%Y-%m-%d")
mkdir -p logs
echo "Log files created on $TODAY" > logs/$TODAY.log
