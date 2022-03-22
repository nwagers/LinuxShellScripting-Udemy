#!/bin/bash

# This script creates an account on the local system.
# You will be prompted for the account name and password.


# Ask for the user name.
read -p 'Enter the username to create: ' USER_NAME

# Ask for the real name.
read -p 'Enter users first and last name seperated by a space: ' COMMENT

# Ask for the password.
read -p 'Enter the users password: ' PASSWORD

# Create the user.
useradd -c "${COMMENT}" -m ${USER_NAME}

# Set the password.
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Force password reset on first login.
passwd -e ${USER_NAME}