#! /bin/sh
# create by poplax

if [ -z "$1" ]; then
   echo "Usage : format-oc.sh [files.txt]"
   echo "    files.txt create:"
   echo "    find [Your Project Path] -name \"*.[hmc]\" > files.txt"
   echo "Failed : Specify the file that contains a list of files"
   exit
fi

files=$(cat $1)

mkdir -p out

for item in $files ; do

  dn=$(dirname $item)
  mkdir -p out/$dn
  uncrustify -f $item -c ~/.uncrustifyconfig > out/$item

done
