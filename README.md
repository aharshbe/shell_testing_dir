# Welcome to the I&A Checker ;)
## It works very similar Holberton's shell checker found [here](https://github.com/holbertonschool/0x15.c/).

### First thing first, you need to change the config file where it says `SHELL`, to reflect the directory of your shell like so: 
`SHELL="../../HolbertonRepos/bash_stuff/simple_shell/V3/h"`

### Lastly, just run the script by typing 
`./checker.bash`

### You can debug your code by setting the `SHOWERRORS` setting in the config file to `1`
	**Showing errors is set not show by default which is `0`

### You betty check your code by setting the `betty_check` setting in the config file to `1`, you then need to add your project's directory to `bettycheckerdir` like so: `bettycheckerdir="../../../HolbertonRepos/bash_stuff/simple_shell/V3"`
	**betty checking is set to not show by default which is `0`

### There is now a fun mode, you can select the fun mode by setting 'FUNMODE' to 1 like so:
	`FUNMODE=1`

### There is an easter egg setting which you can enable if you complete 100% of the tests, enable by setting it to 1 like so:
	`SHOWEGG=1`

## Final result should look something like: 

![](exampleout.png)
