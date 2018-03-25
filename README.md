# Welcome to the I&A Checker ;)
## It works very similar Holberton's shell checker found [here](https://github.com/holbertonschool/0x15.c/).

### To get startd, you'll need to modify some things int the `config` file: 
Change `SHELL` to the directory where your shell executable is, for example:
`SHELL="../../HolbertonRepos/bash_stuff/simple_shell/V3/h"`

!! Attention !!
Not changing your directory will restult in false tests.

### Next, consider checking out the `Optional settings` section of the `config` file, there you can choose to enable the following:
* Valgrind checks (set on by default, change to `0` to turn off)
	`valgrind_check`
* Betty checks (set off by default)
	`betty_check`
	** if you do betty checks, please alter the directory to point to your folder containing source code for your shell
* The ability turn off advanced checks (on by default)
	`COUNTADV`
* A fun mode which changes the interface of the checker (set off by default)
	`FUNMODE`
* An easteregg (on by default)
	`SHOWEGG`

### If you need to, you can debug your code by setting the `SHOWERRORS` setting in the config file to `1`
	**Showing errors is set not show by default, also, please keep in mind only the checks in I&ATests will display detailed debug information because we didn't write the scripts by Holberton

### To execute the checker, just type `./checker.bash` in your terminal from the directory that contains your clone.
	** As a side note, please don't clone this checker into your source directory for your shell, the best place to clone is a seperate folder in your HOME dir or Desktop

## Final result should look something like (for fun mode): 

![](exampleout.png)

## or below for the professional mode:

![](proout.png)

### If you'd like to contribute to the checker, please contact either Austin or Isaiah if you're not sure how to write scripts, otherwise, create a fork and add your own test directory, once you're finished, create a pull request and we will test and approve it. :)

## For any questions, concerns or improvements, please reach out to either Austin or Isaiah via Slack

Cheers!