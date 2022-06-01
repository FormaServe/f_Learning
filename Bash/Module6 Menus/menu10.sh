#!/QOpenSys/pkgs/bin/bash

# Bash Menu Script Example using Dialog

# set dialog constants
DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

# function to display results in a dialog message box
display_result() {
    dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}

while true; do
    exec 3>&1
    selection=$(dialog \
        --backtitle "IBM i System Information" \
        --title " Galatea " \
        --clear \
        --cancel-label "Exit" \
        --menu "Please select:" $HEIGHT $WIDTH 4 \
        "1" "Work with Active Jobs" \
        "2" "Display System Status" \
        "3" "Display Disk Status" \
    2>&1 1>&3)
    exit_status=$?
    exec 3>&-
    case $exit_status in
        $DIALOG_CANCEL)
            clear
            echo "Program terminated."
            exit
        ;;
        $DIALOG_ESC)
            clear
            echo "Program aborted." >&2
            exit 1
        ;;
    esac
    case $selection in
        1 )
            result=$(system "wrkactjob sbs(qinter)")
            display_result " Active Jobs on $HOSTNAME "
        ;;
        2 )
            result=$(system dspsyssts)
            display_result " System Status on $HOSTNAME "
        ;;
        3 )
            result=$(system wrkdsksts)
            display_result "Disk Status on $HOSTNAME "
        ;;
    esac
done
