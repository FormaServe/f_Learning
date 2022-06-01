#!/usr/bin/env bash

# Initialize the counter
n=1

# Iterate the loop for 5 times
while [ $n -le 5 ]
do
    # Print the value of n in each iteration
    echo "Running $n time"
    
    # Increment the value of n by 1
    (( n++ ))
done


