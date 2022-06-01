#!/QOpenSys/pkgs/bin/bash

# save ifs environment
oldIFS=$IFS

string="Hello All My Name is Andy Youens"
IFS="|"

read -a array <<< "$string"

# how many elements in the array?
echo "There are ${#array[*]} words in my string."

for val in "${array[@]}"; do
  echo $val
done

# restore ifs environment
IFS=$oldIFS



















