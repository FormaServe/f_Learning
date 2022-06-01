#!/QOpenSys/pkgs/bin/bash

oldIFS=$IFS
input="hosts.txt"
IFS="|"

while read -r line
do
  echo "$line"
done < "$input"

IFS=$oldIFS
