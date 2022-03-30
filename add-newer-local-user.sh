#!/bin/bash

#should check if the executor has root privilege

if [[ "${UID}" -ne 0 ]]
then
 echo 'you are not root user' >&2
 exit 1
fi

#enforcing the users to atleast enter one argunment

NUMBER_OF_PARAMETERS="${#}"


if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then
 echo "usage: ${0} USER_NAME [USER_NAME]..." >&2
 exit 1
fi 

#generating username and comments related to that username

USER_NAME="${1}"

# The rest of the parameters are for the account comments.
shift
COMMENT="${@}"

#Generating a password

PASSWORD=$(date +%s%N | sha256sum | head -c48)

#Creating a user with password

useradd -c "${COMMENT}" -m ${USER_NAME} &> /dev/null

if [[ "${?}" -ne 0 ]]
then
  echo "useradd command did not execute fruitfully" >&2
  exit 1
fi

echo ${PASSWORD} | passwd --stdin ${USER_NAME} &> /dev/null

#check if passwd command is a suucess

if [[ "${?}" -ne 0 ]]
then 
 echo "passwd command did not execute fruitfully"  >&2
 exit 1
fi

#Force changing the password during the first login

passwd -e ${USER_NAME}  &> /dev/null

#Displaying the username, password and host where the user was created
echo 'username: '
echo
echo "${USER_NAME}"
echo
echo 'password: '
echo "${PASSWORD}"
echo  
echo 'Hostname: '
echo "${HOSTNAME}"
exit 0

