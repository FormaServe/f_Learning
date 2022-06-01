#!/usr/bin/env bash

if [ ! $1 ]
then
    echo "You havent told me which number to check"
    exit -1
fi

number=$1

if [ $number -gt 50 ]
then
    echo "Number is greater than 50"
elif [ $number -eq 50 ]
then
    echo "Number is equal to 50"
else
    echo "Number is less than 50"
fi



