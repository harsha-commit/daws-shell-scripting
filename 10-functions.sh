#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d '.' -f 1)
LOGFILE="/tmp/$SCRIPTNAME-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2...$R FAILED"
        exit 1
    else
        echo "$2...$G SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script using super user"
    exit 1
fi

dnf install mysql -y &>> $LOGFILE
VALIDATE $? "Installing MySQL"

dnf install git -y &>> $LOGFILE
VALIDATE $? "Installing Git"

