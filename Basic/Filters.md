

# Linux Filters and Text Processing

## Filters

Filters are programs that take plain text (stored in a file or produced by another program) as standard input, transform it into a meaningful format, and return it as standard output. Linux has a multitude of filters.

---

## Filtering and Pipe (`|`) Logic

In Linux, the output of one command can be the input of another command. This mechanism is called a **pipeline** and is shown with the `|` sign.

### How Does It Work?

Think of it like a production line in a factory:

1. **Raw Material:** Text read from a file.
2. **Machine 1 (Command 1):** Reads and processes the text (e.g., `cat`).
3. **Conveyor Belt (Pipe `|`):** Carries the processed data to the next machine.
4. **Machine 2 (Command 2):** Filters the incoming data (e.g., `grep`).
5. **Product:** The filtered result appears on the screen.

Thanks to this, simple commands can combine to perform very complex tasks.

---

## 1. Redirection

Every Linux program has 3 "doors":

| Door   | Name       | Default  |
| ------ | ---------- | -------- |
| Input  | STDIN (0)  | Keyboard |
| Output | STDOUT (1) | Screen   |
| Error  | STDERR (2) | Screen   |

We can redirect these doors to files.

| Operator | Description                       | Example                        |           |                |
| -------- | --------------------------------- | ------------------------------ | --------- | -------------- |
| `>`      | Write output to file (overwrites) | `ls > list.txt`                |           |                |
| `>>`     | Append output to file             | `echo "Last line" >> note.txt` |           |                |
| `2>`     | Redirect errors to file           | `ls /nonexistent 2> error.txt` |           |                |
| `<`      | Give file as input to command     | `wc -l < list.txt`             |           |                |
| `        | `                                 | Pipe output to another command | `cat file | grep "search"` |

### Example: Searching While Hiding Errors

```bash
find / -name "secret_file" 2> /dev/null
```

Only the found result is visible; error messages are hidden.

---

## 2. Text Processing Tools

Suppose we have `names.txt`:

```
Ali Veli
Ayşe Yılmaz
Mehmet Öz
Ali Veli
```

### Cat

Displays the contents of one or more text files.

```bash
cat /etc/ssh/sshd_config
```

---

### Head

Shows the first `n` lines of a file.

```bash
head -n 3 /var/log/apache2/access.log
```

---

### Tail

Shows the last `n` lines of a file.

```bash
tail -n 3 /var/log/auth.log
```

Live monitoring:

```bash
tail -f /var/log/syslog
```

---

### Sort

Sorts file content alphabetically.

```bash
sort names.txt
```

---

### Uniq

Filters consecutive duplicate lines.

```bash
sort names.txt | uniq
```

Count occurrences:

```bash
sort names.txt | uniq -c
```

---

### Grep

Searches for specific text strings.

```bash
grep '192.168.1.1' /var/log/apache2/access.log
```

Advanced:

* `-i` : Case insensitive
* `-v` : Exclude matches
* `-r` : Recursive search

---

### Wc (Word Count)

Counts lines, words, and characters.

```bash
wc /etc/passwd
```

---

### Cut

Splits lines and selects columns.

```bash
cut -d ":" -f 1 /etc/passwd | head -n 3
```

---

### Awk

Powerful column-based text processor.

```bash
awk '{print $1}' names.txt
```

Example: extract user and command from `ps aux`:

```bash
ps aux | awk '{print $1, $11}' | head -n 3
```

---

### Sed

Stream editor for text transformation.

```bash
sed 's/Alice/George/' names.txt
```

Use `-i` to edit files in place.

---

### Tee

Print output to screen **and** write to a file.

```bash
echo "Log Entry" | tee log.txt
```

---

### Diff

Shows differences between two files.

```bash
diff file1.txt file2.txt
```

---

### Tr

Character replacement.

```bash
echo "hello" | tr "a-z" "A-Z"
```

---


````markdown
# Linux Commands Reference

This document provides brief explanations and examples of commonly used Linux commands related to system administration, scheduling, services, and monitoring.

---

## apropos
Finds commands related to a keyword by searching manual page descriptions.

- **Example:**
  ```bash
  apropos find
````

* **Explanation:** Displays a list of commands whose descriptions contain the word *find*.

---

## locate

Quickly finds files by name using a prebuilt database.

* **Example:**

  ```bash
  locate filename
  ```
* **Explanation:** Faster than `find`, but relies on an updated file index (updated via `updatedb`).

---

## crontab

Used to create, view, and manage cron jobs.

* **Common Commands:**

  ```bash
  crontab -l
  crontab -u root -l
  crontab -e
  ```
* **Explanation:**

  * `crontab -l` lists the current user’s cron jobs.
  * `crontab -u root -l` lists cron jobs for the root user.
  * `crontab -e` opens the crontab file for editing.

Cron jobs are scheduled tasks executed automatically by the cron daemon at specified times or intervals.

---

## systemctl

Manages systemd services and timers.

### List timers

```bash
systemctl list-timers
systemctl list-timers --all
```

* **Explanation:**
  Displays active timers and their next execution time. The `--all` flag includes inactive timers.

systemd timer units provide a mechanism for scheduling jobs based on time, date, or system events. Timer unit files use the `.timer` extension and require a corresponding `.service` file.

---

## ps

Displays information about running processes.

* **Example:**

  ```bash
  ps aux
  ```
* **Explanation:** Shows detailed information about all running processes, including CPU and memory usage.

---

## showmount

Queries an NFS server for exported file systems.

* **Example:**

  ```bash
  showmount -e 10.0.2.155
  ```
* **Explanation:**
  Displays NFS exports available from the specified server.

**Sample Output:**

```text
Export list for 10.0.2.155:
/srv/nfs 172.16.0.0/12,10.0.0.0/8,192.168.0.0/16
```

`showmount` is useful for identifying shared directories on NFS servers.

---

## find (SetUID Files)

Finds files with the SetUID permission bit set.

```bash
find / -type f -perm -4000 2>/dev/null
```

* **Explanation:**
  Searches the filesystem for files that run with elevated privileges. This is commonly used in security auditing and system reviews.

---

## Spawn a TTY Shell

Used to create an interactive shell session.

```bash
python -c 'import pty; pty.spawn("/bin/bash")'
```

* **Explanation:**
  Spawns a new pseudo-terminal using Python, allowing for improved shell interaction in limited environments such as remote sessions or restricted shells.

---

## Notes

These commands are commonly used in Linux administration, troubleshooting, automation, and security-focused labs. They are useful for understanding system behavior and practicing hands-on skills in controlled environments.


