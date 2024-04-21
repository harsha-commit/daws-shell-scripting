#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d '.' -f 1)
LOGFILE="/tmp/$SCRIPTNAME-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"

if [ $USERID -ne 0 ]
then
    echo "Please run this script as super user"
    exit 1
fi

for i in $@
do
    echo "Package to install: $i"
    dnf list installed $i &>> $LOGFILE

    if [ $? -ne 0 ]
    then
        echo -e "$i already installed...$Y SKIPPED $W"
    else
        echo "$i installation started..."
    fi

done