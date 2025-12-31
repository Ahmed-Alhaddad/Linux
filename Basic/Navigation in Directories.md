

# File and Directory Operations

## What Is a File and an Inode?

Linux follows the philosophy: **“Everything is a file.”**
Text files, images, and even hardware devices (keyboard, disks) are represented as files.

### Inode (Index Node)

An **inode** is the identity card of a file.
When a file is created, **two things** are stored on disk:

* **Data** – The actual contents of the file
* **Inode** – Metadata about the file, including:

  * Owner
  * File size
  * Permissions
  * Timestamps
  * Location on disk

> The **file name is only a label** that points to the inode.
> The real identity of the file is the inode number.

---

## 1. Creating Files (`touch`)

The `touch` command updates timestamps if the file exists, or creates an empty file if it does not.

```bash
user@hackerbox:~$ touch notes.txt
user@hackerbox:~$ ls -l notes.txt
-rw-r--r-- 1 user user 0 Aug 01 12:00 notes.txt
```

A file with size `0` bytes was created.

### Batch File Creation

```bash
user@hackerbox:~$ touch file{1..3}.txt
user@hackerbox:~$ ls
file1.txt  file2.txt  file3.txt
```

Using `{}` allows creating multiple files at once.

---

## 2. Creating Directories (`mkdir`)

```bash
user@hackerbox:~$ mkdir projects
```

### Creating Nested Directories (`-p`)

Normally, `mkdir a/b/c` fails if `a` does not exist.
The `-p` (parents) option creates the entire path.

```bash
user@hackerbox:~$ mkdir -p projects/python/app
user@hackerbox:~$ tree projects
projects
└── python
    └── app
```

All required parent directories were created automatically.

---

## 3. Copying Files and Directories (`cp`)

The `cp` command creates copies.

| Command                        | Description                  |
| ------------------------------ | ---------------------------- |
| `cp file.txt backup.txt`       | Copy a file                  |
| `cp -r dir/ backup_dir/`       | Copy a directory recursively |
| `cp -i file.txt target/`       | Ask before overwriting       |
| `cp --backup file.txt target/` | Backup existing file (`~`)   |

### Interactive Copy (`-i`)

```bash
user@hackerbox:~$ cp -i notes.txt /tmp/
cp: overwrite '/tmp/notes.txt'? y
```

Prevents accidental overwrites.

### Backup Copy (`--backup`)

```bash
user@hackerbox:~$ cp --backup notes.txt /tmp/
user@hackerbox:~$ ls /tmp/notes*
/tmp/notes.txt  /tmp/notes.txt~
```

The old file was renamed with `~`.

---

## 4. Moving and Renaming (`mv`)

Linux has no separate rename command.
The `mv` command handles both **moving** and **renaming**.

* Rename:

  ```bash
  mv old.txt new.txt
  ```
* Move:

  ```bash
  mv file.txt /tmp/
  ```

### Example: Moving a File

```bash
user@hackerbox:~$ mv notes.txt Documents/
user@hackerbox:~$ ls Documents/
notes.txt
```

The file was removed from the original location and placed in `Documents`.

---

## 5. Deleting Files and Directories (`rm`)

⚠️ **Warning:** There is no recycle bin in the Linux terminal.

| Command          | Description                   |
| ---------------- | ----------------------------- |
| `rm file.txt`    | Delete a file                 |
| `rm -i file.txt` | Ask before deleting           |
| `rm -r dir/`     | Delete directory and contents |
| `rm -rf dir/`    | Force delete (dangerous)      |
| `rmdir dir/`     | Delete empty directory only   |

### Safe Deletion (`-i`)

```bash
user@hackerbox:~$ rm -i important_doc.txt
rm: remove regular file 'important_doc.txt'? n
```

Using `-i` helps prevent mistakes.

### Deleting Directories (`-r`)

```bash
user@hackerbox:~$ rm -r projects/
```

The `-r` option is required for non-empty directories.

---

## 6. File Information and Inodes

### `file` – Detect File Type

```bash
user@hackerbox:~$ file /bin/bash
/bin/bash: ELF 64-bit LSB shared object, x86-64

user@hackerbox:~$ file notes.txt
notes.txt: ASCII text
```

The result is based on content, not file extension.

### `stat` – Detailed File Information

```bash
user@hackerbox:~$ stat notes.txt
```

Includes inode number, timestamps, permissions, and size.

---

## 7. File Links and Inodes

Every file has an **inode number**.
To view it:

```bash
user@hackerbox:~$ ls -i notes.txt
123456 notes.txt
```

### Hard Links

A **hard link** is another name pointing to the same inode.

* Deleting one name does not delete the data
* Works only within the same filesystem

```bash
user@hackerbox:~$ ln notes.txt hard_link.txt
user@hackerbox:~$ ls -li
123456 -rw-r--r-- 2 user user notes.txt
123456 -rw-r--r-- 2 user user hard_link.txt
```

Both files share the same inode.

---

### Soft Links (Symbolic Links)

A **soft link** is similar to a Windows shortcut.

* Points to a path, not the inode
* Breaks if the original file is deleted
* Can span different filesystems

```bash
user@hackerbox:~$ ln -s /var/www/html site_shortcut
user@hackerbox:~$ ls -li site_shortcut /var/www/html
```

The inode numbers are different because the link only stores a path.

---

## 8. Advanced Copying (`dd`)

The `dd` command performs **low-level copying**, commonly used for disk images.

### Example: Writing an ISO to a USB Drive

```bash
sudo dd if=linux.iso of=/dev/sdb bs=4M status=progress
```

| Option            | Meaning                     |
| ----------------- | --------------------------- |
| `if`              |  (Input File - ISO file)    |
| `of`              | (Output File - USB drive    |
| `bs`              | Block size (for speed).     |
| `status=progress` | Show progress bar           |

⚠️ **Warning:** Selecting the wrong output device can erase data.

---
