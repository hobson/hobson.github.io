---
layout: post
title: Automation-Safer-Than-Manual
---

Interactive automation is much better than fully manual keyboard `bash`ing for a lot of linux tasks. It's taken decades but many linux distributions have finally made it possible to install linux automatically without too much hassel. But other mundane tasks like adding or swapping out a harddrive are a real bear. And the online instructions (especially at Canonical's Ubuntu docs site) sound overly protective, cautious, encouraging the user to do everything by hand instead of automating things with a script. And they often get critical steps wrong, endangering your data and your computer.

Here's my first cut at a bash script that could be used to automate the process of adding a new disk (hard drive). It needs some work, but with a little interractivity and less unexpected magic, it could really improve the safety of destructive operations like partitioning and formatting.

This script builds on some erroneous ideas at ["cyberciti tips"](http://www.cyberciti.biz/tips/fdisk-unable-to-create-partition-greater-2tb.html) by incorporating some AskUbuntu wisdom to:

- [find your UUID](http://askubuntu.com/questions/386536/how-to-find-the-attached-devices-uuid-through-terminal)
- [align your partition with modern physical sector boundaries](http://askubuntu.com/questions/156994/partition-does-not-start-on-physical-sector-boundary)


```bash
MOUNTPOINT=/midata
# find the unmounted device with the 3-4 TB of capacity (4TB drives only have 3.7TiB here)
# (no filter for mounted devices so be careful!
# this is where interactivity (confirmation) and robust safety checks should be implemented
DEVICE=`sudo sfdisk -l | grep -E '[3-4][.][0-9][ ]T' | grep -Eoh '/dev/sd[a-z]'`
DEVICE_LETTER=${DEVICE: -1}
# to find your disk if it doesn't show up above
sudo lshw -C disk
# this will ask for confirmation
sudo parted --script $DEVICE \
    mklabel gpt mkpart \
    primary 1MiB 4T && sudo mkfs.ext4 $DEVICE
sudo mkdir -p "$MOUNTPOINT" && sudo mount $DEVICE "$MOUNTPOINT"
sudo lsblk
sudo blkid
DEVICE_UUID=`ls -l /dev/disk/by-uuid | grep -E "../sd$DEVICE_LETTER" | grep -Eoh '[-a-f0-9]{32,42}'`
sudo cp /etc/fstab "/etc/fstab.$(date +'%Y%m%d_%H%M%S').bak"
sudo echo "# new hard drive installed '`date`': when it was mounted at device $DEVICE" | sudo tee -a /etc/fstab
sudo echo "UUID=$DEVICE_UUID $MOUNTPOINT         ext4    errors=remount-ro 0       1" | sudo tee -a /etc/fstab
sudo cat /etc/fstab
sudo mount -a
cd "$MOUNTPOINT"
ls -hal
```

For now, don't do this at home. But you can certainly use these commands manually to get going with yoru new drive. And if you get inspired, make it more robust, general, interractive, then submit an add_my_drive.sh utility to the Ubuntu distribution.
