#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Aditya Kumar | Course: Open Source Software

# Demonstration of an alias (Commented out as required):
# alias myaudit='./manifesto_gen.sh'

echo "--- Open Source Philosophy Generator ---"
echo "Please answer the following to build your manifesto:"
echo ""

# Capturing user input interactively
read -p "1. Which open-source tool do you rely on most? " TOOL
read -p "2. In one word, what does 'freedom' mean in software? " FREEDOM
read -p "3. What is one project you'd love to build and share? " BUILD

# Formatting the current date
DATE=$(date '+%B %d, %Y')
# Creating a unique filename based on the current system user
OUTPUT="manifesto_$(whoami).txt"

# Composing the paragraph using string concatenation
# We save the username to a variable first to use the uppercase trick
USER_VAR=$(whoami)

# CRITICAL FIX: Use curly braces ${} for variable expansion, not $()
echo "MANIFESTO FOR ${USER_VAR^^}" > "$OUTPUT"
echo "Generated on: $DATE" >> "$OUTPUT"
echo "------------------------------------------" >> "$OUTPUT"

# Building the core statement
echo "I believe that tools like $TOOL are the backbone of modern innovation." >> "$OUTPUT"
echo "To me, open source is defined by $FREEDOM—the right to see, fix, and improve." >> "$OUTPUT"
echo "My goal is to contribute to the community by developing $BUILD" >> "$OUTPUT"
echo "and ensuring it remains free for everyone to use and modify." >> "$OUTPUT"

echo ""
echo "SUCCESS: Your manifesto has been saved to $OUTPUT"
echo "------------------------------------------"

# Displaying the final result to the terminal
cat "$OUTPUT"