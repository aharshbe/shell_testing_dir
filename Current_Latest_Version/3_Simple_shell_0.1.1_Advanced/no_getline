#!/bin/bash
#
# check if the getline function was used by using ltrace

command="/bin/ls
/bin/ls
/bin/ls"

# clean up
stop_shell
rm -f $tmp_file

# send commands
echo "$command" | $LTRACE -bc -o $LTRACEOUTPUTFILE $SHELL > $OUTPUTFILE 2> /dev/null &

# wait a little bit
$SLEEP $SLEEPSECONDS

# check the result
nmatch=`cat $LTRACEOUTPUTFILE | grep getline | wc -l`
if [ $nmatch -eq 1 ]; then
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
else
   print_ok
   l=`expr $l + 1`
fi

# clean up
stop_shell
rm -f $tmp_file
