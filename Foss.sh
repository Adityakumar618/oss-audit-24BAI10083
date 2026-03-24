#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Aditya Kumar | Course: Open Source Software

# Defining the target package for the audit
PACKAGE="python3"

# Checking the local package database for an installation record
if dpkg -s $PACKAGE &>/dev/null; then
    echo "CHECK: $PACKAGE is currently installed on this system."
    echo "----------------------------------------------------"
    # Filtering the output to show only version and description info
    dpkg -s $PACKAGE | grep -E '^Version|^Description|^Homepage'
else
    echo "ALERT: $PACKAGE is not installed."
fi

echo ""
echo "--- Package Philosophy & Purpose ---"

# Providing context for various FOSS tools using a case switch
case $PACKAGE in
    python3)
        echo "Python: An versatile language designed for readability and power in automation." ;;
    git)
        echo "Git: The distributed version control system that changed how teams build software." ;;
    vim)
        echo "Vim: A resilient, terminal-based editor that remains a staple for Linux power users." ;;
    curl)
        echo "Curl: A fundamental tool for moving data across the web via the command line." ;;
    *)
        echo "Details for this specific package are not defined in the current script." ;;
esac
echo "----------------------------------------------------"
