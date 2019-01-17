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
