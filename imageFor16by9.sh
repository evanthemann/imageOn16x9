for i in *.JPG; do convert "$i" -auto-orient -resize 1920x1080 -size 1920x1080 xc:black +swap -gravity center -composite "test/${i%.*}.jpg"; done
