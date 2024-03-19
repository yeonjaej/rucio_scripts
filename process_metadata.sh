#!/bin/bash

input=$1

echo $input
while IFS= read -r line <&3;

do
meta=$(samweb get-metadata $line)


filename=""
size=""
checksum=""

#echo "$meta"

while IFSS= read -r metaline
do
   #echo "$metaline"
   if [[ "$metaline" == *"File Name:"* ]];
       then echo "$metaline"; filename=${metaline#*:}
       filename=$(echo $filename | tr -d ' ')
       echo $filename
   fi

   if [[ "$metaline" == *"File Size:"* ]];
       then echo "$metaline"; size=${metaline#*:}
       size=$(echo $size | tr -d ' ')
       echo $size
   fi

   if [[ "$metaline" == *"adler32:"* ]];
       then echo "$metaline"; checksum=${metaline#*:}
       checksum=$(echo $checksum | tr -d ' ')
       echo $checksum
   fi

done < <(printf '%s\n' "$meta")


echo "$filename $checksum $size" >> icarus_keepup_v09_72_00_05p04_bnbmajority.txt #icarus_run9435.txt

done 3< bnb_filelist.txt #ALLoffbeambnbmajority.txt #filelist.txt
