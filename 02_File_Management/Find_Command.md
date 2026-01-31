If you **forgot a Linux command**, there are a few built-in ways to *search, discover, and recall* it. Here are the most useful ones, from most practical to advanced:

---

## 🔍 1. Search commands by keyword (BEST option)

### `apropos`  *(searches man page descriptions)*

```bash
apropos copy
```

Example:

```bash
apropos network
```

This is the closest Linux equivalent to *“I forgot the command name”*.

> If `apropos` doesn’t work:

```bash
sudo mandb
```

---

## 📘 2. Browse related commands

### `man -k` (same as apropos)

```bash
man -k archive
```

---

## 🧠 3. Search your command history

### `history`

```bash
history | grep ssh
```

### Reverse search (VERY powerful)

Press:

```
Ctrl + r
```

Then start typing part of the command you remember.

---

## 📂 4. List all available commands

```bash
compgen -c
```

Search within them:

```bash
compgen -c | grep zip
```

---

## 🧪 5. Describe what a command does

Once you think you found it:

```bash
man rsync
```

or

```bash
rsync --help
```

---

## 🆚 PowerShell comparison

| PowerShell           | Linux               |
| -------------------- | ------------------- |
| `Get-Command *copy*` | `apropos copy`      |
| `Get-Help`           | `man`               |
| Command history      | `history`, `Ctrl+r` |

---

## ✅ Recommended workflow when you forget a command

1. `apropos <keyword>`
2. `Ctrl + r`
3. `compgen -c | grep <keyword>`