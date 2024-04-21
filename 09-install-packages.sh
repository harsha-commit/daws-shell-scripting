#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then
    echo "Please run this script using super user"
    exit 1
fi

dnf install mysql -y

if [$? -eq 0]
then
    echo "Installation of mysql ... SUCCESS"
else
    echo "Installation of mysql ... FAILED"
fi

dnf install git -y

if [$? -eq 0]
then
    echo "Installation of git ... SUCCESS"
else
    echo "Installation of git ... FAILED"
fi