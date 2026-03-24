#!/bin/bash
# Script 1: System Identity Report
# Author: [Your Name] | Course: Open Source Software

# --- Variables ---
STUDENT_NAME="[Aditya Kumar]"         # Replacing with actual name
SOFTWARE_CHOICE="Python"           # Based on Open Source Audit choice

# --- System info ---
# Using command substitution $( ) to capture system data
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
DATE_TIME=$(date '+%A, %B %d, %Y | %H:%M:%S')

# This command pulls the 'Pretty Name' of the Linux distro from the OS release file
DISTRO=$(grep "PRETTY_NAME" /etc/os-release | cut -d'=' -f2 | tr -d '"')

# --- Display ---
echo "=========================================="
echo "  Open Source Audit - $STUDENT_NAME"
echo "  Project Focus: $SOFTWARE_CHOICE"
echo "=========================================="
echo "OS Distribution : $DISTRO"
echo "Kernel Version  : $KERNEL"
echo "Current User    : $USER_NAME"
echo "Home Directory  : $HOME_DIR"
echo "System Uptime   : $UPTIME"
echo "Current Date    : $DATE_TIME"
echo "------------------------------------------"
echo "LICENSE MESSAGE:"
echo "This operating system is comprised of free software"
echo "licensed under the GNU General Public License (GPL)."
echo "=========================================="
