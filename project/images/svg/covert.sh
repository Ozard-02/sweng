#!/bin/bash

FOLDER="./"

echo "Converting SVG files to PDF using Inkscape..."
echo

# Check if folder exists
if [ ! -d "$FOLDER" ]; then
    echo "Error: Folder $FOLDER not found!"
    exit 1
fi

# Check if Inkscape is installed
if ! command -v inkscape &> /dev/null; then
    echo "Error: Inkscape is not installed or not in PATH!"
    exit 1
fi

# Convert each SVG file
for file in "$FOLDER"/*.svg; do
    if [ -f "$file" ]; then
        filename=$(basename -- "$file")
        name="${filename%.*}"
        echo "Converting $filename to PDF..."
        
        inkscape --export-filename="$FOLDER/$name.pdf" "$file"
        
        if [ $? -eq 0 ]; then
            echo "Successfully converted $filename to $name.pdf"
        else
            echo "Error converting $filename"
        fi
    fi
done

echo
echo "Conversion complete!"