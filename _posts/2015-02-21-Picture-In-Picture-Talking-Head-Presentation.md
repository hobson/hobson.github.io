---
layout: post
title: Picture-in-Picture Talking Head Presentations
---

Once you have your reveal.js slides and live [CYOA](https://www.twilio.com/blog/2014/11/choose-your-own-adventure-presentations-with-reveal-js-python-and-websockets.html) voting set up (see previous blog posts), now you need to record both your computer screen with the slides and a [video of your talking head](https://www.youtube.com/watch?v=iYeAacfttu8&feature=youtu.be). This is how I did it for the ["Creative Challenge"](https://class.coursera.org/aiplan-003/forum/thread?thread_id=237) assignment in the coursera ["AI Planning"](https://www.coursera.org/course/aiplan) class.

I cribbed a simple `pygame` python script to display my webcame image at 15 fps or so on the screen. It basically only has two possible window sizes that work (256 and 512), but with some creative framing and sliding most of the window off screen you can arange it so that you can speak and type in your normal work posiiton at your laptop. the hardest part was installing the `pygame` library itself and all it's binary dependencies. I was never able to accomplish that in a virtualenv and instead had to deactive my courser venv and rely on the system-level install (using yum).

For the screen recording I used qt-recordMyDesktop (`sudo yum install qt-recordMyDesktop`) on Fedora 19 (using linux for everything keeps me up to date on the latest). You'll need to make sure the `/tmp` folder ("Working Directory" setting) is located on a partition with enough space for a lengthy video. I ended up using `~/tmp` where my TB laptop drive is. I also enabled "on-the-fly" encoding into odg.

Unfortunately the end result was a video where the sound and images were out of sync, making my "lecture" virtually useless. However I was eventually able to record a few minutes at a time with everything synced up. This involved choosing a fresh "Save-As" file name, full quality sound and video (adjusting down and back up to "refresh" whatever cache was getting behind). I also killed and restarted the python session with the live wecam image (to make sure it could keep up). Finally you need to drag the red hashmarked box across the mini preview window within the recordMyDesktop screen rather than the actual Desktop, and to this immediately before you start recording. The rest of my "Advanced" settings were:

- Overwrite Existing Files off (unchecked)
+ 15 fps
+ Encode On the Fly
+ Zero Compression (!!! I think this was the key !!!)
- Quick Subsampling off (unchecked)
- Full shots at every frame off (unchecked)
+ Sound Channels: 1 
+ Sound frequency: 22050
+ Device: DEFAULT



