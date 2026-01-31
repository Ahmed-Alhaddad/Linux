
# Linux Basics — Clear Command Guide

---

## 1. Introduction (Basic System Info)

```bash
uname -a        # Show kernel and system info
hostname        # Show system name
uptime          # Show how long system is running
whoami          # Show current user
```

---

## 2. Linux Distributions

```bash
cat /etc/os-release   # Show Linux distribution info
lsb_release -a        # Detailed distro info (if available)
```

---

## 3. Linux Shell

```bash
echo $SHELL     # Show current shell
bash            # Start bash shell
zsh             # Start zsh shell
exit            # Exit current shell
```

---

## 4. Navigation in Directories

```bash
pwd             # Show current directory
ls              # List files
ls -la          # List all files (including hidden)
cd /path        # Change directory
cd ..           # Move up one directory
cd ~            # Go to home directory
```

---

## 5. File and Directory Operations

```bash
touch file.txt          # Create empty file
mkdir folder            # Create directory
mkdir -p a/b/c          # Create nested directories
cp file1 file2          # Copy file
mv file1 file2          # Move or rename file
rm file.txt             # Delete file
rm -r folder             # Delete directory
```

---

## 6. Searching Files and Directories

```bash
find / -name file.txt       # Find file by name
locate file.txt             # Fast search (needs updatedb)
which ls                    # Show command location
whereis python              # Show binary locations
```

---

## 7. Text Editing

```bash
nano file.txt       # Simple text editor
vi file.txt         # Advanced editor
cat file.txt        # Display file content
less file.txt       # View file page by page
head file.txt       # Show first lines
tail file.txt       # Show last lines
```

---

## 8. Filters (Text Processing)

```bash
grep "word" file.txt        # Search text
sort file.txt               # Sort lines
uniq file.txt               # Remove duplicates
wc file.txt                 # Count lines/words
cut -d: -f1 /etc/passwd     # Extract columns
```

---

## 9. Package Management

### Debian / Ubuntu

```bash
sudo apt update             # Update package list
sudo apt upgrade            # Upgrade packages
sudo apt install nginx      # Install package
sudo apt remove nginx       # Remove package
```

### Red Hat / Fedora

```bash
sudo dnf install nginx
sudo dnf remove nginx
```

---

## 10. User Management

```bash
useradd username            # Create user
passwd username             # Set password
usermod -aG sudo username   # Add user to sudo group
userdel username            # Delete user
```

---

## 11. Group Management

```bash
groupadd groupname          # Create group
groups username             # Show user groups
groupdel groupname          # Delete group
```

---

## 12. Permissions

```bash
ls -l                       # View permissions
chmod 755 file              # Change permissions
chown user:group file       # Change ownership
```

---

## 13. Process Management

```bash
ps aux                      # Show running processes
top                         # Live process monitor
htop                        # Advanced monitor
kill PID                    # Kill process
killall process_name        # Kill by name
```

---

## 14. Network Management

```bash
ip a                        # Show IP addresses
ping google.com             # Test connectivity
ss -tuln                    # Show open ports
curl http://example.com     # Fetch web data
wget URL                    # Download file
```

---
