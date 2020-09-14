+++
title = "Void Linux 20.09 updates"
menutitle = "[20.09] Package and Installer Updates"
description = "New packages"
date = "2020-09-14"
draft = false
pre = "<i class='fa fa-exclamation'></i>	"
+++

The 20.09 updates for the Project Trident packages, as well as an updated version of the installer routine are now available!

### [New] trident-automount
This is a backend daemon for Void Linux systems which monitors udev events and generates XDG desktop shortcuts for removable devices within the "/media" directory. For browsing file-storage devices, trident-automount will automatically configure some autofs rules which allow these devices to be dynamically browsed via the "/browse/[devicename]" directories. The XDG shortcuts that trident-automount generates will automatically check/adjust the shortcuts based upon the type of device/filesystem.

The devices are mounted on the system by autofs only while they are being used. Trident-automount has the autofs mountpoints configured such that any device which is not used for 5 seconds will be automatically un-mounted, and can safely be detached from the system. If you wish to verify if a device is safe to remove, just run "mount" from the command line to ensure that the device is not included at the bottom of the list.

### trident-core 20.09
* Some tweaks to the "trident-update" utility to ensure it works a bit better with a variety of Linux kernel versions.
* Switch from the "wireguard" package dependency, to just the "wireguard-tools" package dependency. Since Linux kernel 5.6, the Wireguard DKMS module is no longer needed, just the utilities.
* Automatically install and enable the "trident-automount" service for managing removable devices.

### trident-desktop 20.09
* Wallpaper/theme changes!
   * The "trident-nature" wallpaper set is now available, with a set of seven beautiful nature-scapes from around the world. The files and credits to the photographers can be found in the "/usr/share/wallpapers/trident-nature" directory
   * Setup a directory symlink at "/usr/share/wallpapers/default" which points to the system-default wallpaper directory. The default Lumina desktop settings were adjusted to use this dir as the default for wallpapers (for existing users, you will need to adjust your wallpaper settings to point to this "default" directory if so desired).
   * Setup a file symlink at "/usr/share/wallpapers/trident-login.jpg" which points to the system-default wallpaper to use for the SDDM login manager.
* Automatic support within the Lumina desktop for all shortcuts created by trident-automount.

### trident-base 20.09
* Linux Kernel 5.8 (update from 5.7)
* Ensure that the various firmware packages are installed for base-level hardware support.
