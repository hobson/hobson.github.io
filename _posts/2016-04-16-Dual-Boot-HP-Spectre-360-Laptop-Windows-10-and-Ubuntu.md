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


## Install Ubuntu!


### Dialog Box: Preparing to install Ubuntu

Check the checkboxes for 

[x] Download update during install
[x] Install this third-party

click **Continue**

### Dialog Box: Unmount partitions that are in use?

/dev/sda is mounted

Do you want the installer to try to unmount...

click **Yes**

### Dialog Box: Installation type

The default is what you want, right?

[x] Install Ubuntu longside Windows Boot Manager
[ ] Erase disk...

Grayed out (not possible unless you wipe the disk first):

[ ] Encrypt the new Ubuntu installation for security
[ ] Use LVM witht he new Ubuntu installation

---

[ ] Something Else: You can create or resize...

You can safely accept the default if your Windows installation and partitions were detected.

click **Continue**

### Dialog Box: Install Ubuntu alongside Windows Boot Manager

Allocate drive space by dragging the divider below:

     Files (3.0 GB)             Ubuntu
    /dev/sda6 (ext4)        /dev/sda7 (ext4)
         87.3 GB                88.1 GB

I adjusted the slider to be

     Files (3.0 GB)             Ubuntu
    /dev/sda6 (ext4)        /dev/sda7 (ext4)
         100.2 GB                75.2 GB


Click **Install Now**

### Confirmation Dialog: Write previous changes...

Before you can select a new partition size ...

You cannot undo this operation.

Please note that... take a long time.

Click **Continue**

It'll show you the new partition labels sda6 and sda7 for the swap.

### Install

Where are you?

**LA**

Keyboard layout

**English (US)**

### Who are you?

The first few fields are harmless, but pay close attention to the radio buttons at the bottom.

Your name: Hobson Lane
Your computer's name: spectre-laptop
Pick a username: hobs
Choose a password: really-secure-password 
Confirm password: really-secure-password

If you plan to do anything remotely private on the laptop (banking, online shopping, etc), you really don't want to check the first box, but rather the next two. The home folder encryption is software-based so much slower than the full-drive encryption built into the kernel... but you have to have it. Otherwise all your data is available to anyone with access to your laptop in a matter of seconds (search "recover Ubuntu password" if you don't believe me).

[ ] Log in automatically
[x] Require my password to log in
[x] Encrypt my home folder

### Dialog: Installation Complete

Click **Restart Now**

When it boots back up to your USB stick just 

1. hit Esc to get to the Grub menu
2. unplug usb stick (it's not being used anymore by grub)
3. ctrl-alt-del to reboot

### Ubuntu!

The grub menu should show Ubuntu and your Windows Boot manager both listed!

Ubuntu should boot fromo grub as the default and you're away!

Enjoy your powerful new development environment!

### Configure

- Keyboard shortcuts will welcome you, just ignore them and they'll go away as you click on another icon or launch another program
- {Meta] then type "display" and set your resolution to 2048x1152 (16:9)
    - this worked for the 15" Spectre
    - make sure your new resolution has the same "Ratio" as the default
    - The ratio is 16:9 for the 15" Spectre
    - You can choose a higher resolution but you'll probably want to change the "scale for menu and title bars" to 1.25 to make them legible
    - unlock all the bloatware from your toolbar (whatever you don't need)

Get the most important stuff installed:

    $ sudo apt-get update
    $ sudo apt-get upgrade -y
    $ sudo apt-get install nautilus-dropbox efibootmgr

my 98.5 GB ubuntu partition now has 62 MB used and 93.4 GB free on /media/hobs

Here's my `df -h`

    hobs@spectre-laptop:~$ df -h
    Filesystem           Size  Used Avail Use% Mounted on
    udev                 7.8G  4.0K  7.8G   1% /dev
    tmpfs                1.6G  1.5M  1.6G   1% /run
    /dev/sda8             69G  4.5G   61G   7% /
    none                 4.0K     0  4.0K   0% /sys/fs/cgroup
    none                 5.0M     0  5.0M   0% /run/lock
    none                 7.8G  156K  7.8G   1% /run/shm
    none                 100M   84K  100M   1% /run/user
    /dev/sda1            256M   65M  192M  26% /boot/efi
    /home/hobs/.Private   69G  4.5G   61G   7% /home/hobs
    /dev/sda6             92G   60M   88G   1% /media/hobs/ubuntu
    /dev/sda3             49G   36G   14G  72% /media/hobs/Windows

So it looks like my split between "Files" and "Ubuntu" was off. To have a bigger home folder you want the "Ubuntu" side to be bigger. I may wipe and reinstall to get this right, it's critical. I need the space for DropBox, etc.
