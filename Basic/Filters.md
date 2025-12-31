
````markdown
# Linux Filters and Text Processing

## Filters

Filters are programs that take plain text (stored in a file or produced by another program) as standard input, transform it into a meaningful format, and then return it as standard output. Linux has a multitude of filters.

---

## Filtering and Pipe (`|`) Logic

In Linux, the output of one command can be the input of another command. The mechanism providing this is called **Pipeline** and is shown with the `|` sign.

### How Does It Work?

Think of it like a production line in a factory:

1. **Raw Material:** Text read from a file.  
2. **Machine 1 (Command 1):** Reads and processes the text (e.g., `cat`).  
3. **Conveyor Belt (Pipe `|`):** Carries the processed data to the next machine.  
4. **Machine 2 (Command 2):** Filters the incoming data (e.g., `grep`).  
5. **Product:** The filtered result appearing on the screen.  

Thanks to this, simple commands can combine to perform very complex tasks.

---

## 1. Redirection

Every program in Linux has 3 doors:

| Door | Description |
|------|-------------|
| Input (STDIN - 0) | Keyboard |
| Output (STDOUT - 1) | Screen |
| Error (STDERR - 2) | Error messages (Screen) |

We can redirect these doors to files:

| Operator | Description | Example |
|----------|-------------|---------|
| `>` | Write output to file (deletes old content) | `ls > list.txt` |
| `>>` | Append output to end of file | `echo "Last line" >> note.txt` |
| `2>` | Saves only errors to file | `ls /nonexistent_directory 2> error.txt` |
| `<` | Gives file as input to command | `wc -l < list.txt` |
| `|` | Sends output of first command to second (Pipe) | `cat file | grep "search"` |

**Example: Searching While Hiding Errors**

```bash
find / -name "secret_file" 2> /dev/null
````

---

## 2. Text Processing Tools

Let's consider a file `names.txt`:

```
Ali Veli
Ayşe Yılmaz
Mehmet Öz
Ali Veli
```

### Cat

Display the contents of one or more files:

```bash
cat /etc/ssh/sshd_config
```

### Head

View the first `n` lines of a file (default: 10):

```bash
head -n 3 /var/log/apache2/access.log
```

### Tail

View the last `n` lines of a file (default: 10):

```bash
tail -n 3 /var/log/auth.log
```

**Live Log Monitoring:**

```bash
tail -f /var/log/syslog
```

### Sort

Sort file contents alphabetically:

```bash
sort names.txt
```

### Uniq

Filter consecutive duplicate lines:

```bash
sort names.txt | uniq
```

Show count of repetitions:

```bash
sort names.txt | uniq -c
```

### Grep

Search for specific text strings:

```bash
grep '192.168.1.1' /var/log/apache2/access.log
```

**Advanced grep:**

* `-i`: Case insensitive
* `-v`: Show non-matching
* `-r`: Recursive search

### Wc (Word Count)

Get lines, words, and character counts:

```bash
wc /etc/passwd
```

### Cut

Split lines and extract specific fields:

```bash
cut -d ":" -f 1 /etc/passwd | head -n 3
```

### Awk

Powerful column-based text processing:

```bash
awk '{print $1}' names.txt
```

Advanced example (process list):

```bash
ps aux | awk '{print $1, $11}' | head -n 3
```

### Sed

Stream editor for filtering and transforming text:

```bash
sed 's/Alice/George/' names.txt
```

Permanent changes: add `-i` flag.

### Tee

Print output to screen **and** write to file:

```bash
echo "Log Entry" | tee log.txt
```

### Diff

Show differences between files:

```bash
diff file1.txt file2.txt
```

### Tr

Perform character replacements:

```bash
echo "hello" | tr "a-z" "A-Z"
```



