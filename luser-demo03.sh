#!/bin/bash

#Display the UID of current user

echo "The UID of current user is ${UID}"

#comparing a predefined UID variable with UID of current user

UID_TO_TEST='1000'

if [[ "${UID}" -ne "${UID_TO_TEST}" ]]
then
 echo "your UID doesnot match ${UID_TO_TEST}"
 exit 1
fi

#writing few script lines to highlight the importance of "${?}"

USER_NAME=$(id -un)

if [[ "${?}" -ne 0 ]]
then
 echo 'The command equated to USER_NAME did not execute succesfully'
exit 1
fi

#Using a string to test conditional

USER_NAME_TO_TEST='vagrant'

if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST}" ]]
then
 echo "your username matches ${USER_NAME_TO_TEST}"
fi

#Testing inequality condition using a string

if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST}" ]]
then
 echo "your username does not match ${USER_NAME_TO_TEST}"
exit 1
fi

#This is an indicator that our script completed succesfully

exit 0 
