---
layout: post
title: Upgrading 14.04 to 15.10 on a Dual-Boot HP Spectre Laptop
---

## Tune Down the Trackpad

The default trackpad settings will cause a lot of ghost clicking and typing all over the place... not great when you're editing system config files.

Here's how to find your trackpad

	xinput list

Mine was a Synaptics TouchPad and this will list it's properties

	xinput list-props "SynPS/2 Synaptics TouchPad"

And the one you want to set is the "Finger" setting

    xinput get-prop "SynPS/2 Synaptics TouchPad" "Synaptics Finger"

Record this original/default value in your .profile file in a comment

   # # default touchpad sensivity: release-sensitivity touch-sensitivity click-sensitivity
   # xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Finger" 15 30 0

And then add a line to set the values to senistivity levels like these

   echo 'xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Finger" 35 65 128' >> ~/.profile

And to get a bit more GUI control of your trackpad...

   sudo apt-get install gpointing-device-settings 

And for fine-grained cli control use `synclient`. Here's my latest .profile:

    xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Finger" 20 50 180
    # keep this small so even if your palm is barely touching the corner...
    synclient PalmMinWidth=10
    # minimum pressure to be considered a palm
    synclient PalmMinZ=120
    synclient MaxTapMove=200
    synclient MaxSpeed=8.0
    synclient AccelFactor=0.09
    synclient PalmDetect=1
    synclient VertTwoFingerScroll=1
    # "natural" scrolling so that down is up and up is down ;)
    synclient VertScrollDelta=-109
    synclient HorizScrollDelta=-109



## The GUI Upgrade Fails

So I went through the normal AutoUpdater process to upgrade my distro to 15.10, but that terminalized my Ubuntu. It dropped me to tty console. Fortunately my sudo user was still there and logging in was not a problem. So I thought I'd need to manually install gnome:

	sudo apt-get install ubuntu-gnome-desktop

But that complained about the installus-interuptus, and politely recommended...

	sudo dpkg --configure -a

And that worked great. I had to accept the package manager's override of the grub conf file, but all went smoothly till the very end, where some other command borked. So I just dhut 'er down and hoped for the best.

	sudo shutdown -h now

I was delighted to see the Ubuntu GUI welcome me back, and I was away. Dropbox and my other apps were still installed and all was well with the world.
