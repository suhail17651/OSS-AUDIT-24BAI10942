#!/bin/bash
# Script 4: Log File Analyzer
# Author: suhail | Reg No: 24BAI10942
# Course: Open Source Software
# Purpose: Read a log file line by line, count occurrences of a
#          keyword, and print a summary with the last 5 matches
# Usage: ./script4_log_analyzer.sh /var/log/syslog error

# --- Accept command-line arguments ---
LOGFILE=$1               # First argument: path to the log file
KEYWORD=${2:-"error"}    # Second argument: keyword to search for
                         # Defaults to "error" if not provided

# --- Validate that the log file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo ""
    echo "  Error: File '$LOGFILE' not found."
    echo "  Usage: ./script4_log_analyzer.sh /path/to/logfile [keyword]"
    echo "  Example: ./script4_log_analyzer.sh /var/log/syslog error"
    echo ""
    exit 1
fi

echo "========================================================"
echo "         Log File Analyzer                              "
echo "========================================================"
echo ""
echo "  Log file : $LOGFILE"
echo "  Keyword  : $KEYWORD"
echo ""

# --- Initialise the counter variable ---
COUNT=0

# --- Read the log file line by line ---
# IFS= preserves leading/trailing whitespace in each line
# -r prevents backslash from being treated as escape character
while IFS= read -r LINE; do

    # Check if this line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        # Increment the counter each time the keyword is found
        COUNT=$((COUNT + 1))
    fi

done < "$LOGFILE"     # Redirect the file into the while loop

# --- Print the count result ---
echo "  Result: Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""

# --- Retry mechanism: if nothing found, try a broader search ---
# This demonstrates a do-while style retry pattern in bash
if [ "$COUNT" -eq 0 ]; then
    echo "  No matches found for '$KEYWORD'."
    echo "  Retrying with broader keyword: 'warn'..."
    echo ""

    RETRY_COUNT=0
    RETRY_KEYWORD="warn"

    while IFS= read -r LINE; do
        if echo "$LINE" | grep -iq "$RETRY_KEYWORD"; then
            RETRY_COUNT=$((RETRY_COUNT + 1))
        fi
    done < "$LOGFILE"

    echo "  Retry result: '$RETRY_KEYWORD' found $RETRY_COUNT time(s)"
    echo ""
fi

# --- Print the last 5 lines that matched the keyword ---
echo "--------------------------------------------------------"
echo "  Last 5 lines containing '$KEYWORD':"
echo ""

# grep -i for case-insensitive search, tail -5 for last 5 matches
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

if [ -n "$MATCHES" ]; then
    # Print each matching line with indentation
    echo "$MATCHES" | while IFS= read -r LINE; do
        echo "  $LINE"
    done
else
    echo "  No matching lines to display."
fi

echo ""
echo "========================================================"
