
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: finder.sh <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if filesdir is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a valid directory."
    exit 1
fi

file_count=0
matching_lines=0

# Using find command to list files, then iterate over them
for file in $(find "$filesdir" -type f); do
    ((file_count++))  # Increment file count
    # Search for the string in each file and count matching lines
    match=$(grep -c "$searchstr" "$file")
    ((matching_lines += match))  # Add matching lines count
done

# Print the results
echo "The number of files are $file_count and the number of matching lines are $matching_lines"
