---
title: "Known Errata"
menutitle: "Errata"
description : "Additional steps that may be required when upgrading from older versions"
chapter: false
draft: false
weight: 3
pre: "<i class='fa fa-exclamation-triangle'></i>	"
---

## Known Virtualization Issues
* **VirtualBox Guest**: When resizing the window for the Project Trident VM, there may be a delay in the session detecting/adjusting to the new "screen" size. When using the Lumina desktop, you may also need to run `killall fluxbox` from the command-line to re-initialize the window manager if the borders around windows disappear after a session resize from outsize the VM.
   * **Bug Bypass**: Use the "Preferences -> Display" settings utility (`lumina-xconfig`) from within the VM to change the session size. This will ensure that the session resize is performed in a consistent manner for the entire VM.


## Known Upgrade Issues
This page details any additional steps that may be required before/during an upgrade from an older version of Project Trident. Make sure you apply **all** upgrade errata that impact your system version, from oldest to newest, before starting the upgrade process.

### 19.05 or older
The system update utility "sysup" needs to be forcibly updated **before** starting the upgrade procedures. Failure to follow this step will result in your system users and groups getting reset to FreeBSD defaults as well as other loss of system configurations.

* Run command: `sudo pkg install -fy sysup`
* Then start upgrade procedures normally

Post-Upgrade Test:

* If your user can no longer initiate the "shutdown" or "reboot" procedures from within the Lumina desktop environment, then you failed to follow this Errata properly. Roll back to the pre-upgrade boot environment and try again.

### 18.12 or older
FreeBSD removed the Qt4 "flavor" of packages from the FreeBSD ports tree prior to this release. The "pkg" utility was noticed to crash unexpectedly during the system upgrade procedures if Qt4 packages were currently installed. If the upgrade process fails, you will need to manually remove all the Qt4 packages on your system first, and then restart the upgrade process.

* Run Command: `sudo pkg remove -Ry qt4-corelib`
* Then start upgrade procedures normally
