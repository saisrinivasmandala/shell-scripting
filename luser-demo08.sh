#/bin/bash

#storing the output of a command to a file

FILE="/tmp/data"

head -n1 /etc/passwd > ${FILE}

echo "content of ${FILE}:"

cat ${FILE}

#redirecting standard ouput to variable and a program 

read LINE < ${FILE}

echo "line contains: ${LINE}"

#redirecting standard output to overwrite the contents of a file

head -n3 /etc/passwd > ${FILE}
echo
echo "contents of ${FILE}: "
cat ${FILE}

#adding content to a file which is not empty

echo
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo
echo "contents of ${FILE}: "
cat ${FILE}

#redirecting STDIN to a program, using FD 0

read LINE 0< ${FILE}
echo
echo "LINE contains: ${LINE}"

#redirecting STDOUT to  a program, using FD 1

head -n3 /etc/passwd 1> ${FILE}
echo
echo "contents of ${FILE}:"
cat ${FILE}

#redirecting STDERR to a file, using FD 2

ERR_FILE="/tmp/data.err"

head -n3 /etc/passwd /fakefile 2> ${ERR_FILE}

#redirecting STDERR and STDOUT to a file

head -n3 /etc/passwd /fakefile &> ${FILE}
echo
echo "contents of ${FILE}:"
cat ${FILE}

#Discarding STDOUT by forwarding output to null file
echo
echo "Discarding STDOUT: "
head -n3 /etc/passwd /fakefile > /dev/null

#Discarding standard error
echo 
echo "Discarding STDERR: "
head -n3 /etc/passwd /fakefile 2> /dev/null

#Discarding STDOUT and STDERR
echo
echo "Discarding  STDOUT and STDERR: "
head -n3 /etc/passwd /fakefile &> /dev/null

#cleaning up filrs after running script and discarding the output

rm ${FILE} ${ERR_FILE} &> /dev/null
