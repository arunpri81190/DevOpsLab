#!/bin/bash

URL=$1

if [ -z "$URL" ]; then
  echo "Usage: $0 <URL>"
  exit 1
fi

STATUS=$(curl -s -L -o /dev/null -w "%{http_code}" "$URL")

echo "🔍 HTTP Status for $URL: $STATUS"

case $STATUS in
  200) echo "✅ OK – The request was successful." ;;
  301|302) echo "➡️ Redirect – The resource has moved." ;;
  400) echo "⚠️ Bad Request – The request was invalid." ;;
  401) echo "🔒 Unauthorized – Authentication required." ;;
  403) echo "🚫 Forbidden – Access denied." ;;
  404) echo "❌ Not Found – The resource doesn't exist." ;;
  500) echo "💥 Server Error – Something went wrong on the server." ;;
  *) echo "ℹ️ Other status – Check the URL or server." ;;
esac
