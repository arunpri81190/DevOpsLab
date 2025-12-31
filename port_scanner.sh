#!/bin/bash

HOST=$1
START_PORT=$2
END_PORT=$3

if [ -z "$HOST" ] || [ -z "$START_PORT" ] || [ -z "$END_PORT" ]; then
  echo "Usage: $0 <host> <start_port> <end_port>"
  exit 1
fi

echo "Scanning $HOST from port $START_PORT to $END_PORT..."

for ((port=START_PORT; port<=END_PORT; port++)); do
  timeout 1 bash -c "echo > /dev/tcp/$HOST/$port" 2>/dev/null &&
    echo "Port $port is OPEN" ||
    echo "Port $port is CLOSED"
done
