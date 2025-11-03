#!/bin/bash

# String Length
mystring="Hello Bash"
echo "${mystring}" 		#prints what is in variable 
echo "${#mystring}"		#prints the length of variable (10)
echo 8-"${#mystring}"		#prints `8-10`
echo $((8-"${#mystring}"))	#prints the difference of 8 and 10

##

#makes a right triangle like shape out of the length of mystring
echo "Here in loops:"
for (( i=1; i<=${#mystring}; i++ ));
do
	echo "${mystring:0:$i}"		#0 is position, $i is length
done


newVarBinary="11011"
newVarDec=$((2#"${newVarBinary}"))	#Binary to decimal
echo "${newVarDec}"

newVarLastTwo="${newVarBinary:0:2}"	#prints the last 2 in the variable
echo "${newVarLastTwo}"

# Leading 0s
printf '%08d\n' "${newVarLastTwo}"

#	%   starts the format specifier
# 	0   specifies the output should be padded with 0s instead of spaces
# 	8   specifies the minimum field width
# 	d   specifies that it should format and print a signed decimal integer
# 	\n  represents a newline character


