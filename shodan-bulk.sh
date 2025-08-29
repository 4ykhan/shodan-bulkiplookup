#!/bin/bash

# Usage: ./shodan_scan.sh -f input.txt

# Banner
cat << "EOF"
 ██████╗███████╗██████╗ ████████╗ █████╗ ███████╗
██╔════╝██╔════╝██╔══██╗╚══██╔══╝██╔══██╗╚══███╔╝
██║     █████╗  ██████╔╝   ██║   ███████║  ███╔╝ 
██║     ██╔══╝  ██╔══██╗   ██║   ██╔══██║ ███╔╝  
╚██████╗███████╗██║  ██║   ██║██╗██║  ██║███████╗
 ╚═════╝╚══════╝╚═╝  ╚═╝   ╚═╝╚═╝╚═╝  ╚═╝╚══════╝
EOF
echo "CERT.AZ - Shodan IP Scanner"
echo "------------------------------------------"
echo ""

# parse arguments
while getopts "f:" opt; do
  case $opt in
    f) input_file="$OPTARG" ;;
    *) echo "Usage: $0 -f input_file" >&2; exit 1 ;;
  esac
done

if [ -z "$input_file" ]; then
  echo "Error: Input file not specified."
  echo "Usage: $0 -f input_file"
  exit 1
fi

output_file="shodan_res.txt"

# clear previous output
> "$output_file"

# loop through IPs and query Shodan
while read -r ip; do
    if [[ -n "$ip" ]]; then
        echo "Checking $ip ..." | tee -a "$output_file"
        shodan host "$ip" >> "$output_file" 2>&1
        echo -e "\n-----------------------------\n" >> "$output_file"
    fi
done < "$input_file"

echo "Results saved to $output_file"
