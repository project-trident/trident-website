+++
title = "Features of Project Trident"
MenuTitle = "Features"
description = "Features of Project Trident"
chapter = false
weight = 1
pre = "<i class='fa fa-flag'></i>	"
+++

## Privacy
Project Trident treats user privacy as a primary goal. We takes many steps to ensure the privacy of our users:

* No website registration or tracking. The only statistics the project keeps track of are numbers of file downloads and these download numbers may be publicly posted on the website or other places.

* Project Trident systems do **not** "phone home" and submit user or system information back to the project.

* Project Trident does not sell advertising space. You are free to use the system without any advertisements!
 

## Feature Details

Project Trident provides many features:

-   **Easy installation:** Insert the installation media and reboot the system to start the installer.
    Fill in the prompts in the installation menus.

-   **Automatically configured hardware:** Video, sound, network, and other devices automatically configure during installation.

-   **Customizable desktop interface:** Project Trident installs the Lumina desktop by default.
    Additional desktop environments can also be installed to support user preferences.

-   **Lots of software available:** The entire package repository of Void Linux is available, with updates happening daily.

-   **Easy and safe to update:** Project Trident includes utilities to automatically perform system snapshots prior to running any updates. This makes it trivial to perform full-system updates and optionally roll-back right from the bootloader.

-   **No fragmentation:** Project Trident hard drives never need defragmenting and are formatted with OpenZFS, a self-healing filesystem.

-   **Laptop support:** Provides power saving and automatic switching between wired and wifi network connections.
    The rolling release model of Project Trident provides an environment to quickly add support for new hardware.

-   **Easy system administration:** Project Trident provides many graphical tools for performing system administration.

-   **Vibrant community:** Project Trident has a friendly and helpful community.

### Security

The Project Trident system is secure by default.
This section is an overview of the built-in security features.
There are also tips about increasing the security of the installed system beyond the configured defaults.

The security features built into Project Trident include:

- **All user home directories are encrypted out of box.** The individual user directories are only "unlocked" and decrypted when that user logs in to the system. Logging out or rebooting the system automatically locks home directories.

- **Naturally immune to viruses and other malware written for other Operating Systems:** Most viruses are written to exploit the Windows operating system.
  These are incompatible with the binaries and paths found on a Project Trident system.
  Additional antivirus software is also available in the Appcafe.
  This is useful when sending or forwarding email attachments to users running other operating systems.

- **Potential for serious damage is limited:** Privilege separation between users and the administrator account (root) are built-in.
  Files and directories can only be modified by root or users and groups with permission.
  Any executed programs or scripts are only granted the permissions of that user.
  A malicious program can only infect the files and directories owned by the user.
  Core operating system files are protected.
  Only users that are *wheel* group members can gain administrative access.
  These users are still not allowed to list directory contents or access files outside of the set "user" and "group" permissions.

- **Built-in firewall:** The default firewall ruleset allows Internet access and any available network shares.
  The firewall does not allow any inbound connections to the computer unless authorized by the user.

- **Few default services:** All boot services can be viewed in the Service Manager.
  Service Manager also allows starting, stopping, and adding or removing any system service from boot.

- **SSH is disabled by default:** SSH can only be enabled by the administrator (root).
  This prevents bots and outside individuals from accessing a Project Trident system.
  If SSH access is required, start the service with the Service Manager or by typing `sudo ln -s /etc/sv/sshd /var/service` in the command line.
  Root access is required.
  A firewall rule opening up TCP port *22* for SSH access is also required. Alternatively, the firewall can be temporarily disabled by running `sudo sv stop nftables` (remember to start it again later, a reboot will also bring the firewall back up).

- **SSH root logins are disabled:** If SSH is enabled, login as a regular user and use `su` or `sudo` for administrative actions.
  Do not change this setting, as it prevents an unwanted user from having complete access to the system.

- **sudo is installed:** `sudo` allows users in the *wheel*  group permission to run an administrative command after typing the user password, not the *root* password.
  The first user created during installation is added to the *wheel* group.
  Use the User Configuration in Desktop Settings to add other users to the *wheel* group.
  To change the default `sudo` configuration, use `visudo` as *root*.
  This command verifies there are no syntax errors, which could inadvertently prevent root access.

### ZFS

ZFS is an enterprise grade file-system with many features.
Support for high storage capacities, high reliability, the ability to quickly take snapshots, boot environments, continuous integrity checking and automatic repair, RAIDZ designed to overcome hardware RAID limitations, and native NFSv4 ACLs are all ZFS features available in Project Trident.

The [ZFS Wikipedia entry](https://en.wikipedia.org/wiki/ZFS) provides an excellent starting point to learn about its features.
[FreeBSD Mastery: ZFS](https://www.michaelwlucas.com/os/fmzfs) by Michael W Lucas and Allan Jude is also a helpful ZFS and FreeBSD resource.

These resources are also useful:

-   [ZFS Evil Tuning Guide](https://www.solaris-cookbook.eu/solaris/solaris-10-zfs-evil-tuning-guide/)
-   [FreeBSD ZFS Tuning Guide](https://wiki.FreeBSD.org/ZFSTuningGuide)
-   [ZFS Best Practices Guide](https://documents.irf.se/get_document.php?group=Computer&docid=311)
-   [ZFS Administration Guide](https://docs.oracle.com/cd/E19253-01/819-5461/index.html)
-   [Becoming a ZFS Ninja (video)](https://blogs.oracle.com/video/becoming-a-zfs-ninja)
-   [Blog post explaining ZFS storage stack simplification](https://blogs.oracle.com/bonwick/rampant-layering-violation)
