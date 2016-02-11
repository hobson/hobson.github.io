---
layout: post
title: Your Own Private Cloud and NAS Drive
---

The Buffalo Airport Extreme is pretty expensive ($100), but when coupled with a cheap multi-TB USB 3.0 drive, it makes it pretty nice personal cloud. You can even download all of the Wikipedia and Wikimedia Commons dumps directly to the drive without passing through your precious laptop SSD. 10 Mbps rates are no problem for most USB 3.0 drives.

You'll want to make sure it automounts as a normal drive with something like this, in your fstab file on Ubuntu:

sudo apt-get install -y smbclient cifs-util
sudo mkdir -p /media/hobs/nas
echo '//totalgood/disk1_pt1/ /media/hobs/nas cifs user=hobs,credentials=/home/hobs/.smbcredentials,iocharset=utf8,sec=ntlm 0 0
'  | sudo tee --append /etc/fstab
sudo mount -a
