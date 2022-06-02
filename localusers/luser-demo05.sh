#!/bin/bash

# remember chmod 755 {fileName}

# This script generates random passwords

# Random number as a password
# man bash - /RANDOM - Each time this parameter is referenced, a random integer between 0 and 32767 is generated.
PASSWORD=${RANDOM}
echo "Random Number Password: ${PASSWORD}"
echo ""

# Three random number password
PASSWORD=${RANDOM}${RANDOM}${RANDOM}
echo "Triple random number gen password: ${PASSWORD}"
echo ""

# Use current date/time to generate password
# man date - /format
# $(command) - this will assign the contents of the command inside the () and assign it to the variable.
PASSWORD=$(date +%s)
echo "date in seconds: ${PASSWORD}"
echo ""

# User date and nanoseconds 
PASSWORD=$(date +%s%N)
echo "Date with seconds and nanoseconds password: ${PASSWORD}"
echo ""

# Generate password using date in seconds and sha256sum
PASSWORD=$(date +%s | sha256sum)
echo "Date/Seconds + sha256sum password:  ${PASSWORD}"
echo ""

# Generate password using date in seconds+nano and sha256sum
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "Date/Seconds + nanoseconds + sha256sum password:  ${PASSWORD}"

# Append a special character to the password.
echo "Password with special character appended."
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_-+=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"

echo ""
echo ""