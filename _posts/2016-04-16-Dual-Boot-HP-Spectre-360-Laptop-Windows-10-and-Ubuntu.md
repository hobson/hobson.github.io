---
layout: post
title: Dual Boot HP Spectr 360 Laptop
---

I love my new Spectre laptop with the fold-back screen. It'll make an awesome picture frame once it gets outdated. But to keep it relevant I configured it for dual boot with Ubuntu (only keeping Windows 10 because Quick Books still hasn't gotten with the Open Source program).

The Ubuntu stack exchange answer was too vague, verbose, and incomplete. It was just wrong in some places, at least for me. So here's what worked for me.

## First Things First

1. Download USB 14.04 64-bit Desktop iso
2. Use "Startup Disk Creator" to build a live USB from the iso
  - don't get fancy with the 1-4 GB casper-rw partition it'll thrown the HP EFI boot loader for a loop, literally
  - use the max persistent storage allowed (4GB)
  - Whatever's left on the USB stick Fat32 partition you can use for file transfer/backup
3. Optional: test your USB stick
  - Hit F10 right after the power button to bring upt he boot manager
  - Put the USB pendrive (and USB CDROM drives) in the top slots
  - Save and exit the BIOS
  - shutdown
  - power on
  - Ubuntu 14.04 should boot
  - optionally:

    $ sudo apt-get updated
    $ sudo apt-get upgrade
    $ sudo apt-get install dropbox efibootmgr -y

  - sudo shutdown -h now


## Partition Windows Laptop Disk

 (not prerun or updated/upgraded)


Before resizing, gparted showed my partitions as:

/dev/sda1 fat32 SYSTEM 260MiB 65.47MiB 194.53MiB boot
/dev/sda2! unknown _ 16MiB --- --- msftres _
/dev/sda3 ntfs 228.11GiB 35.03GiB 13.80GiB msftdata
/dev/sda4 ntfs WINRE 694.0MiB 306.37MiB 387.63 MiB hidden|diag
/dev/sda5 ntfs RECOVERY 9.41GiB 8.21GiB 1.2GiB hidden|msftdata
unallocated unallocated _ 5.34.MiB --- --- _

Resize /dev/sda3 ntfs to 50GB (48.83GiB) leaving 15GB or so for future recovery or application files.
If you can't drag the slider and the "used space" isn't highlighted in pale yellow, then the ntfs drive hasn't been mounted properly. This is probably because the laptop was hibernated or Windows or HP updates were installed the last time you used it. Just shutdown, boot windows, wait a few minutes, and shut down again before tryin to boot to Ubuntu live USB. 

Add an ext4 partition (New partition menu item) to the newly unallocated 180 GB space in the middle of the drive that we just created by shrining the Windows partition. I left 16.400 GiB (approx 16GB) to allow swapping of all of my 16 GB of RAM. I made it a Primary Partition (instead of Extended) and labeled it "ubuntu" and allowed it to "allign to MiB" (rather than "Cylinder" or "None").

Hit the New partition button again to create a "linux-swap" type partition with 16256MiB or so and "align to MiB" again and labeled it swap. Interestingly, this left 5MiB unallocated right before my "New Partition #1" and "New Partition #2"

Click the green checkbox to apply all 3 changes, ignoring the "Loss of Data" warning.

It should take about a minute or two. Don't touch anything until it's done. This is the most critical part of the whole process.

GParted should reveal your Ubuntu-friendly disk partitions with a diagram something like this:

<img src="/images/gparted screenshot after resizing.png">

Now you can install the efi boot manager to see what your boot table says and edit it, if necessary.

    sudo apt-get install efibootmgr -y

