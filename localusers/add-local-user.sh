#!/bin/bash

# Verify that root user is executing
# If not root user, exit 1
if [[ ${UID} != 0 ]]
then
    echo "User does not have permissions to create new users."
    echo "Please use super user to create new users."
    exit 1
fi

# Prompt for username(login), users name (comment), initial password (password)
read -p 'Enter new user username: ' USER_NAME

# Test if username already exists.
getent passwd $USER_NAME > /dev/null
if [ $? -eq 0 ]
then
    echo "That username is already in use."
    exit 1
fi

# Prompt for user first and last name.
read -p 'Enter new user first and last name seperated by a space: ' COMMENT
# Prompt for password.
read -s -p 'Enter new user temporary password: ' PASSWORD

# Create username
useradd -c "${COMMENT}" -m ${USER_NAME}
# Test username creation
if [ $? -eq 0 ]
then
    echo "Username ${USER_NAME} created."
else
    echo "User was not created for some reason."
    echo "Exit status: ${?}"
    exit 1
fi

# Create password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}
# Test password

# Force password reset on next login
passwd -e ${USER_NAME}


# Informs the user if the account was not created for any reason.
# If not created, exit 1

# Displays username, password, and host where account was created.
echo "Username: ${USER_NAME}"
echo "Temp Password: ${PASSWORD}"
echo "Hostname: ${HOSTNAME}"