#!/bin/bash

echo "All variables: $@"
echo "Total number of variable: $#"
echo "Current Script Name: $0"
echo "Current Working Directory: $PWD"
echo "Home Directory of the user: $HOME"
echo "Current User: $USER"
echo "Hostname: $HOSTNAME"
echo "Process ID of the current shell: $$"
sleep 2 &
echo "Process ID of the last background process: $!"
echo "Exit Status (0 -> SUCCESS, ~0 -> FAILED): $?"