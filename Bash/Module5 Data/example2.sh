#!/QOpenSys/pkgs/bin/bash

# Define file names
input_file=hosts.csv
output_file=ok.csv
audit_file=audit.log
error_file=errors.csv

# get current date & time
current_date=$(date +%d-%m-%Y)
current_time=$(date +%H:%M:%S)

# let the user know we have started the script
echo "Start checking servers at $current_time on $current_date"

# set the headers for the output/error files
echo "ServerName,IP,Description,Ping" > "$output_file"
echo "ServerName,IP,Description,Ping" > "$error_file"

# loop thro input file starting at 2nd line, using comma as the delimiter
tail -n +2 "$input_file" | while IFS=, read -r host ip description _
do

  # let the user know what server we are working on
  echo "Checking the server/host called $host"

  # ping the host
  echo "Pinging $host"

  # As ping not native within PASE, we use system utility to run the IBM i command
  if system -bOE ping $host > /dev/null; then
    ping_status="OK"
  else
    ping_status="FAIL"
  fi

  echo "Ping status for $host is $ping_status"

done

# update date & time
current_date=$(date +%d-%m-%Y)
current_time=$(date +%H:%M:%S)

# all done - omers!
echo "Completed checking servers at $current_time on $current_date"










