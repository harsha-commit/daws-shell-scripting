#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 ... FAILED"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script using super user"
    exit 1
fi

dnfe install mysql -y

VALIDATE $? "Installing MySQL"

dnf install git -y
