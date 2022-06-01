#!/QOpenSys/pkgs/bin/bash

file="Hosts.txt"

if test -f "$file";
then
    echo "File named $file exists"
else
    echo "File named $file does not exist"
fi









