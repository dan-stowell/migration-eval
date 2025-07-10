#!/bin/bash

# Script to clean ANSI escape codes from log files
# Usage: ./clean-log.sh input.log [output.log]

if [ $# -lt 1 ]; then
    echo "Usage: $0 input.log [output.log]"
    echo "If output.log is not specified, creates input-clean.log"
    exit 1
fi

input_file="$1"
output_file="$2"

# If no output file specified, create one based on input filename
if [ -z "$output_file" ]; then
    # Remove extension and add -clean.log
    base_name=$(basename "$input_file" .log)
    dir_name=$(dirname "$input_file")
    output_file="${dir_name}/${base_name}-clean.log"
fi

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found"
    exit 1
fi

# Clean ANSI escape codes
sed 's/\x1b\[[0-9;]*[mGKH]//g' "$input_file" | \
sed 's/\x1b\[[?][0-9;]*[hlc]//g' | \
sed 's/\x1b\[[0-9;]*[ABCD]//g' | \
sed 's/\x1b\[[0-9;]*[J]//g' | \
sed 's/\x1b\[[0-9;]*[~]//g' | \
sed 's/\x1b\[[?][0-9;]*[l]//g' | \
sed 's/\x1b\[[0-9;]*[u]//g' | \
sed 's/\x1b\[[0-9;]*[s]//g' | \
sed 's/\x1b\[[0-9;]*[n]//g' | \
sed 's/\x1b\[6n//g' | \
sed 's/\x1b\]][0-9;]*[;\\]//g' | \
sed 's/\x1b\[[0-9;]*[q]//g' | \
sed 's/\x1b\[[0-9;]*[r]//g' | \
sed 's/\x1b\[[0-9;]*[t]//g' | \
sed 's/\x1b\[[0-9;]*[f]//g' | \
sed 's/\x1b\[[0-9;]*[g]//g' | \
sed 's/\x1b\[[0-9;]*[i]//g' | \
sed 's/\x1b\[[0-9;]*[c]//g' | \
sed 's/\x1b\[[0-9;]*[d]//g' | \
sed 's/\x1b\[[0-9;]*[p]//g' | \
sed 's/\x1b\[[0-9;]*[P]//g' | \
sed 's/\x1b\[[0-9;]*[X]//g' | \
sed 's/\x1b\[[0-9;]*[S]//g' | \
sed 's/\x1b\[[0-9;]*[T]//g' | \
sed 's/\x1b\[[0-9;]*[L]//g' | \
sed 's/\x1b\[[0-9;]*[M]//g' | \
sed 's/\x1b\[[0-9;]*[@]//g' | \
sed 's/\x1b\[[0-9;]*[`]//g' | \
sed 's/\x1b\[[0-9;]*[a]//g' | \
sed 's/\x1b\[[0-9;]*[e]//g' | \
sed 's/\x1b\[[0-9;]*[F]//g' | \
sed 's/\x1b\[[0-9;]*[E]//g' | \
sed 's/\x1b\[[=?][0-9;]*[h]//g' | \
sed 's/\x1b\[[=?][0-9;]*[l]//g' | \
sed 's/\x1b\]11;[^\\]*\\//g' | \
sed 's/\x1b\[[0-9;]*[D]//g' | \
sed 's/\x1b\[[0-9;]*[K]//g' | \
sed 's/\x1b\[[0-9;]*[J]//g' | \
sed 's/\x1b\[[0-9;]*[^\\]*[\\]//g' | \
tr -d '\r' > "$output_file"

echo "Cleaned log saved to: $output_file"