---
title: "Downloads"
menutitle: "Downloads"
description : ""
chapter: false
draft: false
weight: 2
pre: "<i class='fa fa-download'></i>	"
---

## Coming Soon!
BETA ISOs:http://pkg.project-trident.org/iso/release/
NOTE: WIFI IS KNOWN TO NOT WORK ON THIS AND WE'R TRYING TO
      GET IT WORKING FOR NEXT BETA IMAGE

## System Requirements
|System|Recommended|Minimum |
|:--:|:--------------------:|:--------------:|
|Architecture| 64-bit | 64-bit |
| Memory | 2GB+ | 1GB |
|Disk Space| 20GB+ | 10GB |
|CPU| Any | Any |
|Virtualization| VMWare, bhyve | VirtualBox |


{{< downloads >}}

## Release Notes
### Application/Package Availability
Every single release includes a manifest of all the packages and versions that are available in the repository.
This plaintext file can easily be [downloaded from the package server](http://pkg.project-trident.org/iso/release/pkg.list)

#### If the package does not appear on the list
1. See if a port exists for FreeBSD using [freshports.org](www.freshports.org)
  * *No Port*: You can follow the [FreeBSD Porters Handbook](https://www.freebsd.org/doc/en/books/porters-handbook/) to create a new port, and then submit it either to [FreeBSD](https://bugs.freebsd.org/bugzilla/) or to [TrueOS](https://github.com/trueos/trueos-ports). Once accepted by either project, the port will become available by Project Trident a short time later.
2. See if the port is failing to build by looking at the [port build logs](https://builds.ixsystems.com/poseidon/jail.html?mastername=trident-master-current).
   * Note that all the package build are iterative - so if the latest build has no record of it you may need to look at previous builds to find the job that tried to build the package.
   * Bug ticket and fixes for ports can both be submitted to the [TrueOS Ports repository](https://github.com/trueos/trueos-ports)
   * If a port build option needs to be changed, you can submit changes to the [Project Trident package settings on the trident-build repository](https://github.com/project-trident/trident-build/blob/master/trident-master.json).

### Known Issues
* **VirtualBox Guest**: When resizing the window for the Project Trident VM, there may be a delay in the session detecting/adjusting to the new "screen" size. When using the Lumina desktop, you may also need to run `killall fluxbox` from the command-line to re-initialize the window manager if the borders around windows disappear after a session resize from outsize the VM.
   * **Bug Bypass**: Use the "Preferences -> Display" settings utility (`lumina-xconfig`) from within the VM to change the session size. This will ensure that the session resize is performed in a consistent manner for the entire VM.

## Migrating from other OS's
### FreeBSD
*Coming Soon: Instructions for enabling the package repository for Project Trident.*
 

### TrueOS (18.06+)
*Coming Soon: Instructions for enabling the package repository for Project Trident.*

### TrueOS "Desktop" (18.03)
How-to upgrade from the final release of the TrueOS "desktop" edition to Project Trident

*Coming Soon: Instructions for using pc-updatemanager to perform the update.*
