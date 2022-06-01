#!/usr/bin/env bash

# Dont worry about case sensitivity when checking user input
shopt -s nocasematch

# get user input month name
echo "Enter name of the month"
read month

# check what is going on for that month
case $month in
    January)
        echo " 3rd January is a Bank Holiday in the UK."
    ;;
    April)
        echo "Easter Holidays start on the 15th April."
    ;;
    May)
        echo "May Day is the 2nd May."
        echo "Queens Jublilee Day is the 3rd May."
    ;;
    August)
        echo "Summer Bank Holiday is 28 August"
    ;;
    November)
        echo "2022 World Cup Begins"
    ;;
    December)
        echo "Its Christmas!"
    ;;
    *)
        echo "Nothing going on in this month!"
    ;;
esac







