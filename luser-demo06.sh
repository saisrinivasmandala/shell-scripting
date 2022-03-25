#!/bin/bash

#Generating a random password for each user entered on the command line

#Dislpay what user typed on the command line

echo "you executed this command: ${0}"

#showing the directory and the filename of the command executed on command line

echo "you used $(dirname ${0}) as the path to the $(basename ${0}) script executed" 

#Showing how many arguments have been passed. Remember argument is the input passed on the command line which wouldn't be equated to anything like a paramater which is equated to a variable inside shell script  

NUMBER_OF_PARAMETERS="${#}"

echo "you supplied ${NUMBER_OF_PARAMETERS} argument(s) on the command line"

#make sure the user executes atleast one command

if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then
 echo "usage: ${0} USER_NAME [USER_NAME]..."
 exit 1
fi 

#Generating and displaying a password for each parameter

for USER_NAME in "${@}"
do 
 PASSWORD=$(date +%s%N | sha256sum | head -c48)
 echo "${USER_NAME} : ${PASSWORD}"
done
