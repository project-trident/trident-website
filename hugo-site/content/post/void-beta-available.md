+++
title = "Void Linux Beta Image Available"
menutitle = "[BETA] Void Download Available"
description = "A beta-quality image of Void Linux is now available for testing."
date = "2020-01-06"
draft = false
pre = "<i class='fa fa-exclamation'></i>	"
+++


Project Trident is pleased to announce a new Beta-quality image based on Void Linux. This version is now available [on the download page](/download).

We have also converted our Trident "docs" repository over to a wiki-based system and are beginning to fill out information related to the Void Linux system setup and configuration there.
Please feel free to help expand this wiki as you are trying out the BETA image!

[Trident-Docs WIki Link](https://github.com/project-trident/trident-docs/wiki)


## What is new since the ALPHA image?

* Boot Environment support for fully-separate datasets, or even just rollback to snapshots of boot environments.. 
   * This is enabled via the new [zfsbootmenu](https://github.com/zdykstra/zfsbootmenu) utility created by Zack Dykstra. It is only setup for EFI-based bootloader support. Legacy-boot systems will not be able to use boot environments at the present time.
* User accounts. 
   * A single user account will now be created at installation time.
   * For EFI-booted systems, this user's home directory *will be encrypted*. It is setup so that logging into the user account will also decrypt the dataset for that user, and logging out will automatically lock it again.
   * Encrypted datasets are NOT supported on legacy-boot systems. Encrypting any ZFS datasets will break the ability for GRUB to support booting the zfs pool.
   * A new "trident-mkuser" utility has been created for making additional user accounts (encrypted homedir or not), and will be available later as part of the "trident-core" package.
* Installer changes... Lots of them.
   * The network-status detection routine has been overhailed and should now work on networks where "ping" is blocked.
   * Status of the installation is now properly detected (fail/success) with a menu option to browse the log file if one is available.
   * If an EFI install is completed, a reboot will automatically bypass the ISO and boot the installed system now (giving more time to remove the ISO install device later after the real system is already running).
   * The installation logfile is copied over to the newly-installed system now (/var/log/trident-install.log)
   * The "home" dataset is now mounted at /usr/home, and /home is a symlink to /usr/home (similar to BSD system layout).
   * The ZFS pool layout has been tweaked a bit after testing boot environment functionality.
   * Additional input verification checking has been integrated into the installer to help ensure reliable/successful installs.
   * The installer now provides 4 different "levels" of installation, which simply govern which packages get installed and configured:
      * **Void** : Only the base-system from Void Linux and ZFS-related bootloader packages are installed.
      * **Server** : A CLI-based system with additional services and utilities installed from Project Trident (firewall, cron, autofs, wireguard, additional shells, etc..)
      * **Lite Desktop** : (Experimental at the moment) A minimal desktop installation with the Lumina desktop.
      * **Full Desktop** : (Experimental at the moment) A Lumina desktop install with additional end-user utilities (office suite, telegram, multimedia apps, etc).
      * Note that these are just pre-defined lists of packages to install. The installed system can easily be changed via the package system later on.

## I installed the ALPHA, should I reinstall for the BETA?
Yes. There have been quite a few changes to boot setup and dataset organization since the ALPHA image which will not be easy to reproduce without a full reinstall.

The base system layout and bootloader setup appear to be quite stable now, so we do not anticipate a re-installation requirement between BETA and release at the present time - just the manual installation of a couple packages once they are available in the Void Linux repositories.

## What does this image provide?
* A full "ZFS-on-root" installation of Void Linux
* A full walk-through of the installation procedure in an easy-to-use fashion. No experience with disk formatting or partioning is required.
* Hybrid EFI and BIOS-boot capabilities. Both for the ISO and for the system post-install.
   * EFI booting is **required** for boot environment and dataset encryption support (zfsbootmenu)
   * rEFInd and zfsbootmenu are used for EFI boot support.
   * GRUB is used for Legacy booting, but does not support boot environments or ZFS encryption at the present time.
* Encrypted SWAP on ZFS (if swap space is selected)
* Support for both "glibc" and "musl" versions of Void packages in a single installer.
* Support for detecting and connecting to Wireless networks in an easy-to-use series of prompts (DHCP only). These settings get transferred over to the new installation for out-of-box network support.
* Due to the constant flow of updates to the Void Linux package repositories, this image is a complete "net-install" implementation. This means that all installed packages are always the current version from the repository, and result in a system which is fully up to date after the install is completed.
* Boot Environment support for fully-separate datasets, or even just rollback to snapshots of boot environments.. 
   * This is enabled via the new [zfsbootmenu](https://github.com/zdykstra/zfsbootmenu) utility created by Zack Dykstra. 
   * Boot environment support is **only** available for EFI-booted systems at the present time.
* User accounts. 
   * Each user account gets a separate ZFS dataset for their home directory. This is setup so the individual user can perform snapshot-related tasks on their own files without needing root permissions.
   * EFI-boot: Each user dataset *is* encrypted. This dataset is automatically locked/unlocked based on user login.
   * Legacy-boot: Each user homedir is *not* encrypted.

## What does this image NOT provide?

* Graphical Desktop Setup. 
   * We install the current lumina desktop package from Void by default, and a collection of other desktop packages, but none of the Trident utilities are ported or installed yet. 
   * Quick Hint: After logging in via the terminal, just run `start-lumina-desktop` to launch a graphical desktop session. The current Lumina package for Void is very "un-configured", so you will need to manually setup application shortcuts and change the theme settings around to make it more visually appealing.
* Partition support or multi-boot capabilities. 
   * This installer expects that a single, dedicated hard disk will be provided for the installation. And the installer will wipe and re-provision that entire disk - losing any previous data on that disk.

## Important notes

1. Due to how ZFS is packaged on Linux, a dynamic kernel module is automatically compiled for your specific system during the package installation. This may take a little while to complete, depending on your system hardware capabilities.
2. From our initial testing, the average time to perform the installation is about 30 minutes. This will vary depending on download speeds and compilation time of the DKMS module(s).
3. The default shell for Void Linux is "dash" and is the "/bin/sh" of the system.
   * It may be very helpful to run `chsh` after login to change the default login shell, since dash is very limited.
   * In shell scripts, make sure to use "#!/bin/bash" instead of "#!/bin/sh", otherwise you may experience odd script failures due to using "dash" instead of the traditional "Bourne shell".

## Looking ahead
The next step is finalizing all of the desktop/graphics initialization routines and pushing the trident-core and trident-desktop packages up to Void Linux (as well as any additional desktop-related packages that we might need). We are running a little bit behind our original timetable, but are still aiming to release the desktop-focused "RELEASE" version of PT based on Void Linux by the end of the month.
