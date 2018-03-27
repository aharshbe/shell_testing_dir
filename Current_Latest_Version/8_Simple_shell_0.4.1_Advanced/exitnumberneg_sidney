#!/bin/bash
#
# simple test with ls to check if the shell can find ls in the PATH

command="exit -39"
tmp_file="testing_custom_$RANDOM"
tmp_file2="testing_real_$RANDOM"

# create a pseudo random file
touch $tmp_file
# send commands
echo "$command" | $SHELL > $tmp_file 2>/dev/null
ret_actual=$?
echo "$command" | $TSHELL > $tmp_file2 2>/dev/null
ret_exepcted=$?

# wait a little bit
$SLEEP $SLEEPSECONDS

# check the result
if [[ $ret_actual -eq $ret_exepcted ]]; then
	      print_ok
   		  l=`expr $l + 1`
else
	  	print_ko
	   if [[ $COUNTADV -eq 1 ]]; then
	   		k=`expr $k + 1`
	   		l=`expr $l + 1`
		fi
	   if [[ $SHOWERRORS -eq 1 ]]; then
	   	echo ""
	   	echo -e "[\033[31m************************\033[37m]"
	   	echo ">> Real output << "
	   	cat $tmp_file
	   	echo ">>**************<<"
	   	echo ""
	   	echo "> Expected output: "
	   	echo ""
	   	cat $tmp_file2
	   	echo ">>**************<<"
	    echo -e "[\033[31m************************\033[37m]"
	   fi
fi

# clean up
stop_shell
rm -f $tmp_file
rm -f $tmp_file2
