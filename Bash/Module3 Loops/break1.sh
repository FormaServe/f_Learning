#!/usr/bin/env bash

i=0

while [[ $i -lt 5 ]]
do
# what number we on?
  echo "Number: $i"

  # increment the loop counter
  ((i++))

  # quit out of loop if counter is 3
  if [[ $i -eq 3 ]]; then
    break
  fi

done

# let everyone know we are done
echo "That's all for now!"







