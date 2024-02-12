#!/bin/bash

# Set the directory to be cleaned
DIRECTORY=/opt/backup

# Find all files in the directory, sort them by modification time (newest first),
# and delete all but the last 3
find $DIRECTORY -type f -print0 | xargs -0 stat --format '%Y :%n' | sort -nr | awk -F: '{if(i++<3) print $2}' | xargs rm --