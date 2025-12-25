#!/bin/bash
THRESHOLD=80
USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "Disk usage is above ${THRESHOLD}%: ${USAGE}%"
else
  echo "Disk usage is normal: ${USAGE}%"
fi
