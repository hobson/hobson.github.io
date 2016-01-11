---
layout: post
title: Getting Started with your PiBot TiddlyBot
---

I helped my preteen nephew get started on his kickstarter [TiddlyBot](http://www.pibot.org/tiddlybot/) Christmas Present over the holidays. We a linux laptop (Ubuntu) and recorded all the tedious setup steps so you can spend more time programming your bot and less time getting set up.

## First Things

Like any good recipe, you should start "preheating the oven" first. Make sure your TiddlyBot is plugged into the charger so it can run around on battery power without the tether ASAP.

## Load the TiddlyBot OS onto the SD Card

If you received preloaded 8GB SD card, you can skip this section. But if you remove the SD card at the wrong time (power still on) you could corrupt it. Here's how to restore the latest TiddlyBot image onto the SD card and make the raspberry pi boot it up whenever you power up.

If you try to run vanilla Raspbian on the Tiddly bot, you won't be able to `import RPIO` in python without raising the exception "SystemError: This module can only be run on a Raspberry Pi!"

**IMPORTANT:** Manually verify that this command finds your rPi SDCard path with this command, otherwise you may overwrite the wrong drive with the Raspbian OS and render that drive unusuable!

{% highlight bash %}
DEV_SDCARD=$(mount | grep -F vfat | grep -E -o '^/dev/[a-zA-Z0-9/]+')
{% endhighlight %}

Now you can write zeros to this device (**erase** it!) and **reformat** it.

{% highlight bash %}
sudo dd bs=4M if=/dev/zero of=$DEV_SDCARD
sudo mkfs -V -t vfat /dev/sdc1
{% endhighlight %}

Retrieve the latest pibot img file, unzip it and then write it to the SD card.

{% highlight bash %}
wget http://pibot.org/tiddlybot/images/TiddlyBot_V1_1.img.zip
unzip TiddlyBot_V1_1.img.zip 
rm -f TiddlyBot_V1_1.img.zip
{% endhighlight %}

## Networking

You'll probably want to plug an Ethernet cable between your PiBot and a router whenever you're programming it or setting it up. Otherwise you'll need a monitor, keyboard, and a lot of patience to configure your wireless card to connect to your LAN.

If your TiddlyBot is connected to your router you should be able to ssh to it immediately using the default user account "pi" and password "raspberry." But lets find it on your LAN. If you already know it's IP address assign it to the bash env variable `$PIIP` and skip the script below

{% highlight bash %}
LAN_SUBNET=$(ifconfig | grep -E -o '\s+inet[ ]addr\:192\S+' | grep -E -o '([0-9]{1,3}[.]){3}')
ping -b -c 3 -i 20 "${LAN_SUBNET}255"
PIIP=$LAN_SUBNET$PI_SUBIP
{% endhighlight %}

Now that you've found the IP address of the pi and set the `$PIIP` env variable, you can write it to your ssh conf, along with the default user name for the pi. And you can add an RSA key so that you never have to type the username, password, or IP address again!

{% highlight bash %}
echo -e "\n\nhost pi\n  HostName $PIIP\n  User pi\n\n" >> ~/.ssh/config
echo -e "\nn" | ssh-keygen
# type the default password "raspberry" when prompted below
ssh-copy-id -oStrictHostKeyChecking=no pi
{% endhighlight %}

## Raspi-Config

Now you can ssh into your pi and configure it for you locale (keyboard especially). It can be frustrating and even render your pi unusuable if your filesystem isn't fully expanded and your keyboard driver is not configured to match your keyboard layout and locale.

So ssh into your pi with `ssh pi`, then type `sudo raspi-config`. This will bring up an ASCII menu. The first option is to expand the file system. Hit `[Enter]` to select it and answer "yes" to any confirmation prompts. Exit raspi-config by tabbing down to the Exit button and  answer "yes" to the "Reboot Now?" prompt. If you get to the shell prompt without a reboot just type `sudo reboot` to make sure your pi is ready to roll.

SSH into you pi again and run raspi-config once more. This time use the arrow keys to select the configure keyboard and work your way through the menus (usually the US layout is hidden behind the "other" option) to set the keyboard to match yours. This doesn't matter if you only SSH onto the pi, but it may come in handy if you ever have to plug a USB keyboard and HDMI monitor directly into the pi.

## Fun Part

Finally the fun part, teaching TiddlyBot to make itself useful ;)

Download and edit the example code from pibot.org. You may find this command helpful whenever you want to programmatically extract a code block from an HTML file when you're only interested in the stuff between the `<code>` tags.

{% highlight bash %}
wget http://www.pibot.org/tiddlybot/code -O - | grep -E '<code[^>]*>' -A99999 | grep -E '<\/code[^>]*>' -B999999 | sed '1d' | sed '$d' > tiddlybot_example.py
{% endhighlight %}

I've got the original code [here](tiddlybot_example.py) if that's easier.


