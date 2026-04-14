#!/bin/bash

# Title
echo "=============================="
echo "   System Information Tool"
echo "=============================="
echo "Welcome, select one of the following options using the number keys:"
echo "1: Show System Info"
echo "2: Show Disk Usage"
echo "3: Show Current Users"
echo "4: Exit"

# Prompt for input
read -p "Enter choice [1-4]: " choice

# Menu handling
if [ "$choice" == "1" ]; then
    echo "You selected Option 1: System Info"
elif [ "$choice" == "2" ]; then
    echo "You selected Option 2: Disk Usage"
elif [ "$choice" == "3" ]; then
    echo "You selected Option 3: Current Users"
elif [ "$choice" == "4" ]; then
    echo "Exiting..."
    exit 0
else
    echo "Invalid option, please run again."
fi


