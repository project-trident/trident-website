+++
title = "Void Linux Alpha Image Available"
menutitle = "[ALPHA] Void Download Available"
description = "An alpha-quality image of Void Linux is now available for testing."
date = "2019-11-07"
draft = false
pre = "<i class='fa fa-exclamation'></i>	"
+++


Project Trident is please to announce a new Alpha-quality image of the new version based on Void Linux is now available [on the download page](/download).

## What does this image provide?

* A full "ZFS-on-root" installation of Void Linux
* A full walk-through of the installation procedure in an easy-to-use fashion. No experience with disk formatting or partioning is required.
* Hybrid EFI and BIOS-boot capabilities. Both for the ISO and for the system post-install.
* Encrypted SWAP on ZFS (if swap space is selected)
* Support for both "glibc" and "musl" versions of Void packages in a single installer.
* Support for detecting and connecting to Wireless networks in an easy-to-use series of prompts (DHCP only). These settings get transferred over to the new installation for out-of-box network support.
* Due to the constant flow of updates to the Void Linux package repositories, this image is a complete "net-install" implementation. This means that all installed packages are always the current version from the repository, and result in a system which is fully up to date after the install is completed.

## What does this image NOT provide?

* Boot Environments. 
   * While the ZFS layout is prepared for boot environments, we are still experimenting with various BE support systems to figure out which packages and/or utilities to use.
* User accounts. 
   * Only the root acount is setup initially.
* Graphical Desktop Setup. 
   * We install the current lumina desktop package from Void by default, but none of the Trident utilities are ported or installed yet. 
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
With the ALPHA now ready, we are moving into preparing a BETA release next. This stage involves porting over our existing tools and utilities, creating user management subsystems, and integrating the boot-to-graphics systems.
