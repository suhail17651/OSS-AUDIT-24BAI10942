#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: suhail | Reg No: 24BAI10942
# Course: Open Source Software
# Purpose: Check if a FOSS package is installed, show its details,
#          and print a philosophy note about it using a case statement

# --- Define the package to inspect ---
PACKAGE="git"

echo "========================================================"
echo "         FOSS Package Inspector                         "
echo "========================================================"
echo ""
echo "  Inspecting package: $PACKAGE"
echo ""

# --- Detect which package manager is available ---
# Different Linux distributions use different package managers
if command -v dpkg &>/dev/null; then
    PKG_MANAGER="dpkg"
elif command -v rpm &>/dev/null; then
    PKG_MANAGER="rpm"
else
    echo "  Could not detect a supported package manager."
    exit 1
fi

# --- Check if the package is installed ---
if [ "$PKG_MANAGER" = "dpkg" ]; then
    # dpkg-based check (Ubuntu, Debian)
    if dpkg -l "$PACKAGE" &>/dev/null; then
        INSTALLED="yes"
        VERSION=$(dpkg -l "$PACKAGE" | grep "^ii" | awk '{print $3}')
    else
        INSTALLED="no"
    fi
else
    # rpm-based check (Fedora, CentOS, RHEL)
    if rpm -q "$PACKAGE" &>/dev/null; then
        INSTALLED="yes"
        VERSION=$(rpm -q "$PACKAGE" --queryformat '%{VERSION}\n')
    else
        INSTALLED="no"
    fi
fi

# --- Display installation status and details ---
if [ "$INSTALLED" = "yes" ]; then
    echo "  Status  : INSTALLED"
    echo "  Version : $VERSION"
    echo ""

    # Show where the main binary is located
    echo "  Binary location:"
    which "$PACKAGE"
    echo ""

    # Show the license of the package if available
    echo "  License info:"
    if [ "$PKG_MANAGER" = "dpkg" ]; then
        # Check the copyright file for license information
        cat /usr/share/doc/"$PACKAGE"/copyright 2>/dev/null | grep -i "license" | head -5
    else
        rpm -qi "$PACKAGE" | grep -E "License|Version|Summary"
    fi
else
    echo "  Status  : NOT INSTALLED"
    echo "  To install on Ubuntu/Debian, run: sudo apt-get install $PACKAGE"
    echo "  To install on Fedora/RHEL, run:  sudo dnf install $PACKAGE"
fi

echo ""
echo "--------------------------------------------------------"
echo "  Philosophy note:"
echo ""

# --- Case statement: print a philosophy note per package ---
# Each case matches a known FOSS package and prints what it represents
case $PACKAGE in
    git)
        echo "  Git: Born from a licensing dispute in 2005, Git proves"
        echo "  that the best response to proprietary failure is to"
        echo "  build something free and give it to the world."
        ;;
    httpd|apache2)
        echo "  Apache: The web server that built the open internet —"
        echo "  powering nearly a third of all websites globally since 1995."
        ;;
    mysql|mariadb)
        echo "  MySQL/MariaDB: Open source at the heart of millions of"
        echo "  applications — a dual-license story of community vs commerce."
        ;;
    firefox)
        echo "  Firefox: A nonprofit browser fighting to keep the web"
        echo "  open, at a time when one company threatened to control it."
        ;;
    vlc)
        echo "  VLC: Built by students in Paris who just wanted to stream"
        echo "  video — proof that the best tools come from real problems."
        ;;
    python3|python)
        echo "  Python: A language shaped entirely by its community —"
        echo "  consensus-driven, open, and built for everyone."
        ;;
    *)
        echo "  $PACKAGE: An open-source tool whose freedom to use,"
        echo "  study, modify, and share reflects the values of the"
        echo "  broader FOSS movement."
        ;;
esac

echo ""
echo "========================================================"
