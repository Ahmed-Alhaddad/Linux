
# Useful Terminal Commands

## `clear` — Clear the Screen

**What it does:**
Removes everything currently shown in the terminal and moves the cursor to the top.

**Why it’s useful:**
When your terminal gets messy, `clear` gives you a clean workspace.

**Example:**

```bash
user@hackerbox:~$ clear
```

**Result:**
All previous commands disappear (they are not deleted, just hidden).

---

## `history` — View Past Commands

**What it does:**
Shows a list of commands you previously ran in the terminal.

**Why it’s useful:**
Great for:

* remembering old commands
* re-running commands without typing again

**Example:**

```bash
user@hackerbox:~$ history
```

**Sample output:**

```text
 1  ls
 2  cd Documents
 3  pwd
 4  ping google.com
 5  clear
 6  whoami
```

### Re-run a command from history

Use `!number`

```bash
!4
```

This will re-run:

```bash
ping google.com
```

---

## `type` — What Kind of Command Is This?

**What it does:**
Tells you **how a command is implemented**.

It can be:

* an **alias** (shortcut)
* a **shell builtin**
* a **program file on disk**

**Examples:**

```bash
type ls
type cd
type grep
```

**Sample output:**

```text
ls is aliased to `ls --color=auto`
cd is a shell builtin
grep is /usr/bin/grep
```

**Meaning:**

* `ls` → alias (adds color automatically)
* `cd` → built into the shell
* `grep` → real program stored on disk

---

# Shell Configuration Files

## `.bashrc` / `.zshrc`

**What are these?**
Hidden files that run **every time you open a terminal**.

**Where they are:**

```text
/home/user/.bashrc
/home/user/.zshrc
```

**Which one to use:**

* Bash → `.bashrc`
* Zsh → `.zshrc`

---

## Example: Create a Shortcut (Alias)

### Goal

Type `c` instead of `clear`

### Steps

1. Open the config file:

```bash
nano ~/.bashrc
```

2. Add this line at the bottom:

```bash
alias c='clear'
```

3. Save and exit:

* `CTRL + O` → Enter
* `CTRL + X`

4. Reload the file:

```bash
source ~/.bashrc
```

### Test it:

```bash
c
```

✅ Screen clears using the shortcut.

---

# Environment Variables

**What are they?**
Variables that store system information used by programs and the shell.

---

## Common Environment Variables

| Variable | Meaning                        |
| -------- | ------------------------------ |
| `$HOME`  | Your home directory            |
| `$USER`  | Your username                  |
| `$PWD`   | Current directory              |
| `$SHELL` | Shell in use                   |
| `$PATH`  | Where Linux looks for commands |

---

## Viewing Variables

```bash
echo $HOME
echo $USER
echo $PWD
```

Example output:

```text
/home/user
user
/home/user/Desktop
```

### View PATH

```bash
printenv PATH
```

Example:

```text
/usr/local/bin:/usr/bin:/bin
```

**Important:**
Linux searches these folders **in order** when you run a command.

---

# Command Chaining Operators

These let you run **multiple commands on one line**.

---

## `;` — Run Commands One After Another

Runs the second command **no matter what**.

```bash
echo "Hello" ; date
```

---

## `&&` — Run Only If Successful

Second command runs **only if the first works**.

```bash
mkdir test && cd test
```

If `mkdir` fails → `cd` won’t run.

---

## `||` — Run Only If There Is an Error

Second command runs **only if the first fails**.

```bash
cd fakefolder || echo "Folder not found!"
```

---

# Shebang (`#!`) — Script Start

**What it does:**
Tells Linux **which program should run the script**.

---

## Example Bash Script

```bash
#!/bin/bash
echo "Hello World"
```

**Meaning:**
Run this file using `/bin/bash`.

---


