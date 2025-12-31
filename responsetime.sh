#!/bin/bash

URL=$1

if [ -z "$URL" ]; then
  echo "Usage: $0 <URL>"
  exit 1
fi

echo "⏱️ Measuring response time for: $URL"

curl -o /dev/null -s -w \
"DNS Lookup     : %{time_namelookup}s\n\
TCP Connect     : %{time_connect}s\n\
TLS Handshake   : %{time_appconnect}s\n\
Server Response : %{time_starttransfer}s\n\
Total Time      : %{time_total}s\n" "$URL"
	
