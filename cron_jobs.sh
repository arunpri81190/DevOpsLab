#!/bin/bash

SCRIPT_PATH=$1
SCHEDULE=$2
LOG_FILE=$3

if [ -z "$SCRIPT_PATH" ] || [ -z "$SCHEDULE" ]; then
  echo "Usage: $0 <script_path> <cron_schedule> [log_file]"
  exit 1
fi

# ---- Option 1.3: Validate cron schedule ----
FIELD_COUNT=$(echo "$SCHEDULE" | awk '{print NF}')
if [ "$FIELD_COUNT" -ne 5 ]; then
  echo "❌ Invalid cron schedule. Cron must have exactly 5 fields."
  echo "Example: */5 * * * *"
  exit 1
fi

# ---- Option 1.2: Validate script path ----
if [ ! -f "$SCRIPT_PATH" ]; then
  echo "❌ Error: Script file does not exist: $SCRIPT_PATH"
  exit 1
fi

if [ ! -x "$SCRIPT_PATH" ]; then
  echo "⚠️ Script is not executable. Fixing permissions..."
  chmod +x "$SCRIPT_PATH" || {
    echo "❌ Failed to set execute permission"
    exit 1
  }
fi

# Default log file
if [ -z "$LOG_FILE" ]; then
  LOG_FILE="$HOME/cron_logs.txt"
fi

# Escape paths
ESCAPED_SCRIPT=$(printf '%q' "$SCRIPT_PATH")
ESCAPED_LOG=$(printf '%q' "$LOG_FILE")

SCRIPT_NAME=$(basename "$SCRIPT_PATH")
COMMENT_TAG="# DEVOPS_AUTO_CRON: $SCRIPT_NAME"

CRON_CMD="$SCHEDULE bash $ESCAPED_SCRIPT >> $ESCAPED_LOG 2>&1"

# ---- Option 1.1: Prevent duplicate cron job ----
if crontab -l 2>/dev/null | grep -Fq "$CRON_CMD"; then
  echo "⚠️ Cron job already exists. Skipping..."
  exit 0
fi

# ---- Add cron job with comment ----
(
  crontab -l 2>/dev/null
  echo "$COMMENT_TAG"
  echo "$CRON_CMD"
) | crontab -

echo "✅ Cron job added successfully:"
echo "$COMMENT_TAG"
echo "$CRON_CMD"
