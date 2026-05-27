Here’s a simple beginner-to-practical GitHub + Git command cheat sheet for penetration testing, coding, notes, and labs.

---

# What is Git and GitHub?

* **Git** = version control tool on your PC.
* **GitHub** = website to store/share projects using Git.

You use Git commands in terminal/CMD.

---

# Install Git

## Windows

Download from:

[Git Official Website](https://git-scm.com?utm_source=chatgpt.com)

After install:

```bash
git --version
```

---

# First-Time Setup

Set your name and email:

```bash
git config --global user.name "YourName"
git config --global user.email "youremail@example.com"
```

Check config:

```bash
git config --list
```

---

# Important Git Concepts

| Concept           | Meaning                  |
| ----------------- | ------------------------ |
| Repository (repo) | Project folder           |
| Commit            | Save point               |
| Branch            | Separate working version |
| Clone             | Download repo            |
| Push              | Upload changes           |
| Pull              | Download updates         |
| Merge             | Combine changes          |

---

# Basic Workflow (MOST IMPORTANT)

This is the main workflow you’ll use daily:

```bash
git init
git add .
git commit -m "message"
git push
```

---

# 1. Create New Git Repository

Inside project folder:

```bash
git init
```

Creates hidden `.git` folder.

---

# 2. Check Files Status

```bash
git status
```

Shows:

* modified files
* new files
* staged files

---

# 3. Add Files

Add one file:

```bash
git add file.txt
```

Add all files:

```bash
git add .
```

---

# 4. Commit Changes

```bash
git commit -m "Added login page"
```

Think of commit as snapshot/save point.

---

# 5. Connect Local Project to GitHub

Create repository on:

[GitHub](https://github.com?utm_source=chatgpt.com)

Then connect:

```bash
git remote add origin https://github.com/USERNAME/REPO.git
```

Check remote:

```bash
git remote -v
```

---

# 6. Push Code to GitHub

First push:

```bash
git push -u origin main
```

After that:

```bash
git push
```

---

# 7. Clone Repository

Download project from GitHub:

```bash
git clone https://github.com/user/repo.git
```

Example:

* pentest tools
* notes
* CTF writeups

---

# 8. Pull Updates

Get latest changes:

```bash
git pull
```

---

# 9. See Commit History

```bash
git log
```

Short version:

```bash
git log --oneline
```

---

# 10. Create Branch

```bash
git branch test
```

Switch branch:

```bash
git checkout test
```

Or both together:

```bash
git checkout -b test
```

---

# 11. Merge Branch

Go to main branch:

```bash
git checkout main
```

Merge:

```bash
git merge test
```

---

# 12. Delete Branch

```bash
git branch -d test
```

---

# 13. Undo Changes

## Before commit

Discard file changes:

```bash
git checkout -- file.txt
```

## Unstage file

```bash
git reset file.txt
```

## Undo last commit

```bash
git reset --soft HEAD~1
```

---

# 14. Ignore Files

Create `.gitignore`

Example:

```txt
*.log
*.tmp
venv/
__pycache__/
```

Useful for:

* Burp logs
* temp files
* Python virtual envs

---

# 15. Useful Daily Commands

| Command               | Usage            |
| --------------------- | ---------------- |
| `git status`          | Check changes    |
| `git add .`           | Add all          |
| `git commit -m "msg"` | Save             |
| `git push`            | Upload           |
| `git pull`            | Download updates |
| `git clone URL`       | Download repo    |
| `git log --oneline`   | History          |

---

# GitHub for Pentesting / Cybersecurity

Useful for:

* CTF writeups
* storing notes
* custom scripts
* recon tools
* lab reports
* portfolio projects

Example repositories:

* Python scripts
* Burp extensions
* PowerShell tools
* Active Directory labs

---

# Common Beginner Errors

## “fatal: not a git repository”

You forgot:

```bash
git init
```

---

## “nothing to commit”

No file changes yet.

---

## “rejected push”

Need latest updates first:

```bash
git pull
```

Then:

```bash
git push
```

---

# Recommended Learning

## Official Documentation

[Git Documentation](https://git-scm.com/doc?utm_source=chatgpt.com)

## Interactive Learning

[Learn Git Branching](https://learngitbranching.js.org?utm_source=chatgpt.com)

---

# Simple Real Example

```bash
mkdir pentest-notes
cd pentest-notes

git init

echo "# My Notes" > README.md

git add .
git commit -m "First commit"

git remote add origin https://github.com/user/pentest-notes.git

git push -u origin main
```

---

# Commands You Must Memorize First

```bash
git init
git status
git add .
git commit -m "message"
git push
git pull
git clone URL
git log --oneline
```

These cover most beginner/intermediate daily work.
