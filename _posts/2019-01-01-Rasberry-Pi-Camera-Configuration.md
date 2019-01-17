---
layout: post
title: Raspberry Pi Camera Configuration
---

I'll eventually figure out where I put my notes on configuring a Raspberry Pi camera for streaming video and offline object detection.  But for now, check out the [BerryNet](https://github.com/DT42/BerryNet) repo. These guys have done it right!

## BerryNet 

- any camera compatible with your OS and PC
- CPU, GPU options: 
    - rPi 3 B+, movidius
    - NVIDIA Tx2
    - Intel NUC
    - basically any SBC or linux PC hardware you can dream up

## DeepLens

From a novice computer vision engineer, Amazon's Deep Lens is the system to beat. But you'd have to do some hacking to get into the OS and customize it without breaking all the cloud integration that Amazon has infected the NUC with.

- Intel NUC
- 1080p video camera
- optimized for mxnet
- turnkey integration with AWS services like Lambda and GreenGrass
- streaming video (over WiFi)
- some Vendor lock
- power?
- OS?
- flops? RAM?
- GPU flops? RAM?

## Google Vision Kit

- connectivity: micro USB only
- GPU: movidius
- low res camera, IR cameras available
- CPU: rpi zero ? Flops, 500MB RAM
- OS: raspbian

## Blink

This isn't one you can hack around with, but it's the only wireless camera option. Similar to Wyze cam.

- Power: camera 2xAA lithium batteries (2yr life) or microusb power, WiFi synchub needs AC-DC 5V converter
- Size: 71x71x30 mm
- Weight: .07 kg
- CPU: Immedia Proprietary - ISI108, 4 / 100Mhz.
- Connectivity: Wi-Fi with diversity 2.4 Ghz 802.11g/n but not ad-hoc
- camera: 720p HD, 30 fps for 5 s clips, mono audio
