#!/bin/bash

#printing the UID from predefined UID variable

echo "The UID is ${UID}"

#Assigning the username to a variable and printing it

USER_NAME=$(id -un)

echo "The username is ${USER_NAME}"

#Writing and example if-else statement to see if the user is root or not

if [[ "${UID}" -eq 0 ]]
then
 echo 'you are root'
else
 echo 'you are not root'
fi
