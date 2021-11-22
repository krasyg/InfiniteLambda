#!/usr/bin/env bash

usage="Bash script which does the following: If run without arguments or with --help 
should print the script's usage. If executed with one argument, should delete all files with size 0 in 
the folder name passed as argument. If executed with two arguments, should create a folder 
with name equal to the first argument in which number of files equal to the second argument should be created"

re='^[1-9]+$'

if [[ $1 == "--help" ]] || [[ $1 == "" ]]
then 
	echo $usage 
elif [ $# -eq 1 ] && [ -d $1 ]
then
    find "$1" -size 0 -delete

elif [[ $# -eq 2 ]] && [[ $2 =~ $re ]]
then
    mkdir $1
    cd $1 
      for f in `seq 1 $2`
    	do
    	  touch $f.file
    	done
fi
