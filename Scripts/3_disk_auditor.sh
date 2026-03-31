#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: suhail | Reg No: 24BAI10942
# Course: Open Source Software
# Purpose: Loop through key Linux directories and report
#          permissions, ownership, and disk usage for each

# --- Define the list of directories to audit ---
# These are standard Linux filesystem locations
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/var" "/usr/share")

echo "========================================================"
echo "         Disk and Permission Auditor                    "
echo "========================================================"
echo ""
echo "  Auditing standard Linux system directories..."
echo ""
printf "  %-20s %-25s %-10s\n" "Directory" "Permissions / Owner" "Size"
echo "  ------------------------------------------------------------"

# --- Loop through each directory in the list ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory actually exists on this system
    if [ -d "$DIR" ]; then

        # Extract permissions, owner, and group using ls and awk
        # ls -ld gives a long listing for the directory itself
        # awk pulls fields: $1=permissions, $3=owner, $4=group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # Get disk usage — 2>/dev/null suppresses permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print the result in formatted columns
        printf "  %-20s %-25s %-10s\n" "$DIR" "$PERMS" "$SIZE"

    else
        # Directory does not exist on this system
        printf "  %-20s %s\n" "$DIR" "does not exist on this system"
    fi

done

echo ""
echo "--------------------------------------------------------"
echo "  Git-specific directory check:"
echo ""

# --- Check Git's specific configuration locations ---
# Git stores config in three places — system, global, and local

# System-wide Git config
GIT_SYSTEM_CONFIG="/etc/gitconfig"
if [ -f "$GIT_SYSTEM_CONFIG" ]; then
    PERMS=$(ls -l "$GIT_SYSTEM_CONFIG" | awk '{print $1, $3, $4}')
    echo "  System config  : $GIT_SYSTEM_CONFIG"
    echo "  Permissions    : $PERMS"
else
    echo "  System config  : $GIT_SYSTEM_CONFIG (not present — default)"
fi

echo ""

# User-level global Git config
GIT_GLOBAL_CONFIG="$HOME/.gitconfig"
if [ -f "$GIT_GLOBAL_CONFIG" ]; then
    PERMS=$(ls -l "$GIT_GLOBAL_CONFIG" | awk '{print $1, $3, $4}')
    echo "  User config    : $GIT_GLOBAL_CONFIG"
    echo "  Permissions    : $PERMS"
else
    echo "  User config    : $GIT_GLOBAL_CONFIG (not configured yet)"
fi

echo ""

# Check if git binary exists and show its permissions
GIT_BINARY=$(which git 2>/dev/null)
if [ -n "$GIT_BINARY" ]; then
    PERMS=$(ls -l "$GIT_BINARY" | awk '{print $1, $3, $4}')
    echo "  Git binary     : $GIT_BINARY"
    echo "  Permissions    : $PERMS"
fi

echo ""
echo "========================================================"
