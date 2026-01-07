CLI Forensics & Data Cheat Sheet
🛠️ Data Manipulation
Command	Description	Example
base64	Encode/Decode data to/from Base64.	base64 -d file.txt
base58	Encode/Decode data to/from Base58.	base58 file.txt
strings	Find printable characters in binary.	strings -e s file.txt
tr	Translate/Replace characters (e.g., ROT13).	tr 'A-Za-z' 'N-ZA-Mn-za-m'
xxd	Create or reverse a Hex Dump.	xxd file.bin
uniq	Filter or find unique/repeated lines.	sort file | uniq -u
🔍 Forensics & Hidden Data
Command	Description	Example
steghide	Extract data hidden in images/audio.	steghide extract -sf image.jpg
exif	Show metadata in JPEG files.	exif image.jpg
diff	Compare two files for differences.	diff file1 file2
du	Estimate file space usage.	du -b -a | grep 1033
📦 Compression & System
Command	Description	Example
gunzip	Decompress .gz files.	gunzip file.gz
bunzip2	Decompress .bz2 files.	bunzip2 file.bz2
mktemp	Create a temporary file or directory.	mktemp
Useful One-Liners

    ROT13 Decode: echo "your_text" | tr 'A-Za-z' 'N-ZA-Mn-za-m'

    Show unique lines only: cat data.txt | sort | uniq -u

    Extract Steghide without prompt: steghide extract -sf file.jpg -p "password"

    Search for Base64-like strings in a binary: strings file.bin | grep "="