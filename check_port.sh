#!/bin/bash
PORT=$1

if [ -z "$PORT" ]; then
	echo "Usage: $0 <port_number>"
	exit 1
fi

if ss -tuln | grep -q ":$PORT "; then
	echo "Port is open and listening"
else
	echo "Port isn't responding"
fi
