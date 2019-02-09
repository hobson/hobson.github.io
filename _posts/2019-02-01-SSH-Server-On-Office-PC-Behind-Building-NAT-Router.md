---
layout: post
title: SSH Server On Office PC Behind Building's NAT Router
---

Say you're leasing space in an office building for your startup and you share the network with all the other tennants. This could be a wireless router or hard-wired ethernet router. The problem is you don't have the password for the admin page on that router. So you can't expose a port on your server for ssh or webhosting or whatever. 
Normally you'd just add a port-forwarding rule on the router to send 22 and 80 and 443 all through to your server. But that might mess up somebody else using the same router to serve up **their** page.

So you need to set up an ssh tunnel (actually a reverse tunnel) to a server (an ssh relay server) outside your LAN. It needs to have a public IP so you need to have control of the router or port forwarding on that relay server. This could be your home internet wifi router connected a GPU doing ML training for your [Springboard.com](springboard.com) and [totalgood.com](https://totalgood.com) mentees and serving up your experimental [Django apps](http://gpu.totalgood.org/). You're probably using NAT port forwarding like we talked about in [Nginx Webserver Network Configuration](2019-01-04-Nginx-webserver-network-configuration.md) last month.

So now we can use our home GPU as a relay for our office GPU tunnel to the outside world. So I came across this [blog post](http://xmodulo.com/access-linux-server-behind-nat-reverse-ssh-tunnel.html) and added a few other firewall steps from [here](https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands). As usual, we don't use port 22 for ssh, just to reduce script kiddie discovery of the ssh service on our ISP's public IP for my home router.

First log onto your office server that you want to expose an ssh port on through the NAT router for the office building. You can do this directly if you have a keyboard, monitor, and chair connected to the office server. Or you can use TeamViewer or any other remote control application. Once you've logged onto the office server,open an SSH connection to your home ssh relay server and keep the connection open permanently:

```bash
officeserver~$ ssh -f -N -R 9923:localhost:9922 relayuser@1.2.3.4
```

Here the port 9923 is any arbitrary port number that you chose. It only needs to be accessible from within your home relay server like `ssh relayuser@localhost -p 9923`. Just make sure that this port is not used by other programs on your home relay server at the public IP address `1.2.3.4`.  Replace `1.2.3.4` with your relay server's public IP which you can find out with `relayserver~$ curl ifconfig.co`.

Port 9922 in the command above must be the port that your office computer behind the firewall is listening to with the sshd. Normally this will be port 22, unless you're trying to hide from script kiddies within your office building LAN.  You can set/check this port in the ssh daemon config file with `sudo nano /etc/ssh/sshd_config`. Don't forget to restart the sshd service if you change this port: `sudo service sshd restart` or `reload`.

The `-R` option defines a reverse tunnel. It forwards any traffic that it receives on port 9923 on the office pc to the home relay server on port 9922. This will be all the stdout flowing back to your external ssh connection.

The `-N` option ensures that SSH doesn't execute a remote command, like it normally would. This forces it to just relay (tunnel) traffic to the requested IP address and port.

The `-f` option SSH will send the ssh process to the background immediately, before it sets up the tunnel or executes a remote command, which we prevented with `-N`. 

So when you run that command you should immediately return to the shell prompt and you can see your background ssh tunnel process on the office server with:

```bash
officeserver~$ ps aux | grep 'ssh\ \-f'
officeuser     13519  0.0  0.0  49052   716 ?        Ss   13:23   0:00 ssh -f -N -R 9923:localhost:9922 relayuser@1.2.3.4
```

and 

```bash
officeserver~$ sudo netstat -nap | grep 9922
tcp        0      0 0.0.0.0:9922           0.0.0.0:*               LISTEN      13057/sshd      
tcp6       0      0 :::9922                :::*                    LISTEN      13057/sshd    
```

So now you can log into the home relay server like you normally do with ssh. After that you can then access the office server by `ssh`ing to localhost on the tunneling port (the port on the left-hand side of the reverse tunnel command you ran on the office computer):

```bash
relayserver~$ ssh -p 9923 officeuser@localhost
```

Now you'll have to use your officeuser password to log onto the officeserver through the tunnel, until you set up a ~/.ssh/config file with the appropriate keys for passwordless login.

## Automatic Relay Server Login and Passthrough

Unfortunately with the manual tunneling you set up you have to ssh twice: first to relayserver, and then to officeserver through the relayserver localhost. But it's possible to let your ssh daemon on your home relayserver forward a port from an external host, like your laptop. This is achieved by specifying `GatewayPorts` configuration options in the ssh server running on relayserver:

```bash
relayserver~$ sudo echo "GatewayPorts clientspecified" | sudo tee /etc/ssh/sshd_conf
relayserver~$ sudo service sshd restart  # or reload
```
