#!/bin/bash

# --- 1. Help Feature (Command Line Arguments) ---
# $1 represents the first word typed after the script name
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: ./sysinfo.sh"
    echo "This tool provides a menu-driven interface to view system statistics"
    echo "including OS info, disk usage, logged-in users, and top processes."
    exit 0
fi

# --- Function for Formatting Headers ---
# This makes it easier to add timestamps and borders to every section
print_header() {
    local title=$1
    echo "========================================="
    echo "  $title"
    echo "  Generated on: $(date)"
    echo "========================================="
}

# --- Main Menu Loop ---
while true; do
    echo ""
    echo "Welcome, select one of the following options using the number keys:"
    echo "1: Show System Info"
    echo "2: Show Disk Usage"
    echo "3: Show Current Users"
    echo "4: Show Top Processes"
    echo "5: Exit"
    echo ""

    read -p "Selection: " choice

    case $choice in
        1)
            print_header "SYSTEM INFO"
            hostnamectl | grep -E "Static hostname|Operating System|Kernel"
            uptime -p
            ;;
        2)
            print_header "DISK USAGE"
            df -h --total | grep -E "Filesystem|total"
            ;;
        3)
            print_header "CURRENT USERS"
            w
            ;;
        4)
            print_header "TOP 5 PROCESSES (BY CPU)"
            # ps command flags:
            # -e (all processes), -o (custom output format)
            # --sort=-pcpu (sort by CPU descending)
            echo "+------+-------+--------+-------------+"
            echo "| PID  | User  | CPU%   | Command     |"
            echo "+------+-------+--------+-------------+"
            ps -eo pid,user,pcpu,comm --sort=-pcpu | head -n 6 | tail -n 5 | awk '{printf "| %-4s | %-5s | %-6s | %-11s |\n", $1, $2, $3, $4}'
            echo "+------+-------+--------+-------------+"
            ;;
        5)
            echo "Exiting. Goodbye!"
            break
            ;;
        *)
            echo "Invalid selection. Please choose 1-5."
            ;;
    esac

    echo ""
    read -p "Press Enter to return to menu..."
done


