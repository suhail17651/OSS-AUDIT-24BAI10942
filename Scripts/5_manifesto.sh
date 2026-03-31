#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: suhail | Reg No: 24BAI10942
# Course: Open Source Software
# Purpose: Ask the user three questions interactively and generate
#          a personalised open source philosophy statement,
#          then save it to a .txt file

# --- Alias concept (demonstrated via comment) ---
# In a live shell session you could define:
#   alias generate='./script5_manifesto.sh'
# This would let you run the script by typing just: generate
# Aliases are shortcuts — they map a short command to a longer one.
# They are defined in ~/.bashrc to persist across sessions.

echo "========================================================"
echo "         Open Source Manifesto Generator                "
echo "========================================================"
echo ""
echo "  Answer three questions to generate your manifesto."
echo "  There are no wrong answers — this is your statement."
echo ""

# --- Read user input interactively ---
# -p flag displays the prompt on the same line as the input cursor
read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
echo ""
read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

# --- Generate date stamp for the manifesto ---
DATE=$(date '+%d %B %Y')

# --- Define the output filename using the current username ---
# $(whoami) returns the logged-in username — makes each file unique
OUTPUT="manifesto_$(whoami).txt"

# --- Compose and write the manifesto to the file ---
# > creates the file (or overwrites it if it already exists)
# >> appends to the file without overwriting

echo "========================================================"   >  "$OUTPUT"
echo "  My Open Source Manifesto                              "   >> "$OUTPUT"
echo "  Generated on: $DATE                                   "   >> "$OUTPUT"
echo "========================================================"   >> "$OUTPUT"
echo ""                                                            >> "$OUTPUT"

# --- The manifesto paragraph — built from the user's three answers ---
# String concatenation in bash is done by placing variables
# directly inside double-quoted strings
echo "  Every day, I rely on $TOOL — a tool I did not pay for," >> "$OUTPUT"
echo "  did not have to ask permission to use, and could modify" >> "$OUTPUT"
echo "  if I ever needed to. That is not an accident. It is the" >> "$OUTPUT"
echo "  result of a deliberate choice made by its creators to"   >> "$OUTPUT"
echo "  share their work freely with the world."                 >> "$OUTPUT"
echo ""                                                           >> "$OUTPUT"
echo "  To me, freedom in software means $FREEDOM. Not freedom"  >> "$OUTPUT"
echo "  as a marketing word, but as a legal guarantee — the"    >> "$OUTPUT"
echo "  right to run, study, change, and share. The difference"  >> "$OUTPUT"
echo "  between software that respects this and software that"   >> "$OUTPUT"
echo "  does not is the difference between a tool you own and"   >> "$OUTPUT"
echo "  a service you are permitted to use until further notice." >> "$OUTPUT"
echo ""                                                           >> "$OUTPUT"
echo "  If I could build one thing and give it away, it would"   >> "$OUTPUT"
echo "  be $BUILD. Not because I would not want credit, but"     >> "$OUTPUT"
echo "  because the most durable things in software — Linux,"    >> "$OUTPUT"
echo "  Git, the web itself — were built by people who cared"    >> "$OUTPUT"
echo "  more about the problem than about owning the solution."  >> "$OUTPUT"
echo ""                                                           >> "$OUTPUT"
echo "  That is what open source means to me."                   >> "$OUTPUT"
echo ""                                                           >> "$OUTPUT"
echo "========================================================"   >> "$OUTPUT"

# --- Confirm the file was saved ---
echo "  Manifesto saved to: $OUTPUT"
echo ""

# --- Display the contents of the saved file ---
echo "  Here is your manifesto:"
echo ""
cat "$OUTPUT"
