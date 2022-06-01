#!/usr/bin/env bash

# initialise counter
counter=0

# loop until condition is true
until [ $counter -gt 5 ]
do
    # what is counter?
    echo Counter: $counter

    # increment counter
    ((counter++))
done










