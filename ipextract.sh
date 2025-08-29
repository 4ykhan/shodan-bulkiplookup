#!/bin/bash

# usage: ./extract_ips.sh -f input.txt

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

output_file="ip_list.txt"

# extract unique IPv4 addresses
grep -oE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' "$input_file" | sort -u > "$output_file"

echo "Unique IPs saved to $output_file"
