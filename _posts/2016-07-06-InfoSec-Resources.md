---
layout: post
title: PenTesting Peanut Gallery
---

Really enjoyed getting a crash course in InfoSec and PenTesting by [Dean](http://deanpierce.net) at the Ctrl-H HackerSpace meetup. Here's how to get some tools for easy, ethical hacking.

[sqlmap](https://github.com/sqlmapproject/sqlmap)

```bash
git clone git@github.com:sqlmapproject/sqlmap.git
# pip install -e `pwd`/sqlmap/  # no joy, help them with a PR setup.py?
```

Give `sqlmap` a URL with a ?id=42" at the end of it and you might get lucky. I may try to pull out links from the twip scraped tweets and `sqlmap` the ones with a GET query that looks SQL-ish. Would have to follow the bit.ly redirects before it would be possible to filter them, but what the heck, my server has cycles to spare.

```bash
python sqlmap.py -a -u vuln.com?id=42
```

Another python-ish tool is [Wapiti](http://wapiti.sourceforge.net/). Not sure how it works, but this tool has a bunch of python CLI tools for scanning networks.

```bash
curl -O -L http://downloads.sourceforge.net/project/wapiti/wapiti/wapiti-2.3.0/wapiti-2.3.0.tar.gz
tar xvzf wapiti-2.3.0.tar.gz
```

An enterprise (Windoze) security expert showed up late and talked about following infosec since the opensource, CLI BackTrack days. BackTrack is a linux distro with a lot of pen testing tools installed/configured. Kali is a similar set of tools used for Enterprise testing. He mentioned Nessus's open source fork, [OpenVAS](http://openvas.org/). He says it fizzled as the community deflated as they went closed source as Nessus. But here's how to get by sourceforge click-traps and snag it:

  
```bash
curl -L -O http://wald.intevation.org/frs/download.php/2325/greenbone-security-assistant-6.1+beta4.tar.gz
```

So with these two keywords it was a cynch to find high-traffic security tools lists like these:

- [naggy addy list of 14 open source tools](http://resources.infosecinstitute.com/14-popular-web-application-vulnerability-scanners/)


This script will download the python ones:


And here are some references to level up your skilz

- [Metasploit Free Online Offensive Security Training Course](https://www.offensive-security.com/metasploit-unleashed/)
- [Parisa Tariz's infosec resources list](https://sites.google.com/site/infosecrocks/) - focus on XSS
- [Parisa Tariz's PyCon Keynote on Python vulnerabilities](https://www.youtube.com/watch?v=kxqci2mZdrc) - avoid pickling
- [Dean's InfoSec Mailing list](cheapbugs.net) - near-free tier coming soon

Here's some terminology for you

- OSCP: Offensive Security Certified Professional (enterprise 'sploit folks)
- InfoSec: Information Security
- PenTesting: Penetration Testing
- Ethical Hacking: Hacking sites to help them harden (share your results)
- BackTrack: Pentesting linux distro toolbox
- Kali: Recent pentesting linux distro toolbox
- BackBox: Yet another pentesting linux distro
