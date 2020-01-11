#!/bin/bash
if [[ 0x$1 -lt 0x10000 ]] || [[ 0x$1 -gt 0x10FFFF ]]; 
then 
	echo "value should be between (including) 10000 and 10FFFF";
	exit 1;
fi
# Subtract 0x10000 from the code point
sv=$(echo "obase=16; ibase=16; $1-10000"|bc)
#  For the high surrogate, shift right by 10 (x/400),then add 0xD800 
hs=$(echo "obase=16; ibase=16; D800+ $sv/400"|bc)
# For the low surrogate, take the low 10 bits (x%400), then add 0xDC00
ls=$(echo "obase=16; ibase=16; DC00+ $sv%400"|bc)
echo $hs" "$ls
