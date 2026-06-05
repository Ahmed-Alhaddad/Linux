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
 
 