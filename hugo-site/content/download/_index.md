---
title: "Downloads"
menutitle: "Downloads"
description : ""
chapter: false
draft: false
weight: 2
pre: "<i class='fa fa-download'></i>	"
---

## System Requirements
|System|Recommended|Minimum |
|:--:|:--------------------:|:--------------:|
|Architecture| 64-bit | 64-bit |
| Memory | 2GB+ | 1GB |
|Disk Space| 20GB+ | 10GB |
|Virtualization| VMWare, bhyve | VirtualBox |


{{< downloads >}}


## General WARNINGS/ERRATA
TrueOS and FreeBSD recently changed their bootloader to a new tool written in Lua rather than the traditional bootloader written in Forth. If you experience issues with booting the ISO or the installed system, please [file a bug ticket with the FreeBSD project](https://bugs.freebsd.org). The source code for the Lua-based bootloader [can be found here](https://github.com/trueos/trueos/tree/trueos-master/stand)

* Some possible solutions for bootup issues are:
   1. Update your system BIOS following the instructions from your system/motherboard manufacturer.
   2. If your system has weird corrupted terminal graphics during bootup, follow [this guide](https://github.com/trueos/trueos/wiki/UEFI-Resolution)
   3. Try switching your BIOS to legacy mode instead of UEFI mode. This may have other consequences though - UEFI is recommended for most modern graphics driver support.

### Mouse Support within Virtual Machines
If you bootup the ISO in a virtual machine and lack the ability to move your mouse, try changing the mouse emulation to PS/2 instead of USB. We have noticed with VirtualBox in particular, that the USB device support does not work until after the VirtualBox guest extensions are loaded (I.E: on the installed system).

## General Release Notes
### Application/Package Availability
Every single release includes a manifest of all the packages and versions that are available in the repository.
This plaintext file can easily be [downloaded from the package server](http://pkg.project-trident.org/iso/release/pkg.list)

#### If the package does not appear on the list
1. See if a port exists for FreeBSD using [freshports.org](https://www.freshports.org)
  * *No Port*: You can follow the [FreeBSD Porters Handbook](https://www.freebsd.org/doc/en/books/porters-handbook/) to create a new port, and then submit it either to [FreeBSD](https://bugs.freebsd.org/bugzilla/) or to [TrueOS](https://github.com/trueos/trueos-ports). Once accepted by either project, the port will become available by Project Trident a short time later.
2. See if the port is failing to build by looking at the [port build logs](https://builds.ixsystems.com/poseidon/jail.html?mastername=trident-master-current).
   * Note that all the package build are iterative - so if the latest build has no record of it you may need to look at previous builds to find the job that tried to build the package.
   * Bug ticket and fixes for ports can both be submitted to the [TrueOS Ports repository](https://github.com/trueos/trueos-ports)
   * If a port build option needs to be changed, you can submit changes to the [Project Trident package settings on the trident-build repository](https://github.com/project-trident/trident-build/blob/master/trident-master.json).

### Known Issues
* **VirtualBox Guest**: When resizing the window for the Project Trident VM, there may be a delay in the session detecting/adjusting to the new "screen" size. When using the Lumina desktop, you may also need to run `killall fluxbox` from the command-line to re-initialize the window manager if the borders around windows disappear after a session resize from outsize the VM.
   * **Bug Bypass**: Use the "Preferences -> Display" settings utility (`lumina-xconfig`) from within the VM to change the session size. This will ensure that the session resize is performed in a consistent manner for the entire VM.

## Migration/Update Paths
### Trident RC2 and older
Between RC2 and RC3, the package repository format from TrueOS was moved from 2 repositories (base + ports) to a single "unified" package repository. This requires that the on-disk repository configuration file(s) need to be updated in order to recognize the new location for packages.

We have a script available on our package server in order to perform this update for you as needed, and all that needs to be done is run the following from a terminal:

```
fetch http://pkg.project-trident.org/repo-config/install-trident-repo.sh
sudo sh install-trident-repo.sh
fetch https://pkg.project-trident.org/iso/release/trident-master.pubkey -o /usr/share/keys/Trident.pub
sudo trueos-update check
sudo trueos-update upgrade
```
**WARNING** Running the `trueos-update upgrade` command will automatically reboot your computer when it is finished staging the updates.


### TrueOS 18.06+ (or any distribution of it)
This migration can be performed, but may require a bit of manual tweaking afterwards:

* Fetch and run the script to convert your system package repositories over to point to Project Trident:

```
fetch http://pkg.project-trident.org/repo-config/install-trident-repo.sh
sudo sh install-trident-repo.sh
sudo trueos-update check
sudo trueos-update upgrade
```
* Once the upgrade has been performed, you will need to install the trident packages with the following command: `sudo pkg install trident-core`. This will probably remove conflicting packages such as "trueos-desktop", "trueos-servers", and other similar meta-packages, but it is a good idea to verify that.
* If desired, run the `/usr/local/share/trident/scripts/sys-init.sh` script to perform the first-time setup routine for Project Trident. This will change things like the branding on PCDM, the default configuration for the Lumina desktop, and similar things.
* Reboot the computer. You are all set!

### TrueOS "Desktop" (18.03) or FreeBSD
There is no direct upgrade path for these kinds of systems, so you will need to follow these steps to migrate your system over to Project Trident:

**WARNING** : Always backup all important data to an external location before performing anything as intensive as a system installation!

1. Install/prepare the ISO just as for a new installation
2. On the disk setup page of the installer, select the "Boot Environment" option in order to perform a fresh installation into an existing ZFS system layout. This will change the system packages and system configs, but anything within the /usr/home directory should be preserved.
3. Re-create your user(s) with the same information and uid as before. This will allow those users to immediately start re-using the same home directory and data as before.
