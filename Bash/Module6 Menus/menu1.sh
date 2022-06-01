#!/QOpenSys/pkgs/bin/bash

# Bash Menu Script Example

clear

echo ""
echo "**********************************************************"
echo "*                                                        *"
echo "*  Welcome to the FormaServe Menu Script Example         *"
echo "*                                                        *"
echo "**********************************************************"
echo ""

# PS3 is a prompt used by “select” inside shell script, great for menus!
PS3='Please enter your choice: '

# set the menu options in an array
options=("Work with Active Jobs" "Display System Status" "Display Disk Status" "Quit")

select opt in "${options[@]}"
do
    case $opt in
        "Work with Active Jobs")
            echo "into option $opt ..."
            system wrkactjob
            ;;
        "Display System Status")
            echo "into option $opt ..."
            system dspsyssts
            ;;
        "Display Disk Status")
            echo "into option $opt ... "
            system wrkdsksts
            ;;
        "Quit")
            echo "Goodbye!"
            break
            ;;
        *) echo "Wrong - $REPLY is not a valid option!";;
    esac
done

