#!/bin/bash

# Display the UID and username of the user execuiting this script.
# Display if the user is the vagrant user or not.


# Display the UID.
echo "Your UID is ${UID}"

# Only display if the UID does NOT match 1000.
UID_TEST='1000'

if [[ "${UID}" -ne "${UID_TEST}" ]]
then
    echo "Your UID does not match ${UID_TEST}."
    exit 1
fi
# Display the username.
USERNAME=$(id -un)

# Test if the command succeeded.
if [[ "${?}" -ne 0 ]]
then
    echo "The id command did not execute succesfully."
    exit 1
fi
echo "Your username is ${USERNAME}"

# You can use a string test conditional.
USERNAME_TEST='vagrant'
if [[ "${USERNAME}" = "${USERNAME_TEST}" ]]
then 
    echo "Your username matches ${USERNAME_TEST}."
fi

# Test for != (not equal) for the string.
if [[ "$USERNAME" != "$USERNAME_TEST}" ]]
then
    echo "Your username does not match ${USERNAME_TEST}."
    exit 1
fi

exit 0