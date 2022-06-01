#!/QOpenSys/pkgs/bin/bash

# Define file names
input_file=hosts.csv
output_file=ok.log
audit_file=audit.log
error_file=errors.csv

# get current date and time
current_date=$(date +%d-%m-%Y)
current_time=$(date +%H:%M:%S)

echo "Current date: $current_date"
echo "Current time: $current_time"

# Define a alias for the ping command as not part of PASE
alias ping="system ping"

# set the headers for the output/error files
echo "ServerName,IP,Description,Ping,DNS,SSH" > "$output_file"

## loop thro input file starting at 2nd line, using comma as the delimiter
tail -n +2 "$input_file" | while IFS=, read -r host ip description _
do
  # ping the host
  echo "Pinging $host"
  if system ping $host > /dev/null; then
    ping_status="OK"
  else
    ping_status="FAIL"
  fi
  echo "Ping status: $ping_status"

  # check the DNS
  echo "Checking DNS for $host"
  if nslookup "$ip" > /dev/null; then
    dns_status="OK"
  else
    dns_status="FAIL"
  fi
  echo "DNS status: $dns_status"

  # if nc -z -w3 "$ip" 22 > /dev/null; then
  #   ssh_status="OK"
  # else
  #   ssh_status="FAIL"
  # fi

  # Write details to screen & write the output to the audit log
  echo "Host = $host IP = $ip" PING_STATUS = $ping_status DNS_STATUS = $dns_status SSH_STATUS = $ssh_status
  echo "$host,$ip,$description,$ping_status,$dns_status,$ssh_status" >> $output_file
done

