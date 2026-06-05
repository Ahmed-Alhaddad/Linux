# Bash Scripting & Linux File Permissions

## Linux File Permissions

### Ownership of Linux Files

Every file and directory in Linux has three ownership categories:

| User (Owner)      | Group                       | Other (Everyone Else) |
| ----------------- | --------------------------- | --------------------- |
| Owner of the file | Users in the assigned group | All other users       |

### Permission Types

| Permission | Symbol | Description                  |
| ---------- | ------ | ---------------------------- |
| Read       | `r`    | View file contents           |
| Write      | `w`    | Modify file contents         |
| Execute    | `x`    | Run file as a program/script |

### File Types

| Symbol | Type         |
| ------ | ------------ |
| `-`    | Regular file |
| `d`    | Directory    |

### Example Permission Set

```text
-rwxr-xr--
```

Breakdown:

| User  | Group | Others |
| ----- | ----- | ------ |
| `rwx` | `r-x` | `r--`  |

Meaning:

* User: Read, Write, Execute
* Group: Read, Execute
* Others: Read only

---

# chmod Command

Used to change file permissions.

## Syntax

```bash
chmod permissions filename
```

There are two methods:

---

## 1. Absolute Mode (Octal Numbers)

| Number | Permission |
| ------ | ---------- |
| 0      | `---`      |
| 1      | `--x`      |
| 2      | `-w-`      |
| 3      | `-wx`      |
| 4      | `r--`      |
| 5      | `r-x`      |
| 6      | `rw-`      |
| 7      | `rwx`      |

### Example

```bash
chmod 764 file.txt
```

Meaning:

| User    | Group   | Others  |
| ------- | ------- | ------- |
| 7 = rwx | 6 = rw- | 4 = r-- |

---

## 2. Symbolic Mode

### Operators

| Symbol | Meaning                 |
| ------ | ----------------------- |
| `+`    | Add permission          |
| `-`    | Remove permission       |
| `=`    | Assign exact permission |

### Targets

| Symbol | Meaning |
| ------ | ------- |
| `u`    | User    |
| `g`    | Group   |
| `o`    | Others  |
| `a`    | All     |

### Examples

Give others full permissions:

```bash
chmod o=rwx file.txt
```

Add execute permission to group:

```bash
chmod g+x file.txt
```

Remove write permission from others:

```bash
chmod o-w file.txt
```

---

# Programming Using Bash

Bash scripts usually end with:

```text
.sh
```

Example:

```text
file.sh
```

### Running a Script

Using Bash:

```bash
bash file.sh
```

Direct execution (requires execute permission):

```bash
./file.sh
```

---

# Shebang (`#!/bin/bash`)

The line below is called a **Shebang** (or **Hashbang**):

```bash
#!/bin/bash
```

It tells Linux to execute the script using the GNU Bash shell.

**Important:** It must be the first line in the script.

## Anatomy

### `#!`

Tells the operating system to use an interpreter.

### `/bin/bash`

Absolute path to the Bash executable.

---

## Example 1

```bash
#!/bin/bash

echo "Hello, World!"
```

Output:

```text
Hello, World!
```

---

## Example 2

```bash
#!/bin/bash

touch file.txt

echo "1" > file.txt
echo "2" >> file.txt
echo "3" >> file.txt
```

### Operators

| Operator | Description           |
| -------- | --------------------- |
| `>`      | Create/overwrite file |
| `>>`     | Append to file        |

Result:

```text
1
2
3
```

---

# Variables

Variables store data.

## Example

```bash
x=1
y="Hi"

echo $x
echo $y
```

Output:

```text
1
Hi
```

---

# User Input (`read`)

Used to receive input from the user.

## Example

```bash
echo "Please enter your name:"
read name

echo "Welcome $name"
```

Example Output:

```text
Please enter your name:
Ahmed
Welcome Ahmed
```

---

# Arithmetic Operators

For integer calculations, use `expr`.

## Integer Example

```bash
x=5
y=10

echo `expr $x + $y`
echo `expr $x - $y`
echo `expr $x \* $y`
echo `expr $x / $y`
```

Output:

```text
15
-5
50
0
```

---

# Decimal Calculations Using `bc`

`expr` only supports integers.

For floating-point calculations, install and use `bc`.

## Install bc

Ubuntu/Debian:

```bash
sudo apt install bc
```

---

## Example

```bash
x=5.2
y=10.4

echo "$x + $y" | bc
echo "$x - $y" | bc
echo "$x * $y" | bc
echo "scale=2; $x / $y" | bc
```

Output:

```text
15.6
-5.2
54.08
0.50
```

---

# Quick Bash Cheat Sheet

## File Permissions

```bash
chmod 755 script.sh
chmod u+x script.sh
chmod g-w file.txt
```

## Run Scripts

```bash
bash script.sh
./script.sh
```

## Variables

```bash
name="Ahmed"
echo $name
```

## Read Input

```bash
read name
```

## Integer Math

```bash
expr 5 + 10
```

## Decimal Math

```bash
echo "5.2 + 10.4" | bc
```

## Create File

```bash
touch file.txt
```

## Write to File

```bash
echo "Hello" > file.txt
```

## Append to File

```bash
echo "World" >> file.txt
```
