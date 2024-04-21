#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "Exit status: $1"
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script using super user"
    exit 1
fi

dnf install mysql -y

VALIDATE $? "Installing MySQL"

dnf install git -y
