+++
title = "Void Linux 20.06 updates"
menutitle = "[20.06] Package and Installer Updates"
description = "New Installer and packages"
date = "2020-06-30"
draft = false
pre = "<i class='fa fa-exclamation'></i>	"
+++

The 20.06 updates for the Project Trident packages, as well as an updated version of the installer routine are now available!

### Installer routine: release/20.06
This can be used by selecting the "release/20.06" version of the install script when prompted in the installer. 
Note that the netinstall ISO has **not** been changed. There is simply a new version of the installer routine available for it to bootstrap and use.

Main Changes:

* Switch to using the new "trident-base" package for basic package dependencies instead of the "base-system" package from Void Linux.
* Switch to manually setting up the default UEFI boot option rather than the default setup from the rEFInd package. This fixes all the issues with UEFI booting that we could find on various systems.
* Leaves a bit more space on the end of the drive when doing the partitioning
* Remove the special nvidia-modeset boot option. No longer needed.
* Cleanup some of the initial configuration for zfsbootmenu.
* Adds the "xorg-video-drivers" meta-package for all graphical installation options (Lite and Full). Helps ensure graphical bootup works properly post-install. This meta-package and any unused graphics drivers can be manually removed later to lighten up the system packages without impacting any core functionality.
* Cleanup the default settings for rEFInd a bit (primarily cosmetic).

### trident-core 20.06
* Add a monthly ZFS scrub to the automated maintenance tasks in the background.
* Switch the root shell from /bin/sh (dash) to /bin/bash. This fixes many inconsistencies in the user experience when dropping to a root shell.
* Prefer ZFS ARC for memory cache.

### trident-desktop 20.06
* Add an updated logout routine to ensure that ZFS encrypted home directories are fully-closed after a logout via SDDM.
* Auto-tune ZFS ARC a bit more for desktop usage
* Removed the "alsa-plugins-pulseaudio" package. This package kept getting out of sync with the current version of pulseaudio and breaking the audio subsystems.

### [NEW] trident-base
This is a branch new meta-package from Project Trident that will be used as an alternative to the "base-system" meta-package from Void Linux.

Differences from the "base-system" package from Void:

* Linux Kernel 5.7 (update from 5.4)
* Ensure the ZFS package is a basic dependency
* Ensure the Wireguard package is a basic dependency
* Removes some un-needed packages ("void-artwork" for example)
* This still pulls in the "base-minimal" package from Void, to ensure we keep any packages that the Void developers also consider essential.
