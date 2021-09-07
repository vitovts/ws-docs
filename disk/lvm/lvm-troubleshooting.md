# lvm-troubleshooting

# 1. LVM: DEVICE /DEV/SDX EXCLUDED BY FILTER

```
If you have created a new VD using a disk or group of disks that were previously partitioned, you may see a message like this when you try to initialize the virtual disk for LVM.
# pvcreate /dev/sdd
  Device /dev/sdd excluded by a filter.
If filter is correct (/etc/lvm/lvm.conf) and old partition table information found on the disk, you can wipe out the old partition information with "wipefs".
# wipefs -a /dev/sdd
/dev/sdd: 2 bytes were erased at offset 0x000001fe (dos): 55 aa
/dev/sdd: calling ioclt to re-read partition table: Success
Now, try pvcreate command again.
# pvcreate /dev/sdd
Physical volume "/dev/sdd" successfully created.
```
