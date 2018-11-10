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


## RC3 WARNINGS/ERRATA
Version RC3 of Project Trident is the first version based off-of the "trueos-master" branch of TrueOS. Because of this, there are a number of things that were discovered as broken or need some tweaks compared to previous versions:

1. FreeBSD bootloader was changed from the "forth"-based version to the new "Lua"-based version [browse the code here](https://github.com/trueos/trueos/tree/trueos-master/stand). This has resulted in some (older?) systems being unable to boot properly or cause FreeBSD kernel panics during bootup - particularly if the system is booting with an older UEFI implementation. Some possible solutions are:
   1. Update your system BIOS following the instructions from your system/motherboard manufacturer.
   2. If your system has weird corrupted terminal graphics during bootup, follow [this guide](https://github.com/trueos/trueos/wiki/UEFI-Resolution)
   3. Try switching your BIOS to legacy mode instead of UEFI mode. This may have other consequences though - UEFI is recommended for most modern graphics driver support.
2. The install ISO appears to not be starting many of the backend services (such as "moused"). If you experience trouble using your mouse within the installer, drop to the terminal and run the following commands:
   1. At the login prompt type: `root`
   2. Run: `service moused start`
   3. Re-start the graphical installer by running: `start-trident-installer`
2. Some TrueOS branding is still in place for the installed system on RC3. This can be fixed by running the following commands from a terminal:
   1. Reset PCDM theme: `sudo cp /usr/local/etc/pcdm.conf.trident /usr/local/etc/pcdm.conf`
   2. Reset default Lumina settings: `sudo cp /usr/local/etc/luminaDesktop.conf.trident /usr/local/etc/luminaDesktop.conf`
   3. If already logged into Lumina, delete your desktop settings with the command: `rm -r ~/.config/lumina-desktop`, then log out and log back in to re-load the default settings.

## General Release Notes
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

## Migration/Update Paths
### Trident RC2 and older
Between RC2 and RC3, the package repository format from TrueOS was moved from 2 repositories (base + ports) to a single "unified" package repository. This requires that the on-disk repository configuration file(s) need to be updated in order to recognize the new location for packages.

We have a script available on our package server in order to perform this update for you as needed, and all that needs to be done is run the following from a terminal:

```
fetch http://pkg.project-trident.org/repo-config/install-trident-repo.sh
sudo sh install-trident-repo.sh
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
