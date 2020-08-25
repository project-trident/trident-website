+++
title = "20.08 Installation Update"
menutitle = "[20.08] Installer Updates"
description = "Updated install routine"
date = "2020-08-25"
draft = false
pre = "<i class='fa fa-exclamation'></i>	"
+++

The installation routine for Project Trident has been updated! 

The release/20.08 version of the installer has a few significant changes:

* The *zfsbootmenu* utility has had several new releases upstream, and changed the configuration file format for the tool significantly. This version of the installer updates our handling of this utility and ensures that zfsbootmenu is configured properly once again. If you previously installed PT and afterward it booted into rEFInd without any option to then boot the system, that was caused by the zfsbootmenu issue and is fixed now.
* Device enumeration/partition support has been enhanced! This results in the ability to install PT to all sorts of devices now, such as NVME drives, MMC/SDHC cards, and more!

Note that you **do not** need to download a new ISO to run the updated installation routine! When you start the install process from the ISO, it will prompt you to select a version of the installer to use. Simply select the new "release/20.08" version from that list and you will be good to go!

We are currently working on a new ISO with additional feature support as well. Stay tuned for updates!
