#!/bin/bash

# Set default values for numfiles and writestr
numfiles=10
writestr="AELD_IS_FUN"

# Override defaults if arguments are provided
if [ "$#" -ge 1 ]; then
    numfiles=$1
fi
if [ "$#" -ge 2 ]; then
    writestr=$2
fi

# Read username from the config file
username=$(cat conf/username.txt)

# Create the directory for files
mkdir -p /tmp/aeld-data

# Loop to create numfiles files using the writer.sh script
for i in $(seq 1 $numfiles); do
    # Construct the file path and call writer.sh
    file="/tmp/aeld-data/${username}${i}.txt"
    ./writer.sh "$file" "$writestr"
done

# Run the finder.sh script with the created files
output=$(./finder.sh /tmp/aeld-data "$writestr")

# Expected output
expected_output="The number of files are $numfiles and the number of matching lines are $numfiles"

# Compare the output with the expected output
if [ "$output" == "$expected_output" ]; then
    echo "success"
else
    echo "error"
fi

