#!/bin/bash
#
# Script to test custom shells

# Print KO, in red, followed by a new line

function print_ko()
{
    if [[ "$FUNMODE" -eq 0 ]]; then
        echo -e "[\033[31mFail\033[37m]"
    else
        echo -e "[\033[31m:'(\033[37m]"
    fi
}

# Print OK in green, followed by a new line

function print_ok()
{
    if [[ "$FUNMODE" -eq 0 ]]; then
        echo -e "[\033[32mPass\033[37m]"
    else
         echo -e "[\033[32m^.^\033[37m]"
    fi
}

# Kill the shell in a clean way and remove temporary files

function stop_shell()
{
    if [ `pidof $SHELL | wc -l` -ne 0 ]; then
	   killall -9 $SHELL 2>&1 > /dev/null
    fi
    rm -f $OUTPUTFILE $ERROROUTPUTFILE $LTRACEOUTPUTFILE
}

# Load configuration
source config

# Cleanup
echo -ne "\033[37m"
rm -f $OUTPUTFILE $LTRACEOUTPUTFILE

# Cool welcome
    
    if [[ "$FUNMODE" -eq 1 ]]; then
        echo "***;)******;)*********;)******"
        echo "*******************WELCOME****"
        echo "*********;)*******TO**********"
        echo "***************THE*****;)*****"
        echo "**;)******CHECKER*************"
        echo "*****;)********;)******;)*****"
        echo ""
        echo -e "[\033[32m^-^\033[37m] -- means you are good to go! [\033[32mWoot!\033[37m]"
        echo -e "[\033[31m:'(\033[37m] -- means something went wrong! [\033[31mUHG OH!\033[37m]"
        echo ""
    else
        echo ""
        echo "******************************"
        echo "******************************"
        echo "Welcome to the I&A Checker!"
        echo "******************************"
        echo "******************************"
        echo ""
    fi
# Counter for tests passed
i=0
j=0
k=0
l=0
total=0
# Locates all tests and launch them
for dir in `ls -dv "$TESTDIR"/*/`
do
    echo "> $dir"
    echo " "
    for testname in `ls "$dir" | grep -v "~$"`
    do
	   echo -n "   # $testname: "
	   source "$dir$testname"
    done
        echo ""
done

if [[ "$j" -eq 0 ]]; then
	echo ""
	echo "Congrats you passed all tests!"
    if [[ "$FUNMODE" -eq 1 ]]; then
        if [[ "$SHOWEGG" -eq 1 ]]; then
            ./ship
        fi
        echo "You ROCK!!!!!!!!!!!!!"
    	echo ""
        echo "***;)******;)*********;)******"
        echo -e "\033[32m*********Results**************\033[37m"
        echo "*********;)*******************"
        echo -e "\033[32m***********RESULTS*****;)*****\033[37m"
        echo "**;)**************************"
    echo -e "\033[32m*****;)***ReSuLtS******;)*****\033[37m"
    fi
        if [[ "$SHOWEGG" -eq 1 ]]; then
            ./ship
        fi
else
    if [[ $COUNTADV -eq 0 ]]; then
        echo ""
        echo "-->> For mandatory:"
        echo -e "-->> You passed \033[32m[$i]\033[37m tests :-)"
        echo -e "-->> But missed \033[31m[$j]\033[37m tests :'("
        echo ""
    else
        total_u=`expr $total + $l`
        passavd=`expr $l - $k`
        passman=`expr $total - $j` 
        echo ""
        echo "->> There are [$total_u] total tasks <<--"
        echo -e "You passed \033[32m[$passman]\033[37m out of [$total] mandatory"
        echo -e "You passed \033[32m[$passavd]\033[37m out of [$l] advanced"
        echo -e "You missed \033[31m[$j]\033[37m mandatory tasks"
        echo -e "You missed \033[31m[$k]\033[37m advanced tasks"
    fi
    if [[ "$FUNMODE" -eq 1 ]]; then
        echo ""
        echo "***;)******;)*********;)******"
        echo -e "\033[32m*********Results**************\033[37m"
        echo "*********;)*******************"
        echo -e "\033[32m***********RESULTS*****;)*****\033[37m"	
        echo "**;)**************************"
        echo -e "\033[32m*****;)***ReSuLtS******;)*****\033[37m"
    else
        echo ""
        echo "******************************"
        echo "******************************"
        echo "Thanks for checking with us! "
        echo "******************************"
        echo "******************************"
    fi
fi

# Cleanup
rm -f $OUTPUTFILE $LTRACEOUTPUTFILE $ERROROUTPUTFILE
rm -f checker_output_*
rm -f checker_tmp_file_*
rm -f /tmp/.checker_tmp_file_*
echo -ne "\033[37m"
