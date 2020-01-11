#!/bin/bash
function func(){
	local num=$(echo "obase=10; ibase=16; $1"|bc)
	local p=$2
	local k=$3
	local vr=$(($num >> $p-1))
        local vl=$((1 << k))
        vl=$(($vl-1))
        local rv=$(($vl & $vr))
	echo $rv
}
if [[ 0x$1 -ge 0x0 ]] && [[ 0x$1 -le 0x7F ]]; 
then 
	fib=$(echo "obase=2; ibase=16; $1"|bc)
	echo $fib;
	fibx=$(echo "obase=16; ibase=16; $1"|bc)
	echo $fibx;
fi

if [[ 0x$1 -ge 0x80 ]] && [[ 0x$1 -le 0x7FF ]]; 
then 
	# 192 =C0
	num=$(func $1 7 5)
	fib=$(echo "obase=2;ibase=10; $num + 192"|bc)
	fibx=$(echo "obase=16;ibase=10; $num + 192"|bc)
	num=$(func $1 1 6)
	seb=$(echo "obase=2;ibase=10; $num + 128"|bc)
	sebx=$(echo "obase=16;ibase=10; $num + 128"|bc)
	echo $fib $seb;
	echo $fibx $sebx;
fi

if [[ 0x$1 -ge 0x800 ]] && [[ 0x$1 -le 0xFFFF ]]; 
then 
	# 224 = E0
	num=$(func $1 13 4)
	fib=$(echo "obase=2;ibase=10; $num + 224"|bc)
	fibx=$(echo "obase=16;ibase=10; $num + 224"|bc)
	num=$(func $1 7 6)
	seb=$(echo "obase=2;ibase=10; $num + 128"|bc)
	sebx=$(echo "obase=16;ibase=10; $num + 128"|bc)
	num=$(func $1 1 6)
	thb=$(echo "obase=2;ibase=10; $num + 128"|bc)
	thbx=$(echo "obase=16;ibase=10; $num + 128"|bc)
	echo $fib $seb $thb
	echo $fibx $sebx $thbx

fi

if [[ 0x$1 -ge 0x10000 ]] && [[ 0x$1 -le 0x10FFFF ]]; 
then 
	# 240 = F0
	num=$(func $1 19 3)
	fib=$(echo "obase=2;ibase=10; $num + 240"|bc)
	fibx=$(echo "obase=16;ibase=10; $num + 240"|bc)
	num=$(func $1 13 6)
	seb=$(echo "obase=2;ibase=10; $num + 128"|bc)
	sebx=$(echo "obase=16;ibase=10; $num + 128"|bc)
	num=$(func $1 7 6)
	thb=$(echo "obase=2;ibase=10; $num + 128"|bc)
	thbx=$(echo "obase=16;ibase=10; $num + 128"|bc)
	num=$(func $1 1 6)
	fob=$(echo "obase=2;ibase=10; $num + 128"|bc)
	fobx=$(echo "obase=16;ibase=10; $num + 128"|bc)
	echo $fib $seb $thb $fob
	echo $fibx $sebx $thbx $fobx

fi
