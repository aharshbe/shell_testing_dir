#!/bin/bash
#
# check history

# send commands
cd $HOME

ls -a | grep -q .simple_shell_history
ret=$?
num="cat .simple_shell_history 2>tmp_file | wc -l"
x=`eval $num`

# wait a little bit
$SLEEP $SLEEPSECONDS

# check the result
if [[ $x -gt 3 && $ret -eq 0 ]]; then
	   print_ok
	   l=`expr $l + 1`
else
	   print_ko
	  	   if [[ $COUNTADV -eq 1 ]]; then
	   		l=`expr $l + 1`
	   		k=`expr $k + 1`
		fi
	   if [[ $SHOWERRORS -eq 1 ]]; then
	   	echo ""
	   	echo -e "[\033[31m************************\033[37m]"
	   	echo ">> Real output << "
	   	echo ""
	   	cat tmp_file
	   	echo ">>**************<<"
	   	echo ""
	   	echo "> Expected output: "
	   	echo ""
	   	echo "Do you write your history to .simple_shell_history?"
	   	echo ">>**************<<"
	    echo -e "[\033[31m************************\033[37m]"
	   fi
fi
>/dev/null cd -

# clean up
stop_shell
rm -f tmp_file
