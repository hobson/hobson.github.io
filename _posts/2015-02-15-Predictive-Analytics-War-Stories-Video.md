---
layout: post
title: Predictive Analytics War Stories Video
---

Thank you [David Barton](https://www.linkedin.com/profile/view?id=100854240) and [Innovation Enterprise](//ieondemand.com) for recording my [presentation](http://youtu.be/8n338W0yvoM) at the [Predictive Analytics Summit](http://theinnovationenterprise.com/summits/predictive-analytics-innovation-summit-san-diego2015/schedule) in San Diego. It really knocked down my ego a notch to see my awkwardness. You've motivated me to practice. 

<iframe src="http://youtube.com/embed/8n338W0yvoM" frameborder="0">Predictive Analytics War Stories</iframe>

The [video](http://youtu.be/8n338W0yvoM) doesn't show the screen with the [reveal.js slides](//slides.com/hobsonlane/data-analytics-war-stories/). But if you check out the slides at [slides.com](//slides.com/hobsonlane/data-analytics-war-stories/) you'll get all the plots, animations, interactive d3 visulizations, and even commenting on individual slides. If anyone requests it, I'll superimpose the slides onto the video.

Here's a [pdf of the slides](/images/Hobson-Lane-Predictive-Analytics-Innovation-Summit-San-Diego-2015.pdf), and here's the [github repo](https://github.com/sharplabs/analytics-summit-2015) with the [reveal.js + Choose-Your-Own-Adventure](https://www.twilio.com/blog/2014/11/choose-your-own-adventure-presentations-with-reveal-js-python-and-websockets.html) SMS vote-tallying flask webapp that [Matt Makai](http://www.mattmakai.com/) came up with.

The "export html" feature on slides.com (which unpaid users have access to) links all media and javascript libraries back to the slides.com server, so it won't work if slides.com goes offline. However, a "Pro" subscription on slides.com entitles you to sync the entire web content (images and lib folders, plus the deck.html file) to your DropBox account. Fortunately, slides.com has been smart about using relative links, so you can serve your own slides (after your Pro subscription runs out) on any server you like. I've hosted mine here at the free github.io (github-pages) server. I can't find any differences between [my freely hosted version](http://hobsonlane.com/images/data-analytics-war-stories.html) and the slides.com version, except the commenting feature on slides.com.

Also, be careful if you use a d3.select and timeout (in the word-coocurrence matrix sort transition widget). The 2 second timeout was causing the d3 slide to reveal the sort-order pulldown menu when you hit the spacebar on a random reveal.js slide that preceeded it. I did a lot of refactoring of javascript function (`order()`) and CSS id names (#order) before identifying the `timeout()` function that was causing the problem from within the iframe. So much for isolating javascript in an iframe to protect the rest of a page!