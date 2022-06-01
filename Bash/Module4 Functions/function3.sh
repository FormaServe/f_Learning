#!/QOpenSys/pkgs/bin/bash

##  add all numbers passed as arguments
##  to the variable sum
function sum_numbers() {
    sum=0
    for i in $@
    do
        sum=$((sum+i))
    done
    echo "The sum of the numbers is $sum"
}

sum_numbers 1 2 3 4 5















