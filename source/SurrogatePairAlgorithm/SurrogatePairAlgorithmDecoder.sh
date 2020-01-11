#!/bin/bash
if [[ 0x$1 -lt 0xD800 ]] || [[ 0x$1 -gt 0xDBFF ]];
then
        echo "First value should be between (including) D800 and DBFF";
        exit 1;
fi
if [[ 0x$2 -lt 0xDC00 ]] || [[ 0x$2 -gt 0xDFFF ]];
then
        echo "Second value should be between (including) DC00 and DFFF";
        exit 1;
fi
# take the high surrogate and subtract 0xD800, then multiply by 0x400
hs=$(echo "obase=16; ibase=16; ($1-D800)*400"|bc)
# take the low surrogate and subtract 0xDC00, resulting in 0x37.
ls=$(echo "obase=16; ibase=16; $2-DC00"|bc)
# Add these two results together, and finally add 0x10000 
fv=$(echo "obase=16; ibase=16; $hs+$ls+10000"|bc)
echo $fv
