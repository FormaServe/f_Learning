#!/usr/bin/env bash

# Initialise variables
i=0

# a simple while loop using i as the counter
while [[ $i -lt 10 ]]; do

    ((i++))

    # we up to 5 yet?
    if [[ "$i" == "5" ]]; then
        continue
    fi

    echo "Counter is: $i"

done







