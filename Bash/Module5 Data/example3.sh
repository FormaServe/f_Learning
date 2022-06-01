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
echo "Start checking servers at $current_time on $current_date" >> $audit_file

# set the headers for the output/error files
echo "ServerName,IP,Ping" > "$output_file"
echo "ServerName,IP,Ping" > "$error_file"

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
    echo "$host,$ip,$ping_status" >> $output_file
  else
    ping_status="FAIL"
    echo "$host,$ip,$ping_status" >> $error_file
  fi

  echo "Ping status for $host is $ping_status"
  echo "$current_date $current_time $host $ip $ping_status" >> $audit_file

done

# update date & time
current_date=$(date +%d-%m-%Y)
current_time=$(date +%H:%M:%S)

# all done - omers!
echo "Completed checking servers at $current_time on $current_date"
echo "Completed checking servers at $current_time on $current_date" >> $audit_file










