+++
title = "RC3 Available"
menutitle = "RC3 Available"
description = ""
date = "2018-11-10"
draft = false
pre = "<i class='fa fa-exclamation'></i>	"
+++

Release Candidate 3 of Project Trident is now available on [the download page](/download)!

This version is the first one based on the "trueos-master" branch of TrueOS, and with that comes a lot of changes and breaks from the previous versions.

1. FreeBSD version is now listed as 13-CURRENT instead of 12-CURRENT.
   * This may cause issues with upgrading if you try to use any method other than the `trueos-update` utility. 
2. The default bootloader has been changed by FreeBSD to the new "lua"-based version.
   * This may cause issues with the UEFI implementation on some older systems. There are possible mitigations for this in the "Errata" section on the download page.
3. The name prefix of the base packages has been changed from "FreeBSD-" to "OS-".
   * This is specific to Project Trident, and other TrueOS distributions may use other naming schemes.
4. Packages are aligned with the TrueOS ports tree as of November 3rd, 2018.
5. A number of default system-configuration settings are no longer getting setup properly with the new base of TrueOS. These are mentioned in the "Errata" section on the download page as well as methods for manually replacing these files (these should automatically be fixed upon update to RC4 when it is released).
6. From telegram, to get moused working;
  Step 1. kldload ums
  Step 2 service moused restart
  Step 3 start-trident-installer &
