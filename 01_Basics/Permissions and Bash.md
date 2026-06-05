Bash
------
Linux File Permissions
Ownership of linux files

User(owner)	Group	Other(all)

Permissions

Read	Write	Execute
 r		  w       x
 
 - = no permission
 - = file & d = directory
 
		user	group	all
 EX\ -/d rwx	r-x		r--
 
 ----------------------------------------
 chmod command
 chmod permissions filename
 
 There are two ways to use the command:
 1-Absolute
	using numbers (Octal number)
	No.		Symbolic
	---		--------
	0		---
	1		--x
	2		-w-
	3		-wx
	4		r--
	5		r-x
	6		rw-
	7		rwx
ex\ chmod 764 file.txt

 2-Symbolic
	+	add permission
	-	remove permission
 u= user
 g= group
 o= other
 a= all
 
 ex\ chmod o=rwx file.txt
 ex\ chmod g+x file,txt
 
 -----------------------------
 Programming using Bash
 
 File end with .sh
 like file.sh
 to run file and you should have the permissios to Executable File:
 ex\ bash file.sh
 ex\ ./file.sh
 
- #!/bin/bash
The line #!/bin/bash is called a shebang (or hashbang),and it tells the operating system to execute the script using the GNU Bash shell. It must be placed on the absolute first line of your file to work properly
 
Anatomy of the Line
- #!: The marker that tells the Unix-like operating system to look at the next path for an interpreter
- ./bin/bash: The absolute path to the Bash shell executable on your system.

EX\
bash#!/bin/bash
echo "Hello, World!"
 
EX\
bash#!/bin/bash
touch file.txt
echo "1" > file.txt
echo "2" >> file.txt
echo "3" >> file.txt

Variables
---------
EX\ 
x=1
y="Hi"
echo $x
echo $y

Read
-------
echo "Please enter your name"
read name
echo "Welcome" $name
---------------------------

Arithmetic Operators
---------------------
expr using to Execute Arithmetic Operators.
Integers numbers
EX\

x=5
y=10
echo `expr $x + $y`
echo `expr $x - $y`
echo `expr $x \* $y`
echo `expr $x / $y`

with the decimals we using bc but first you should be sure it's installed
apt get install bc
EX\

x=5.2
y=10.4
echo `expr $x + $y | bc`
echo `expr $x - $y | bc`
echo `expr $x \* $y | bc`
echo `expr $x / $y | bc`
