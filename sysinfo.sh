#!/bin/bash

# --- The Loop ---
# This 'while true' loop ensures the menu returns after every command
while true; do
    echo "-------------------------------------"
    echo "   SYSTEM INFORMATION TOOL - V2.0    "
    echo "-------------------------------------"
    echo "1: Show System Info"
    echo "2: Show Disk Usage"
    echo "3: Show Current Users"
    echo "4: Exit"
    echo "-------------------------------------"

    read -p "Enter your choice [1-4]: " choice

    if [ "$choice" == "1" ]; then
        echo "--- OS & System Info ---"
        uname -a               # Kernel version and OS details
        hostnamectl            # Detailed OS name and hostname
        uptime -p              # How long the system has been running
        
    elif [ "$choice" == "2" ]; then
        echo "--- Disk Usage ---"
        # -h makes it human-readable (GB/MB instead of bytes)
        df -h
        
    elif [ "$choice" == "3" ]; then
        echo "--- Current Users & Activity ---"
        # 'w' shows who is logged in and what they are doing
        w
        
    elif [ "$choice" == "4" ]; then
        echo "Exiting. Goodbye!"
        break                  # 'break' exits the while loop
    else
        echo "Invalid selection, please try again."
    fi

    # Optional: Pause before the menu clears/reappears
    read -p "Press Enter to return to the menu..."
done


