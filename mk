#!/bin/bash

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

compRust ()
{
	rustc $file
}

buildRust ()
{
	cargo build
}

runRust ()
{
	cargo run $file
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

runLua ()
{
	lua $file $argv
}

# Compile & run code


if [ $argc == 0 ]; then
	echo "ERROR: No parameters where given!"

elif [ -d $file ]; then 	# Rust's cargo case

	dir=$file

	if [ "$dir" == "src" ] && [ -f "$dir/main.rs" ]; then

		file="$dir/main.rs";

		if [ "$1" == "-b" ]; then
			buildRust
		else
			runRust
		fi
	else
		echo "ERROR: A directory was given when a file was expected!"
	fi

elif [ ! -f $file ]; then		# Other cases

	echo "ERROR: The given file does not exist!"

elif [ "$ext" == "$fname" ]; then
	echo "ERROR: No file extension was given!"

elif [ "$ext" == 'c' ]; then
	compC
	run

elif [ "$ext" == 'cpp' ] || [ "$ext" == 'cc' ]; then
	compCPP
	run

elif [ "$ext" == 'cs' ]; then
	compCSharp
	run

elif [ "$ext" == 'java' ]; then
	compJava
	runJava

elif [ "$ext" == 'py' ]; then
	runPython

elif [ "$ext" == 'swift' ]; then
	runSwift

elif [ "$ext" == 'lua' ]; then
	runLua

elif [ "$ext" == 'rs' ]; then
	compRust
	run
else 
	printf "ERROR: The given file extension resulted in no matches!\n-> [$ext]\n"
fi
