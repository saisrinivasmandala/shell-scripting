#!/bin/bash

#should check if the executor has root privilege

if [[ "${UID}" -ne 0 ]]
then
 echo 'you are not root user'
exit 1
fi

#Asking for username

read -p 'Enter the username to create: ' USER_NAME

#Asking for full name of the user to be created

read -p 'Enter he fullname of person who this account is for: ' FULL_NAME

#Asking for a password to this account

read -p 'Enter the password of your choice: ' PASSWORD

#creating the user

useradd -c "${COMMENT}" -m ${USER_NAME}

#checking if useradd command is executed or not

if [[ "${?}" -ne 0 ]]
then
 echo 'useradd command did not execute fruitfully'
exit 1
fi

#creating a password for the user

echo ${PASSWORD} | passwd --stdin ${USER_NAME}

#checking if passwd command is executed or not

if [[ "${?}" -ne 0 ]]
then 
 echo 'passwd command did not execute fruitfully'
exit 1
fi

#prompting the user to ask for a new password after first login

passwd -e ${USER_NAME}

#Displaying the username, password, and the host where the user was created

echo "This is the new username ${USER_NAME}"

echo "This is the password ${PASSWORD} for user ${USER_NAME}"

echo "This is the hostname ${HOSTNAME} where user ${USER_NAME} was created"

exit 0

