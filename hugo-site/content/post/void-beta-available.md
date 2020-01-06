+++
title = "Void Linux Beta Image Available"
menutitle = "[BETA] Void Download Available"
description = "A beta-quality image of Void Linux is now available for testing."
date = "2020-01-06"
draft = false
pre = "<i class='fa fa-exclamation'></i>	"
+++


Project Trident is pleased to announce a new Beta-quality image based on Void Linux, available on the [Project Trident download page](/download).

We have also converted our Trident "docs" repository over to a wiki-based system. This will be the central location for all information related to the Void Linux system setup and configuration.
Please feel free to help expand this wiki while you are using the BETA image!

[Trident-Docs WIki](https://github.com/project-trident/trident-docs/wiki)


## What is new since the ALPHA image?

* Boot Environment support for fully-separate datasets and snapshot rollback for boot environments.
   * This is provided by the new [zfsbootmenu utility](https://github.com/zdykstra/zfsbootmenu) created by Zack Dykstra. It is only configured for EFI-based bootloader support. Legacy-boot systems cannot use boot environments at the present time.
* User accounts. 
   * A single user account is created at installation.
   * For EFI-booted systems, this user home directory *is encrypted*. It is configured so that logging in to the user account  also decrypts the dataset for that user. Logging out locks the user dataset.
   * Encrypted datasets are NOT supported on legacy-boot systems. Encrypting any ZFS datasets breaks the ability for GRUB to support booting the zfs pool.
   * A new "trident-mkuser" utility has been created for making additional user accounts. This utility supports creating encrypted home directories and will be included later as part of the "trident-core" package.
* Installer changes... lots of them.
   * The network status detection routine has been overhauled and now works on networks that block "ping".
   * Installation status is now properly detected (fail/success) with a menu option to browse the log file if one is available.
   * For EFI installs, rebooting after completing the installation automatically ignores the ISO and boots the installed system. This allows more time to remove the ISO install device after the real system is already running.
   * The installation logfile is copied over to the newly-installed system, to */var/log/trident-install.log*.
   * To maintain a BSD-style system layout, the "home" dataset is mounted at */usr/home*, and */home* is a symlink to */usr/home*.
   * The ZFS pool layout has been tweaked a bit after testing boot environment functionality.
   * Additional input checking has been integrated into the installer to help ensure successful installs.
   * The installer provides four different "levels" of installation. This governs which packages get installed and configured:
      * **Void** : Only the base-system from Void Linux and ZFS-related bootloader packages are installed.
      * **Server** : A CLI-based system with additional services and utilities installed from Project Trident (firewall, cron, autofs, wireguard, additional shells, etc.)
      * **Lite Desktop** : (Experimental) A minimal desktop installation with the Lumina desktop.
      * **Full Desktop** : (Experimental) A Lumina desktop install with additional end-user utilities (office suite, Telegram, multimedia apps, etc).
      * Note that installation levels provide pre-defined lists of packages to install for user convenience. The installed system can be easily be changed using the built-in package system.

## I installed the ALPHA, should I reinstall for the BETA?
Yes. There have been many changes to boot setup and dataset organization since the ALPHA image. These changes are difficult to make without a full reinstall.

The base system layout and bootloader setup have been very stable, so we do not anticipate a re-installation requirement between BETA and 1.0 release. At present, all that will be required is manually installing a few packages when they are available in the Void Linux repositories.

## What does this image provide?
* A full "ZFS-on-root" installation of Void Linux.
* A full walkthrough of the installation procedure in an easy-to-use fashion. No experience with disk formatting or partitioning is required.
* Hybrid EFI and BIOS-boot capabilities. Both for the ISO and for the system post-install.
   * EFI booting is **required** for boot environment and dataset encryption support with *zfsbootmenu*.
   * *rEFInd* and *zfsbootmenu* are used for EFI boot support.
   * GRUB is used for Legacy booting, but does not currently support boot environments or ZFS encryption.
* Encrypted SWAP on ZFS, when swap space is selected.
* Support for both "glibc" and "musl" versions of Void packages in a single installer.
* Support for detecting and connecting to wireless networks in an easy-to-use series of prompts (DHCP only). These settings get transferred over to the new installation for out-of-box network support.
* Due to the constant flow of updates to the Void Linux package repositories, this image is a complete "net-install" implementation. This means that all installed packages are always the current version from the repository and the system is fully up-to-date after the install is complete.
* Boot Environment support for fully-separate datasets and snapshot rollback for boot environments.
   * This is enabled with the new [zfsbootmenu utility](https://github.com/zdykstra/zfsbootmenu) created by Zack Dykstra.
   * Boot environment support is currently **only** available for EFI-booted systems.
* User accounts. 
   * Each user account gets a separate ZFS dataset for their home directory. This is configured so the individual user can perform snapshot-related tasks on their own files without needing root permissions.
   * EFI-boot: Each user dataset *is* encrypted. This dataset is automatically locked/unlocked based on user login.
   * Legacy-boot: Each user homedir is *not* encrypted.

## What does this image NOT provide?

* Graphical Desktop Setup.
   * We install the current lumina desktop package from Void by default, and a collection of other desktop packages, but none of the Trident utilities are ported or installed yet. 
   * Quick Hint: After logging in with the terminal, run `start-lumina-desktop` to launch a graphical desktop session. The current Lumina package for Void is unconfigured, so you will need to manually setup application shortcuts and change the theme settings.
* Partition support or multi-boot capabilities. 
   * WARNING: This installer expects that a single, dedicated hard disk is provided for the installation. The installer will wipe and re-provision that entire disk, deleting any data stored on the disk.

## Important notes

1. Due to how ZFS is packaged on Linux, a dynamic kernel module is automatically compiled for your specific system during the package installation. This may take a little while to complete, depending on your system hardware capabilities.
2. From our initial testing, the average time to perform the installation is about 30 minutes. This will vary depending on download speeds and compilation time of the DKMS modules.
3. The default shell for Void Linux is "dash" and is the "/bin/sh" of the system.
   * It might be helpful to run `chsh` after logging in to change the default login shell, as dash is very limited.
   * In shell scripts, make sure to use "#!/bin/bash" instead of "#!/bin/sh", otherwise you may experience odd script failures due to using "dash" instead of the traditional "Bourne shell".
4. The user password must be a minimum of 8 characters due to the ZFS encryption key length requirement of ZFS encryption. Creating or modifying a user password to be less than 8 characters will break the user account!  

## Looking ahead
The next step is finalizing all of the desktop/graphics initialization routines and pushing the trident-core and trident-desktop packages up to Void Linux, including any additional desktop-related packages that we might need. We are running a little bit behind our original timetable, but are still aiming to release the desktop-focused "RELEASE" version of PT based on Void Linux by the end of the month.
