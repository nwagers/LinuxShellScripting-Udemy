#!/bin/bash

# This script displays various information to the screen.

# Diplay the text below.

echo 'Remember that you can use the MAN feature in linux to look at what other built in features do.'
echo 'Remember to chmod 755 any file or script you wish to modify and run.'

# Display UID and Username of the user executing this script.

# Display UID
echo "Your UID is ${UID}"

# Display username
#USER_NAME='id -un' - this is an older style of doing it, but it does work.
USER_NAME=$(id -un)


echo "Your username is ${USER_NAME}"

# Display if the user is the root user or not.

if [[ "${UID}" -eq 0 ]]
then
	echo 'You are root!'
else
	echo 'You are not root!'
fi

echo 'Lets learn more about the if statement.'
echo "enter 'type -a if' and it will show us that 'if' is a shell keyword."
echo "this means you can get help on it using 'help if'"
echo "remember that ';' is the command seperater"

