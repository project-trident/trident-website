+++
title = "Features of Project Trident"
MenuTitle = "Features"
description = "Features of Project Trident"
chapter = false
weight = 1
pre = "<i class='fa fa-flag'></i>	"
+++

## Privacy
Project Trident treats user privacy as a primary goal. We takes many steps to ensure the privacy of our users:

* No website registration or tracking. The only statistics the project keeps track of are numbers of file downloads and these download numbers may be publicly posted on the website or other places.

* Project Trident systems do **not** "phone home" and submit user or system information back to the project.

* Project Trident does not sell advertising space. You are free to use the system without any advertisements!

* For enhanced privacy, we have a pre-defined firewall profile for routing all network traffic through the "tor" anonymizing service. While this profile is not enabled by default due to the speed limitations of the tor network, it can be easily enabled after installation.

* The "Falkon" web browser that is pre-installed has ad-blocking functionality both built-in and pre-enabled. With the addition of private browsing and more advanced browsing protection options are also available within the preferences as well.


## Reliability
Project Trident utilizes a number of mechanisms to safeguard the data of each system.

* **ZFS**: We use the enterprise-quality Z File System for safely storing all user data on single or multiple disk drives.

* **Boot Environments**: All system updates are performed within a separate snapshot of the OS itself, called a boot environment. This provides a safety net for any updates since you can roll back to the previous environment in just a few seconds should the need arise for it.
                    
                    
## Security
Utilizing leading security enhancements from OpenBSD, Project Trident also builds on TrueOS to provide a desktop focused operating system which keeps security implication and mitigation procedures as a top priority for the everyday user.
Some of the security enhancements that we implement:

 * LibreSSL is used as a drop-in replacement for OpenSSL. This prevents *most* of the security issues that touch the SSL systems from impacting Project Trident. We also use LibreSSL when building all the 3rd-party applications/packages unless the application *specifically* requires OpenSSL for some reason.

 * All 3rd-party packages are built, signed, and sealed by Project Trident before being placed into a public repository. This allows the user to download and install trusted builds of applications from an official source, rather than having to fetch files from unknown sources.
