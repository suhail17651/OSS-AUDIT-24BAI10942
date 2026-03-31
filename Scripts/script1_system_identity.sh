#!/bin/bash
# Script 1: System Identity Report
# Author: Hardik Gaur | Reg No: 24BAI10484
# Course: Open Source Software
# Purpose: Display a welcome screen showing key system information

# --- Student details ---
STUDENT_NAME="Suhailr"
REG_NO="24BAI10942"
SOFTWARE_CHOICE="Git"

# --- Collect system information using command substitution ---
KERNEL=$(uname -r)               # Kernel version
USER_NAME=$(whoami)              # Currently logged-in user
HOME_DIR=$HOME                   # Home directory of current user
UPTIME=$(uptime -p)              # Human-readable uptime
DATETIME=$(date '+%d %B %Y, %H:%M:%S')   # Current date and time
DISTRO=$(lsb_release -d | cut -f2)       # Linux distribution name

# --- Display the system identity report ---
echo "========================================================"
echo "         Open Source Audit — System Identity Report     "
echo "========================================================"
echo ""
echo "  Student     : $STUDENT_NAME"
echo "  Reg No      : $REG_NO"
echo "  Software    : $SOFTWARE_CHOICE"
echo ""
echo "--------------------------------------------------------"
echo "  Distribution: $DISTRO"
echo "  Kernel      : $KERNEL"
echo "  User        : $USER_NAME"
echo "  Home Dir    : $HOME_DIR"
echo "  Uptime      : $UPTIME"
echo "  Date/Time   : $DATETIME"
echo "--------------------------------------------------------"
echo ""

# --- Print the license message for the OS ---
# Linux is licensed under GPL v2, the same license as Git
echo "  License Note:"
echo "  The Linux kernel running this system is licensed"
echo "  under the GNU General Public License version 2"
echo "  (GPL v2) — the same license that covers Git."
echo "  This means the OS source code is free to read,"
echo "  modify, and redistribute by anyone in the world."
echo ""
echo "========================================================"
