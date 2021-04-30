#!/bin/sh
if [ $# -eq 2 ]
then
    n0="$(basename -- $1)"
    echo "  ||__|| $n0" >> $2
    echo "<br>" >> $2
    for dir in "$1"/*
    do
	n1="$(basename -- $dir)"
	echo "  ||__||  ||__||" $n1 >> $2
	echo "<br>" >> $2
	if [ -d "$dir" ] && [ "$(ls -A $dir)" ]
	then
	    for s in "${dir}"/*
	    do
		n2="$(basename -- ${s})"
		echo "  ||__||  ||__||  ||__||" ${n2} >> $2
		echo "<br>" >> $2
		if [ -d "$s" ] && [ "$(ls -A $s)" ]
		then
		    for p in "$s"/*
		    do
			n3="$(basename -- ${p})"
			echo "  ||__||  ||__||  ||__||  ||__||" ${n3} >> $2
			echo "<br>" >> $2
		    done
		fi
	    done 
	fi
    done
else 
    echo "invalid number of arguments"
fi

