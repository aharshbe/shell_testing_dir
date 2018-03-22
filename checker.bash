#!/bin/bash
#
# Performing checks on the Holberton School "simple shell" project

#######################################
# Print KO, in red, followed by a new line
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function print_ko()
{
    echo -e "[\033[31m;)\033[37m]"
}

#######################################
# Print OK in green, followed by a new line
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function print_ok()
{
    echo -e "[\033[32m^-^\033[37m]"
}

#######################################
# Kill the shell in a clean way and remove temporary files
# Globals:
#   SHELL
#   OUTPUTFILE
#   ERROROUTPUTFILE
#   LTRACEOUTPUTFILE
# Arguments:
#   None
# Returns:
#   None
#######################################
function stop_shell()
{
    if [ `pidof $SHELL | wc -l` -ne 0 ]; then
	   killall -9 $SHELL 2>&1 > /dev/null
    fi
    #rm -f $OUTPUTFILE $ERROROUTPUTFILE $LTRACEOUTPUTFILE
}

# Load configuration
source config

# Cleanup
echo -ne "\033[37m"
#rm -f $OUTPUTFILE $LTRACEOUTPUTFILE

# Cool welcome
    echo "***;)******;)*********;)******"
    echo "*******************WELCOME****"
    echo "*********;)*******TO**********"
    echo "***************THE*****;)*****"
    echo "**;)******CHECKER*************"
    echo "*****;)********;)******;)*****"
    echo ""
    echo -e "[\033[32m^-^\033[37m] -- means you are good to go! [\033[32mOK\033[37m]"
    echo -e "[\033[31m;)\033[37m] -- means something went wrong! [\033[31mUHG OH!\033[37m]"
    echo ""
# Counter for tests passed
i=0
j=0
# Locates all tests and launch them
for dir in `ls -d "$TESTDIR"/*/`
do
    echo "> $dir"
    for testname in `ls "$dir" | grep -v "~$"`
    do
	   echo -n "   # $testname: "
	   source "$dir$testname"
    done
done

if [[ "$j" -eq 0 ]]; then
    clear
    ./ship
	echo ""
	echo "Congrats you passed all tests!"
    echo "You ROCK!!!!!!!!!!!!!"
	echo ""
    echo "***;)******;)*********;)******"
    echo -e "\033[32m*********Results**************\033[37m"
    echo "*********;)*******************"
    echo -e "\033[32m***********RESULTS*****;)*****\033[37m"
    echo "**;)**************************"
    echo -e "\033[32m*****;)***ReSuLtS******;)*****\033[37m"
else
	echo ""
	echo -e "You passed \033[32m[$i]\033[37m tests :-)"
	echo -e "But missed \033[31m[$j]\033[37m tests :'("
	echo ""
    echo "***;)******;)*********;)******"
    echo -e "\033[32m*********Results**************\033[37m"
    echo "*********;)*******************"
    echo -e "\033[32m***********RESULTS*****;)*****\033[37m"	
    echo "**;)**************************"
    echo -e "\033[32m*****;)***ReSuLtS******;)*****\033[37m"
fi

# Cleanup
rm -f $OUTPUTFILE $LTRACEOUTPUTFILE $ERROROUTPUTFILE
rm -f checker_output_*
rm -f checker_tmp_file_*
rm -f /tmp/.checker_tmp_file_*
echo -ne "\033[37m"
