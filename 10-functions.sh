#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d '.' -f 1)
LOGFILE="/tmp/$SCRIPTNAME.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2...FAILED"
        exit 1
    else
        echo "$2...SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script using super user"
    exit 1
fi

dnf install mysql -y

VALIDATE $? "Installing MySQL"

dnf install git -y

VALIDATE $? "Installing Git"

