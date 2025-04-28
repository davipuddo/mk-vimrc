#!/bin/bash

# Define data
file=$1
ext="${file##*.}"
fname=$"${file%.*}"
argc=$#

# Shift comand arguments
shift
for i in "${@:2}"
do :
done

argv=$@

# Functions #

## Compile code ##

compC ()
{
	gcc -o $fname $file -lm -Wall
}

compCpp ()
{
	g++ -o $fname $file -lm -Wall
}

compJava ()
{
	javac $file
}

## Run compiled code ##

runC ()
{
	./$fname $argv
}

runJava ()
{
	java $fname $argv
}

runPython ()
{
	python3 $file $argv
}

runSwift ()
{
	swift $file $argv
}

# Compile & run code

if [ "$ext" == "$fname" ]; then
	echo "ERROR: No file extension was given!"

elif [ $argc == 0 ]; then
	echo "ERROR: No parameters where given!"

elif [ $ext == 'c' ]; then
	compC
	runC

elif [ $ext == 'cpp' ] || [ $ext == 'cc' ]; then
	compCpp
	runC

elif [ $ext == 'java' ]; then
	compJava
	runJava

elif [ $ext == 'py' ]; then
	runPython

elif [ $ext == 'swift' ]; then
	runSwift
	
fi
