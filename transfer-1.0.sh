#!/bin/sh

#upload all files in a directory and log the upload url to log_file. files last only 14 days at the site.

#edit this to the directory you want to upload
search_dir="/mnt/sda8/pets-scripts-zips/aspyware/spyimages"

for entry in "$search_dir"/*
do
  echo "$entry"
  
 filename=${entry##/*/}  
echo "$filename"
echo >> log_file

curl --upload-file "$entry"  "https://transfer.sh/$filename" >> log_file >&1

done

