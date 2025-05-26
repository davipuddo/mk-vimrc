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

compCPP ()
{
	g++ -o $fname $file -lm -Wall
}

compCSharp ()
{
	mcs $file -out:$fname
}

compJava ()
{
	javac $file
}

## Run compiled code ##

run ()
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
	run

elif [ $ext == 'cpp' ] || [ $ext == 'cc' ]; then
	compCPP
	run

elif [ $ext == 'cs' ]; then
	compCSharp
	run

elif [ $ext == 'java' ]; then
	compJava
	runJava

elif [ $ext == 'py' ]; then
	runPython

elif [ $ext == 'swift' ]; then
	runSwift
	
fi
