#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./log_analyzer.sh [filename] [keyword]
# Author: Aditya Kumar | Course: Open Source Software

LOGFILE=$1
KEYWORD=${2:-"error"}  # If no keyword is provided, it defaults to 'error'
COUNT=0

# Ensuring the user actually provided a file path
if [ -z "$LOGFILE" ]; then
    echo "Usage error: Please provide a log file path."
    echo "Example: ./log_analyzer.sh /var/log/syslog python"
    exit 1
fi

# Logic to handle missing or empty files
until [ -s "$LOGFILE" ]; do
    echo "WAIT: $LOGFILE is currently empty or missing. Checking again..."
    sleep 2
    # This prevents an infinite loop if the file really isn't there
    if [ ! -f "$LOGFILE" ]; then
        echo "Error: File $LOGFILE does not exist. Exiting."
        exit 1
    fi
done

echo "Starting analysis of $LOGFILE for keyword: '$KEYWORD'..."

# Reading the file line by line
while IFS= read -r LINE; do
    # Using grep -iq to search (case-insensitive and quiet)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        ((COUNT++))
    fi
done < "$LOGFILE"

echo "----------------------------------------------------"
echo "SUMMARY REPORT"
echo "Keyword '$KEYWORD' was found $COUNT times in $LOGFILE."
echo "----------------------------------------------------"

# Showing the most recent 5 occurrences for quick context
if [ $COUNT -gt 0 ]; then
    echo "Last 5 matching entries:"
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
else
    echo "No matching entries found to display."
fi
echo "----------------------------------------------------"
