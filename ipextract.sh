#!/bin/bash
# Extract unique IPs from the file and save into ip_list.txt

input_file="certaz_20250828.txt"
output_file="ip_list.txt"

# Grab only valid IPv4 addresses, sort them uniquely
grep -oE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' "$input_file" | sort -u > "$output_file"

echo "Unique IPs saved to $output_file"
