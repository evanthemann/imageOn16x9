#!/bin/bash

# Prompt the user for the folder path
echo "Enter the folder path:"
read folder_path

# Check if the folder exists
if [ ! -d "$folder_path" ]; then
    echo "Folder not found. Exiting."
    exit 1
fi

# Navigate to the specified folder
cd "$folder_path" || exit

# Loop through all image file types
for file in *.{jpg,jpeg,png,gif,bmp}; do
    if [ -f "$file" ]; then
        # Get the filename and extension
        filename="${file%.*}"
        extension="${file##*.}"

        # Convert the image and save with "_edited" appended to the filename
        convert "$file" -auto-orient -resize 1920x1080 -size 1920x1080 xc:black +swap -gravity center -composite "${filename}_edited.$extension"
    fi
done

echo "Conversion complete."
