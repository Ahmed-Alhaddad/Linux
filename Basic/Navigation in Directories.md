
# Navigation in Directories (Linux Basics)

In a graphical desktop environment, you navigate folders using a mouse.
In Linux, navigation is usually done through the **terminal**, using commands to move between directories and work with files.

This section covers the basics of Linux navigation:

* Understanding directories and paths
* Moving between directories
* Listing files and folders
* Useful shortcuts and tools

---

## What Is a Directory and a Path?

In Linux, **everything is treated as a file**, and files are organized inside **directories**.

### Directory

A directory is simply a container for files and other directories (folders).

### Root Directory (`/`)

* The **root directory (`/`)** is the top of the Linux file system.
* Unlike Windows (which uses drives like `C:\`), Linux has **one single root**.

### Path

A **path** is the address of a file or directory.

#### Absolute Path

* Starts from the root directory (`/`)
* Always gives the full location
* Example:

  ```
  /home/john/pictures/holiday.jpg
  ```

#### Relative Path

* Starts from your **current location**
* Does not begin with `/`
* Example:

  ```
  pictures/holiday.jpg
  ```

---

## 1. Where Am I? (`pwd`)

The `pwd` (**Print Working Directory**) command shows your current location in the file system.

### Usage

```bash
user@hackerbox:~$ pwd
/home/user
```

This means you are currently inside the `/home/user` directory.

### Related Commands

#### `realpath`

Shows the full (absolute) path of a file.

```bash
user@hackerbox:~$ realpath notes.txt
/home/user/notes.txt
```

#### `basename`

Returns only the file name.

```bash
user@hackerbox:~$ basename /home/user/notes.txt
notes.txt
```

#### `dirname`

Returns only the directory path.

```bash
user@hackerbox:~$ dirname /home/user/notes.txt
/home/user
```

---

## 2. Changing Directories (`cd`)

The `cd` (**Change Directory**) command is used to move between directories.

### Common `cd` Commands

| Command         | Description                   |
| --------------- | ----------------------------- |
| `cd directory`  | Move into a directory         |
| `cd /full/path` | Move using an absolute path   |
| `cd ..`         | Go up one directory           |
| `cd ~`          | Go to home directory          |
| `cd -`          | Go back to previous directory |

### Examples

#### Go Up One Directory

```bash
user@hackerbox:/var/www$ cd ..
user@hackerbox:/var$
```

#### Go to Home Directory

```bash
user@hackerbox:/var/log$ cd ~
user@hackerbox:~$
```

No matter where you are, `cd ~` takes you to `/home/username`.

#### Return to Previous Directory

```bash
user@hackerbox:~$ cd /etc
user@hackerbox:/etc$ cd -
/home/user
user@hackerbox:~$
```

---

## 3. Listing Files and Directories (`ls`)

The `ls` (**List**) command displays the contents of a directory.

### Common `ls` Options

| Option | Description                                  |
| ------ | -------------------------------------------- |
| `-l`   | Long format (permissions, owner, size, date) |
| `-a`   | Show hidden files                            |
| `-h`   | Human-readable sizes                         |
| `-t`   | Sort by modification time                    |
| `-r`   | Reverse order                                |
| `-R`   | Recursive listing                            |
| `-S`   | Sort by file size                            |

---

### Example 1: Detailed Listing (`ls -l`)

```bash
user@hackerbox:~$ ls -l
```

Output columns:

| Column         | Meaning                   |
| -------------- | ------------------------- |
| `drwxr-xr-x`   | File type and permissions |
| `2`            | Number of hard links      |
| `user`         | Owner                     |
| `users`        | Group                     |
| `4096`         | File size (bytes)         |
| `Jul 29 08:24` | Last modification date    |
| `Desktop`      | File or directory name    |

* `d` = directory
* `-` = file

---

### Example 2: Hidden Files (`ls -la`)

```bash
user@hackerbox:~$ ls -la
```

* Files starting with `.` are hidden (e.g. `.bashrc`)
* `.` means current directory
* `..` means parent directory

---

### Example 3: Sort by Time (`ls -lt`)

```bash
user@hackerbox:~$ ls -lt
```

The most recently modified file appears at the top.

---

### Example 4: Recursive Listing (`ls -R`)

```bash
user@hackerbox:~$ ls -R
```

Lists the contents of the current directory **and all subdirectories**.

---

### Example 5: Sort by Size (`ls -lS`)

```bash
user@hackerbox:~$ ls -lS
```

Largest files appear first.

---

## 4. Directory Stack (`pushd` and `popd`)

These commands let you **temporarily move to another directory and return easily**.

### Example

```bash
user@hackerbox:~/project$ pushd /var/log
/var/log ~/project

user@hackerbox:/var/log$ popd
~/project
```

* `pushd` saves your current location and moves you
* `popd` returns you to the saved location

---

## 5. Tree View (`tree`)

The `tree` command shows directories in a visual, tree-like structure.

```bash
user@hackerbox:~$ tree -L 2
```

* Displays directories up to **2 levels deep**
* Useful for understanding folder structure at a glance

