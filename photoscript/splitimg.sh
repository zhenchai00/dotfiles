#!/bin/bash

# split left and right, crop at middle
# output 2 files

convert $1 -gravity center -crop 212:104 cropped.jpg
convert cropped.jpg -gravity east -crop 106:104 split-right.jpg
convert cropped.jpg -gravity west -crop 106:104 split-left.jpg
convert split-right.jpg -resize 1060x1040 -background white -gravity west -extent 1080x1080 -quality 100 "$1-split-right-border.jpg"
convert split-left.jpg -resize 1060x1040 -background white -gravity east -extent 1080x1080 -quality 100 "$1-split-left-border.jpg"

rm cropped.jpg
rm split-right.jpg
rm split-left.jpg
