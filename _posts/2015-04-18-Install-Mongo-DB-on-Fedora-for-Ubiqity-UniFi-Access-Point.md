---
layout: post
title: Install Mongo DB on Fedora 20 for the Ubiqity UniFi Access Point
---

[Chick](thewells.org) swears by his new Ubiquity WiFi access point. So I purchased the High Power version from Amazon using Prime and it arrived in only 36 hours on a Saturday! Maybe having the Ubiqity HQ here in Portland helped. 

Unfortunately Chick didn't mention that Ubiquity doesn't support Redhat-based linux flavors (only Debian). In the course of installing the latest Mongo DB, the SE Linux policies wouldn't let it do its job. I probably should have just settled for the official Fedora Mongo package, but if you too want the latest and greatest, the Fedora SE Linux dialog boxes revealed a neat trick to let a process/daemon do whatever it wants and codify those actions in SE Linux policies without having to manually edit the policies yourself... just run the following two lines about 10 times (with mongodb running in the background) and it will eventually allow all the actions that mongodb needs. Do this as root...

{% highlight bash %}
grep mongod /var/log/audit/audit.log | audit2allow -M mypol && semodule -i mypol.pp
{% endhighlight %}


[Here](/images/allow-access)'s a shell script that should work for any service name you indicate as the first argument on the command line:

{% highlight bash %}
#!/usr/bin/env bash
for i in {1..10}
do
    echo "Round ${i}: Searching the SE Linux audit log (/var/log/audit/audit.log) for the '$1' service and allowing it to do whatever it wants (audit2allow -M my${1}policy)..."
    grep "$1" /var/log/audit/audit.log | audit2allow -l && grep "$1" /var/log/audit/audit.log | audit2allow -M "my${1}policy" && semodule -i "my${1}policy.pp"
    sleep 2s
done
{% endhighlight %}

So to get mongodb running you need to allow `mongod` (again, as root) with:

{% highlight bash %}
allow-access mongod
{% endhighlight %}

It will run for about 2 minutes as mongod tries to do things and selinux stops it and this script restarts selinux with a new policy to allow those actions... 10 times.
