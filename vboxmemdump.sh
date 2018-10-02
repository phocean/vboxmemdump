#!/bin/bash
#Simple script for VirtuaBox memory extraction
# Usage: vboxmemdump.sh <VM name>

set -e
PATH=$(/usr/bin/getconf PATH)

if [[ ! $1 ]];
then
  echo -e "\n[!] Please run '$0 <VM name>\n"
  exit 1
fi

DATE=$(date --iso-8601=seconds)
FILENAME=$1-$DATE

echo -e "\n[+] Dumping memory to file:\t$FILENAME.elf"
VBoxManage debugvm $1 dumpvmcore --filename=$FILENAME.elf

SIZE=0x$(objdump -h $FILENAME.elf | awk '/\sload1\s/ {print $3}')
OFFSET=0x$(objdump -h $FILENAME.elf | awk '/\sload1\s/ {print $6}')
echo -e "[+] Raw memory offset:\t$OFFSET"
echo -e "[+] Raw memory size:\t$SIZE"

echo -e "[+] Extracting raw memory to file: $FILENAME.raw"
head -c $(($SIZE+$OFFSET)) $FILENAME.elf|tail -c +$(($OFFSET+1)) > $FILENAME.raw
echo -e "[+] Cleaning up."
rm $FILENAME.elf
echo -e "[+] Done, exiting."
exit 0
