

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


