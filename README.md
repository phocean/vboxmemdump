## vboxmemdump

`vboxmemdump` is a bash script that automates the process of dumping the live memory from a running VirtualBox guest.

The generated raw image can be used straightfully with [Volatility](https://www.volatilityfoundation.org/).

The script is mostly based on the [work](https://gist.github.com/andreafortuna/fa627fb06e8ddb509c0b5b244d07433e#file-vboxmemdump-sh) by [andreafortuna](https://github.com/andreafortuna).
It has only a few cosmetics improvements, and I plan to maintain this.

So all the credit goes to him: many thanks!

## Usage

```bash
➤  vboxmemdump.sh 

[!] Please run '/usr/local/bin//vboxmemdump.sh <VM name>


➤  vboxmemdump.sh WinXP

[+] Dumping memory to file:	WinXP-2018-09-23T11:59:46+02:00.elf
[+] Raw memory offset:	0x000024f0
[+] Raw memory size:	0x10000000
[+] Extracting raw memory to file: WinXP-2018-09-23T11:59:46+02:00.raw
[+] Cleaning up.
[+] Done, exiting.


➤  vol -f WinXP-2018-09-23T11:59:46+02:00.raw pslist
Volatility Foundation Volatility Framework 2.6
Offset(V)  Name                    PID   PPID   Thds     Hnds   Sess  Wow64 Start                          Exit                          
---------- -------------------- ------ ------ ------ -------- ------ ------ ------------------------------ ------------------------------
0x81bcc830 System                    4      0     54      271 ------      0                                                              
0x81843ad8 smss.exe                536      4      3       19 ------      0 2018-09-21 06:51:00 UTC+0000                                 
0x8180bda0 csrss.exe               600    536     11      389      0      0 2018-09-21 06:51:00 UTC+0000                                 
0x817e8d18 winlogon.exe            624    536     17      448      0      0 2018-09-21 06:51:01 UTC+0000                                 
0x817d7bd8 services.exe            668    624     16      355      0      0 2018-09-21 06:51:01 UTC+0000                                 
0x817d3880 lsass.exe               680    624     22      367      0      0 2018-09-21 06:51:01 UTC+0000                                 
0x817b8a10 VBoxService.exe         840    668      8      106      0      0 2018-09-21 06:51:02 UTC+0000                                 
0x817af440 svchost.exe             884    668     22      213      0      0 2018-09-21 06:51:02 UTC+0000                                 
0x81793c88 svchost.exe             976    668      8      252      0      0 2018-09-21 06:51:02 UTC+0000                                 
0x817882d0 svchost.exe            1068    668     68     1397      0      0 2018-09-21 06:51:02 UTC+0000                                 
0x81780020 svchost.exe            1112    668      4       57      0      0 2018-09-21 06:51:02 UTC+0000                                 
0x81773020 svchost.exe            1268    668     12      168      0      0 2018-09-21 06:51:03 UTC+0000                                 
0x81764350 spoolsv.exe            1348    668     11      128      0      0 2018-09-21 06:51:04 UTC+0000                                 
0x81741020 svchost.exe            1568    668      5      108      0      0 2018-09-21 06:51:12 UTC+0000                                 
0x8173ad08 svchost.exe            1600    668      3       78      0      0 2018-09-21 06:51:12 UTC+0000                                 
0x81737360 IPROSetMonitor.        1640    668      2       38      0      0 2018-09-21 06:51:12 UTC+0000                                 
0x816efb70 alg.exe                 292    668      6      107      0      0 2018-09-21 06:51:17 UTC+0000                                 
0x816cb020 explorer.exe           1012    548     13      655      0      0 2018-09-21 06:51:18 UTC+0000                                 
0x8170c730 rundll32.exe           1540   1012      4       74      0      0 2018-09-21 06:51:20 UTC+0000                                 
0x81694348 VBoxTray.exe           1576   1012      7       83      0      0 2018-09-21 06:51:20 UTC+0000                                 
0x81693a70 GoogleUpdate.ex        1656   1012      6      147      0      0 2018-09-21 06:51:20 UTC+0000                                 
0x816ba9e8 iexplore.exe           3688   1012     11      426      0      0 2018-09-21 06:54:01 UTC+0000                                 
0x81652da0 ctfmon.exe             3816   3688      1       81      0      0 2018-09-21 06:54:01 UTC+0000                                 
0x8167b580 iexplore.exe           3828   3688     10      386      0      0 2018-09-21 06:54:01 UTC+0000                                 
0x81644190 cmd.exe                 376   1012      1       32      0      0 2018-09-21 06:55:07 UTC+0000                                 
0x816fe020 RegistryChanges        2268   1012      1       41      0      0 2018-09-21 06:56:14 UTC+0000 
```
