#I/bin/bash

# This script generates a random password for each user specificied on the command line.

# Display what the user type on the command line.

# Variable vs Paramater

echo "You execute this command: ${0}" 

# Display the path and filename of the script.
echo "You used $(dirname ${0}) as the path to the $(basename ${0}) script."

# Tell user how many arguments they've past in.
# (Inside the script they are parameters, outside they are arguments.)
NUMBER_OF_PARAMETERS="${#}"
echo "You supplied ${NUMBER_OF_PARAMETERS} arguments(s) on the command line."

# Make sure they at least supply one argument.
if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then
    echo "Usag: ${0} USER_NAME [USER_NAME]..."
    exit 1
fi    