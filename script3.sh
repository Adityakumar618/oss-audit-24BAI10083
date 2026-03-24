#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Aditya Kumar | Course: Open Source Software

# Defining a list of critical system paths to inspect
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")
# Specific path for my software's system footprint
PYTHON_PATH="/usr/lib/python3"

echo "Directory Audit Report"
echo "------------------------------------------------------------"
echo "Path => [Permissions | Owner | Group] | Size"
echo "------------------------------------------------------------"

# Iterating through the directories using a for loop
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extracting specific columns for permissions and ownership using awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # Getting the total disk usage in a human-readable format
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        echo "$DIR => [ $PERMS ] | $SIZE"
    else
        echo "NOTICE: $DIR does not exist on this environment."
    fi
done

echo "------------------------------------------------------------"
echo "Checking Python Config/Library Footprint..."

# Verifying the footprint of the chosen software
if [ -d "$PYTHON_PATH" ]; then
    PY_PERMS=$(ls -ld "$PYTHON_PATH" | awk '{print $1, $3, $4}')
    PY_SIZE=$(du -sh "$PYTHON_PATH" 2>/dev/null | cut -f1)
    echo "Python Path: $PYTHON_PATH => [ $PY_PERMS ] | $PY_SIZE"
else
    echo "Python directory not found at $PYTHON_PATH"
fi
echo "------------------------------------------------------------"
