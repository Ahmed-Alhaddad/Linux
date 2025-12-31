Useful Terminal Commands:

    clear
     (Clear Screen):
    Used to clean the terminal screen when it gets filled with commands.

    user@hackerbox:~$ clear

    When you run this command, all previous outputs are cleared and the cursor moves to the top line. It's like opening a clean page.

    history
     (Past Commands):
    Gives a list of commands you ran before. Great for finding a command you forgot.

    user@hackerbox:~$ history
      1  ls
      2  cd Documents
      3  pwd
      4  ping google.com
      5  cat /etc/passwd
      6  clear
      7  whoami
      8  sudo apt update
      9  exit
     10  history

    In the output, the numbers on the left show the sequence number of the command. For example, if you type !4
     and press enter, it will re-run the 4th command ping google.com
    .

    type
     (Command Type):
    Shows what a command really is (alias, builtin, file).

    user@hackerbox:~$ type ls
    ls is aliased to `ls --color=auto'
    user@hackerbox:~$ type cd
    cd is a shell builtin
    user@hackerbox:~$ type grep
    grep is /usr/bin/grep

    Here we understand that the ls
     command is actually an alias (alias) to give colored output, the cd
     command is built into the shell (builtin), and the grep
     command is a real program sitting on the disk.

Shell Configuration Files (.bashrc
, .zshrc
)

Every time the terminal opens, the shell reads some hidden settings files in your home directory (/home/user
). You can add your own shortcuts to these files.

    If using Bash: .bashrc
    If using Zsh: .zshrc

Example Scenario: We want to clear the screen by typing just c
 instead of clear
 every time.

    Open the file with nano editor: nano ~/.bashrc
    Add this line to the bottom: alias c='clear'
    Save and exit (CTRL+O
    , Enter
    , CTRL+X
    ).
    Load settings: source ~/.bashrc

Now let's type c
 in the terminal:

user@hackerbox:~$ c

The command will work and the screen will be cleared. With this method you can shorten long and complex commands.
Environment Variables

Dynamic values that affect how the operating system and programs work.

Most Important Variables:
Variable	Description
$HOME
	User's home directory.
$USER
	Current username.
$PWD
	Present Working Directory.
$SHELL
	Shell program used.
$PATH
	List of directories where commands are searched.

Practical Example: Viewing Variables

user@hackerbox:~$ echo $HOME
/home/user

user@hackerbox:~$ echo $USER
user

user@hackerbox:~$ echo $PWD
/home/user/Desktop

user@hackerbox:~$ printenv PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

The echo
 command prints the value of the variable to the screen. In the $PATH
 output, you see directory paths separated by colons (:). When you type a command, Linux looks in these directories in order.
Command Chaining Operators

Special characters are used to write multiple commands on a single line.

1. Sequential Execution (;
)

The first command finishes, even if it errors, the second one runs.

user@hackerbox:~$ echo "First Command" ; date
First Command
Fri Oct 20 14:30:00 UTC 2023

The first command printed text, immediately after the date
 command ran and showed the date.

2. Continue if Successful (&&
)

If the first command is successful (doesn't error), the second one runs.

user@hackerbox:~$ mkdir test_directory && cd test_directory
user@hackerbox:~/test_directory$ pwd
/home/user/test_directory

Here since mkdir
 was successful, the cd
 command ran and we entered the new directory.

3. Run if Error (||
)

If the first command errors, the second one runs. Usually used to show error messages.

user@hackerbox:~$ cd nonexistent_directory || echo "No such directory!"
-bash: cd: nonexistent_directory: No such file or directory
No such directory!

Since the cd
 command couldn't find the directory and errored, the ||
 operator kicked in and ran the echo
 command.
Script Start (Shebang #!
)

To specify that a text file is a shell script, Shebang (#!
) is added to the first line.

#!/bin/bash
echo "Hello World"

This line tells the system "Run this file using the /bin/bash program".