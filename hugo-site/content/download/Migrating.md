---
title: "Migrating to Project Trident"
menutitle: "Migrating"
description : "Migration from other FreeBSD-based distributions"
chapter: false
draft: false
weight: 2
pre: "<i class='fa fa-suitcase'></i>	"
---

While migrating from other FreeBSD-based distibutions is not officially supported, it is sometimes still possible with a little bit of work. On this page we try to document some of the key steps, even if it is not a full walkthrough.


{{% notice warning %}}
Always backup any sensitive or important data to an external USB stick or system first.
{{% /notice %}}

## Important References
**Package repository URL's**

* UNSTABLE version: https://pkg.project-trident.org/pkg/release
* STABLE version: https://pkg.project-trident.org/pkg/stable

Public key for package verification can be found on the [Download Page](/download) (same key that is used for signing the ISO images).

## If your current system uses base packages
It might be possible to switch to Project Trident with a few steps:

1. Reconfigure your package repository settings to point to one of the Project Trident repositories.
   * Configuration files are typically located in "/etc/pkg" or "/usr/local/etc/pkg"
2. Install/update the "sysup" system update utility from the Project Trident repository
   * Run command: `sudo pkg install -fy sysup`
3. Perform a full system update to move completely over to the Project Trident repository
   * Run command: `sudo sysup -update -fullupdate`
   * When this process finishes successfully, reboot the computer: `shutdown -r now`
4. Install the Project Trident "core" package
   * Run command: `sudo pkg install trident-core`
5. Install any optional graphics drivers for your hardware
   * Nvidia GPU's: nvidia-driver, nvidia-driver-340, nvidia-driver-304 (pick one)
   * Virtualbox Guest additions: virtualbox-ose-guestadditions
6. [Optional] Run the Project Trident system-setup script
   * Run command: `sudo /usr/local/share/trident/scripts/sys-init.sh`
7. Reboot the system. 
   * Project Trident installs bootup services which scan and configure your graphical settings automatically.
   * A graphical login screen should appear indicating that your system is now ready to use.



