+++
title = "What is taking so long?"
menutitle = "What is taking so long?"
description = "Current status of the project and hardware information"
date = "2018-09-04"
draft = false
pre = "<i class='fa fa-question'></i>	"
+++

The short answer is that *it's complicated*. 

Project Trident is quite literally a test of the new TrueOS build system.  As expected, there have been quite a few bugs, undocumented features, and other optional bits that we discovered we needed that were not initially present. All of these things have to be addressed and retested in a  constant back and forth process.

While Ken and JT are both experienced developers, neither has done this kind of release engineering before.  JT has done some release engineering back in his Linux days, but the TrueOS and FreeBSD build system is very different.  Both Ken and JT are learning a completely [new way of building](https://github.com/project-trident/trident-build) a FreeBSD/TrueOS distribution. Please keep in mind that no one has used this new TrueOS build system before, so Ken and JT want to not only provide a good Trident release, but also provide a model or template for other potential TrueOS distributions too!

### Where are we now?
Through perseverance, trial and error, and a lot of head-scratching we have reached the point of having successful builds.  It took a while to get there, but now we are simply working out a few bugs with the new installer that Ken wrote as well as finding and fixing all the new Xorg configuration options which recently landed in FreeBSD. We also found that a number of services have been removed or replaced between TrueOS 18.03 and 18.06 so we are needing to adjust what we consider the “base” services for the desktop.  All of these issues are being resolved and we are continually rebuilding and pulling in new patches from TrueOS as soon as they are committed.

In the meantime we have made an early BETA release of Trident available to the users in our [Telegram Channel](https://t.me/ProjectTrident) for those who want to help out in testing these early versions.

### Do you forsee any other delays?
At the moment we are doing many iterations of testing and tweaking the install ISO and package configurations in order to ensure that all the critical functionality works out-of-box (networking, sound, video, basic apps, etc). While we do not forsee any other major delays, sometimes things happen that our outside of our control. 
For an example, one of the recent delays that hit recently was completely unexpected: we had a hard drive failure on our build server. Up until recently, The aptly named "**Poseidon**" build server was running a Micron m500dc drive, but that drive is now constantly reporting errors. Despite ordering a replacement Western Digital Blue SSD several weeks ago, we just received it this past week. The drive is now installed with the builder back to full functionality, but we did lose many precious days with the delay.

The build server for Project Trident is very similar to [the one that JT donated to the TrueOS project](https://trueos.org/blog/spring-cleaning-hardware-update-preview-upcoming-trueos-changes/). JT had another DL580 G7, so he donated one to the Trident Project for their build server. Poseidon also has 256GB RAM (64 x 4GB sticks) which is a smidge higher than what the TrueOS builder has. 

Since we are talking about hardware, we probably should address another question we get often, “What Hardware are the devs testing on?” So let's go ahead and answer that one now.

### Developer Hardware
**JT**: 
His main test box is a custom-built Intel i7 7700K system running 32GB RAM, dual Intel Optane 900P drives, and an Nvidia 1070 GTX with four 4K Acer Monitors.  He also uses a Lenovo x250 ThinkPad alongside a desk full of x230t and x220 ThinkPads.  One of which he gave away at SouthEast LinuxFest this year, which you can [read about here](https://www.ixsystems.com/blog/self-2018-recap/).

However it’s not done there, being a complete hardware hoarder, JT also tests on several Intel NUCs and his second laptop a Fujitsu t904, not to mention a Plethora of HP DL580 servers, a DL980 server, and a stack of BL485c, BL460c, and BL490c Blades in his HP c7000 ad c3000 Bladecenter chassis.
(Maybe it’s time for an intervention for his hardware collecting habits)


**Ken**: For a laptop, he primarily uses a 3rd generation X1 Carbon, but also has an old Eee PC T101MT Netbook (dual core 1GHz, 2GB of memory) which he uses for verifying how well Trident works on low-end hardware. As far as workstations go, his office computer is an Intel i7 with an NVIDIA Geforce GTK 960 running three 4K monitors and he has a couple other custom-built workstations (1 AMD, 1 Intel+NVIDIA) at his home. Generally he assembled random workstations based on hardware that was given to him or that he could aquire cheap.

**Tim**: is using a third gen X1 Carbon and a custom built desktop with an Intel Core i5-4440 CPU, 16 GiB RAM, Nvidia GeForce GTX 750 Ti, and a RealTek 8168 / 8111 network card.

**Rod**: Rod uses… No one knows what Rod uses, It’s kinda like how many licks does it take to get to the center of a Tootsie-Roll Tootsie-Pop… the world may just never know. 
