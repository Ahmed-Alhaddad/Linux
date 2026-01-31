# Command-Line Utilities Cheat Sheet

base64
Encode/decode data and print to standard output.

```
echo VEhNe2p1NTdfZDNjMGQzXzdoM19iNDUzfQ== > file.txt
cat file.txt
base64 file.txt
base64 -d file.txt
```
exif
```
Show EXIF information in JPEG files.

exif Extinction_1577976250757.jpg
```
steghide
```
Steghide is a steganography program that hides data within other files using least significant bits.

Features:

Supports bmp, jpeg, wav, au

Blowfish encryption

MD5 hashing of passphrases

Pseudo-random distribution of hidden data

Useful in digital forensics investigations.

steghide extract -sf Extinction_1577976250757.jpg
```
du
```
Estimate file space usage.

du -b -a | grep 1033
```
uniq
```
Report or omit repeated lines.

cat data.txt | sort | uniq -u
```
strings
```
Print strings of printable characters in files.

cat data.txt | strings -e s | grep =
```
tr
```
Translate or delete characters.

cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
```
xxd
```
Make a hexdump or reverse a hexdump.

xxd file.bin
xxd -r file.hex
```
mktemp
```
Create a temporary file or directory.

mktemp
mktemp -d
```
base58
```
Encode/decode data and print to standard output.

base58 encode file.txt
base58 decode file.txt
```
gunzip
```
Decompress .gz files.

gunzip file.gz
```
bunzip2
```
Decompress .bz2 files.

bunzip2 file.bz2
```
diff
```
Compare files line by line.

diff file1 file2
```
