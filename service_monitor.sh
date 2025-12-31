#!/bin/bash

SERVICE=$1

if [ -z "$SERVICE" ]; then
	echo "Usage : $0 <service_name>"
	exit 1
fi

STATUS=$(systemctl is-active "$SERVICE" 2>/dev/null)

if [ "$STATUS" = "active" ]; then
	echo "Service '$SERVICE' is running"
elif [ "$STATUS" = "inactive" ]; then
	echo "Service '$SERVICE' is stopped"
elif [ "$STATUS" = "unknown" ]; then
	echo "Service '$SERVICE' is not found"
else
	echo "Service '$SERVICE' status : $STATUS"
fi
