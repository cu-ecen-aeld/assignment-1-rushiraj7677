#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: writer.sh <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

dirpath=$(dirname "$writefile")

# Debug: Print out the directory path
echo "Extracted directory path: $dirpath"

if [ ! -d "$dirpath" ]; then
    echo "Creating directory: $dirpath"
    mkdir -p "$dirpath"
    if [ $? -ne 0 ]; then
        echo "Error: Could not create directory $dirpath."
        exit 1
    fi
fi

echo "Writing '$writestr' to file: $writefile"


echo "$writestr" > "$writefile"

if [ $? -eq 0 ]; then
    echo "File created successfully: $writefile"
else
    echo "Error: Could not create file $writefile."
    exit 1
fi

