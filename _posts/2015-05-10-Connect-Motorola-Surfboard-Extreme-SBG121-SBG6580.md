---
layout: post
title: Connect Mac WiFi with Comcast Motorola Surfboard Extreme SBG121 or SBG6580
---

Larissa and house guests are often complaining about sluggish Internet with our Comcast Motorola Router and Modem. So I tried a lot of things. In the end, I think it was the "IP Flooding" filter that was gumming up the works.

# Visiting In-Laws

Riss and her visiting parents often have trouble using Skype or VPN clients like Blue Jeans with their Mac products or Australia-configured phones and laptops. Last month I installed a new Ubiqity UniFi high power access point [last month](2015-04-18-Install-Mongo-DB-on-Fedora-for-Ubiqity-UniFi-Access-Point) to see if maybe it was the WiFi link in the chain, but that didn't seem to help Larissa much.

I closed down the network and changed passwords, in case neighbors had hacked us. Still no joy.

# Set Control Channel Between 2 and 12 (inclusive)

A couple weeks ago I installed a Century Link DSL modem and router as backup and for penetration testing on my Comcast modem LAN. I've got an "inside man" and I still can't get through by SSH to my GPUs in the basement. But that's another story. The key news here is that the technician slipped me some "beta" while he was tracing and reconnecting all the phone lines to our house that Comcast had cut and yarn-balled. In between curses at the previous technicians that had been up the pole, he mentioned that **Apples (Macs) don't like channel 1 and 13**, so "you should set your wireless to use channel 2-12 and disable automatic wireless configuration." If you hit the sync button with automatic connection enabled, the router will override the defaults you set up.


# Disable IP Flood Detection in Your Firewall

I searched online and found others that had blindly stumbled onto this solution for their Comcast modems as well, by not allowing it to automatically select an unoccupied "control channel" and specifying one manually (probably not 1 or 13). Along with those posts I found that people had **turned off IP flooding filters/firewalls** to help with bandwidth as well. I mean, who really thinks your home network is so important that a script kiddie is going to try to DOS you?

Both these settings seemed to help me (and my wife and in-laws). But I'm keeping the Century Link network to myself (and my business) in case her laptop or our guests ever get hacked or accidentally key our WiFi password into a phishing dialog box or Google search bar.

# Good Old Ethernet

When in doubt hard-wire it. As backup, I wired up my office desk with Ethernet (Larissa insisted she'd never need a jack on her side of the room) and put all the routers in the basement. That way they can keep cool and reduce the radio footprint and interference with neighbors. Maybe that'll help.

I also wired the DVD player up to Ethernet so that Netflix will no longer stream over the wireless. Hopefully that'll make everything run more smoothly on WiFi as well as when we're watching movies. I just hope Samsung and Netflix don't do a lot of background chirping "phone home" even when we aren't watching TV. I'm sure that "high priority" Ethernet traffic would bump our WiFi traffic down the bandwidth queue.