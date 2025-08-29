#!/bin/bash
# usage: ./ipextract.sh -f input.txt [-o output.txt]

while getopts "f:o:" opt; do
  case $opt in
    f) input_file="$OPTARG" ;;
    o) output_file="$OPTARG" ;;
    *) echo "Usage: $0 -f input_file [-o output_file]" >&2; exit 1 ;;
  esac
done

if [ -z "$input_file" ]; then
  echo "Error: Input file not specified."
  echo "Usage: $0 -f input_file [-o output_file]"
  exit 1
fi

output_file="${output_file:-ip_list.txt}"

grep -oE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' "$input_file" | sort -u > "$output_file"
echo "Unique IPs saved to $output_file"
