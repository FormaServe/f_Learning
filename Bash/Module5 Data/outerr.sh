#!/QOpenSys/pkgs/bin/bash

# host.txt file exists & send to text file
cat hosts.txt &> alloutput.txt

# host.txt file does not exist, so send error to same text file
cat host.txt &>> alloutput.txt

echo "Done"
































