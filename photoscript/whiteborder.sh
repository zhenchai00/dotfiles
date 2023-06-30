#!/bin/sh

# Add white border to make square image, default to apply white border to all jpg found within current directory

# Convert all image file in the folder
for file in "$PWD/*"; do
    convert $file -set filename:f "%[t]_sq_border" -resize 1040x1040 -background white -gravity center -extent 1080x1080 -quality 100 "%[filename:f].jpg"
    echo $file
done
