#!/bin/bash

#Generating a random number

PASSWORD="${RANDOM}"

echo "${PASSWORD}"

#Generating bigger password with three RANDOM commands

PASSWORD="${RANDOM}${RANDOM}${RANDOM}"

echo "${PASSWORD}"

#using date command and generating how many seconds have passed from epoch time

PASSWORD=$(date +%s)

echo "${PASSWORD}"

#adding nanoseconds to epoch seconds generated by date command

PASSWORD=$(date +%s%N)

echo "${PASSWORD}"

#using shaw256sum hexadecimal geneartor and head commands to generate a 32 count hexadecimal password

PASSWORD=$(date +%s%N | sha256sum | head -c32)

echo "${PASSWORD}"

#generating a better password by using two RANDOM commands 

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)

echo "${PASSWORD}"

#Appending a special character to password

SPECIAL_CHARACTER=$(echo '!£$%&?^/*+@' | fold -w1 | shuf | head -c1)

echo "${PASSWORD}${SPECIAL_CHARACTER}"