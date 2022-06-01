#!/QOpenSys/pkgs/bin/bash

# Set a return status for a function
hello_planet() {
    echo Hello there $1
    return 255
}

hello_planet() Mercury
hello_planet Venus

echo The hello_planet function has a return value of $?



















