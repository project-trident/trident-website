+++
title = "Void Linux 20.02 Image Available"
menutitle = "[20.02] Void Download Available"
description = "The 20.02 install image is now available"
date = "2020-02-14"
draft = false
pre = "<i class='fa fa-exclamation'></i>	"
+++

Project Trident is pleased to announce the first official release image based on Void Linux, available on the [Project Trident download page](/download).

Please note the four different "levels" of an installation that are available in the Project Trident installer:

* **Void** : Only the base-system from Void Linux and ZFS-related bootloader packages are installed.
* **Server** : A CLI-based system with additional services and utilities installed from Project Trident (firewall, cron, autofs, wireguard, additional shells, etc.)
* **Lite Desktop** : Everything needed for a graphical desktop install using Lumina. No extra fluff.
* **Full Desktop** : The "Lite" install with quite a few additional end-user utilities (office suite, Telegram, multimedia apps, etc).

**Note:** These installation levels provide pre-defined lists of packages to install for user convenience. The installed system can be easily be changed afterwards using the built-in package system.

## I installed the ALPHA, should I reinstall for the Release?
Yes. There have been many changes to boot setup and dataset organization since the ALPHA image. These changes are difficult to make without a full reinstall.

## I installed the BETA, should I reinstall for the Release?
No need. There it only takes a couple simple steps to migrate your BETA system to the RELEASE. These steps are listed in the [Migration Notes](https://github.com/project-trident/trident-docs/wiki/Converting-an-install-to-Project-Trident) on the Documentation wiki.

## Important notes

1. Due to how ZFS is packaged on Linux, a dynamic kernel module is automatically compiled for your specific system during the package installation. This may take a little while to complete, depending on your system hardware capabilities.
2. From our initial testing, the average time to perform the installation is about 30 minutes. This will vary depending on download speeds and compilation time of the DKMS modules.
3. The default shell for Void Linux is "dash" and is the "/bin/sh" of the system.
   * It might be helpful to run `chsh` after logging in to change the default login shell, as dash is very limited.
   * In shell scripts, make sure to use "#!/bin/bash" instead of "#!/bin/sh", otherwise you may experience odd script failures due to using "dash" instead of the traditional "Bourne shell".
4. The user password must be a minimum of 8 characters due to the ZFS encryption key length requirement. Modifying a user password to be less than 8 characters later on will break the user account!  
