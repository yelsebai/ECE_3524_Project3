#!/bin/sh

dat=$(date)
echo "$dat"
echo "----------------------------"
echo "Main Menu"
echo "----------------------------"
echo "1. Operating system info"
echo "2. Hostname and DNS info"
echo "3. Network info"
echo "4. Who is online"
echo "5. Last logged in users"
echo "6. My IP address"
echo "7. My disk usage"
echo "8. My home file-tree"
echo "9. Process operations"
echo "10. Exit"
echo -n "Enter your choice [ 1 - 10 ] "
read -r
x=$REPLY


while [ "10" != "$x" ]
do
    if [ "1" == "$x" ]
    then
	echo "--------------------------------------------------------"
	echo " System information"
	echo "--------------------------------------------------------"
	echo -n "Operating system : "
	os=$(uname)
	echo "$os"
	inf=$(/usr/bin/lsb_release -a)
	echo "$inf"

    elif [ "2" == "$x" ]
    then
	echo "--------------------------------------------------------"
	echo " Hostname and DNS information"
	echo "--------------------------------------------------------"
	echo -n "Hostname : "
	hn=$(hostname)
	echo "$hn"
	echo -n "DNS domain : "
	dn=$(domainname)
	echo "$dn"
	echo -n "Fully qualified domain name : "
	fq=$(hostname -f)
	echo "$fq"
	echo -n "Network address (IP) : "
	ip=$(hostname -I)
	echo "$ip"
	
	echo -n "DNS name servers (DNS IP) : "
	is=$(hostname -d)
	echo "$is"
	

    elif [ "3" == "$x" ]
    then
        echo "--------------------------------------------------------"
        echo " Network information"
        echo "--------------------------------------------------------"
	echo "Total network interfaces found : 1"
	echo "*** IP Adresses Information ***"
	ninf=$(ip addr show)
	echo "$ninf"

	echo "************************"
	echo "*** Network routing ***"
	echo "************************"
	nrout=$(netstat -rn)
	echo "$nrout"
	
	echo "**************************************"
	echo "*** Interface traffic information ***"
	echo "**************************************"
	ntrf=$(netstat -i)
	echo "$ntrf"

    elif [ "4" == "$x" ]
    then
	echo "--------------------------------------------------------"
        echo " Who is online"
        echo "--------------------------------------------------------"
	whois=$(who -H)
	echo "$whois"

    elif [ "5" == "$x" ]
    then
	echo "--------------------------------------------------------"
        echo " List of last logged in users"
        echo "--------------------------------------------------------"
	laston=$(last -R)
	echo "$laston"
    elif [ "6" == "$x" ]
    then
        echo "--------------------------------------------------------"
        echo " Public IP information"
        echo "--------------------------------------------------------"
	pubip=$(curl -s ifconfig.me)
	echo "$pubip"
    elif [ "7" == "$x" ]
    then
        echo "--------------------------------------------------------"
        echo " 	Disk Usage Info"
        echo "--------------------------------------------------------"
	dsk=$(df --output=pcent,target)
	echo "$dsk"

    elif [ "8" == "$x" ]
    then
        proj=$(./proj1.sh /home filetree.html)
	echo "$proj"

    elif [ "9" == "$x" ]
    then
	echo "(please enter the number of your selection below)"
	echo " "
	echo "1.  Show all processes"
	echo "2.  Kill a process"
	echo "3.  Bring up top"
	echo "4.  Return to Main Menu"
	read -r
	y=$REPLY
	while [ "4" != "$y" ]
	do
	    if [ "1" == "$y" ]
	    then
		shw=$(ps -ef)
		echo "$shw"
	    
	    elif [ "2" == "$y" ]
	    then
		echo "Please enter the PID of the process you would like to kill:"
		read -r
		kll=$REPLY
		shw=$(kill SIGNAL $kll)
	    elif [ "3" == "$y" ]
	    then
		shw2=$(top)
		echo "$shw2"

	    fi

	    read -r
	    y=$REPLY
	done

    else
        echo "Error"
    fi



    echo "Press [Enter] key to continue..."
    read -r
    ent=$REPLY
    while [ -z !$ent ]
    do
        read -r
        ent=$REPLY
    done
    echo -n "Enter your choice [ 1 - 10 ] "
    read -r
    x=$REPLY
done
