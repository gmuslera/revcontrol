#!/bin/bash

# Find the differences between the content of 2 tar.gz files
# assumes that both have the same files/paths

arch1=$1
arch2=$2
test -f "$arch1"  && echo "Missing/invalid 1st file" && exit 1
test -f "$arch2"  && echo "Missing/invalid 2nd file" && exit 1
dir1=$(/bin/mktemp -d 1st-XXXXX)
dir2=$(/bin/mktemp -d 2nd-XXXXX)
tar xfz $arch1 -C $dir1
tar xfz $arch2 -C $dir2
diff -r $dir1 $dir2
rm -rf $dir1 $dir2
