#!/bin/bash

#Hello from the main os

#printing Hello with echo

echo 'Hello'

#assigning a string to a variable

WORD='script'

#calling the word variable and printing it

echo "$WORD"

#combining variables and text to print the result

echo "This is a Shell $WORD"

#Another way of combining variable and hardcoded text

echo "This is a Shell ${WORD}"

#Appending a text to a variable

echo "${WORD}ing is fun!"

ending='ed'

#Appending two variables and printing

echo "${WORD}${ending}"

ending='ing'

#changing an already defined variable. This process is called reassignment 

echo "${WORD}${ending} is fun!" 
