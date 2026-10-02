#!/bin/bash

# Kyiv Temperature Monitor Script
# Logs temperature every 30 minutes and commits to git

REPO_DIR="$(dirname "$0")"
LOG_FILE="$REPO_DIR/temperature_log.csv"
INTERVAL=1800  # 30 minutes in seconds

# Ensure log file exists with header
if [ ! -f "$LOG_FILE" ]; then
    echo "timestamp,temperature" > "$LOG_FILE"
fi

# Function to get temperature from wttr.in
get_temperature() {
    # Using wttr.in with format that returns just temperature (e.g., "+12°C")
    curl -s "wttr.in/Kyiv?format=%t" 2>/dev/null
}

# Main loop
while true; do
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    TEMP=$(get_temperature)

    if [ -n "$TEMP" ]; then
        # Append to log file
        echo "$TIMESTAMP,$TEMP" >> "$LOG_FILE"

        # Git operations
        cd "$REPO_DIR"
        git add "$LOG_FILE"
        git commit -m "Temperature log update: $TIMESTAMP ($TEMP)"
        echo "[$TIMESTAMP] Logged temperature: $TEMP"
    else
        echo "[$TIMESTAMP] Failed to retrieve temperature"
    fi

    # Sleep for the interval
    sleep $INTERVAL
done