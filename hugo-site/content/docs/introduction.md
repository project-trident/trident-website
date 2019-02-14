+++
title = "Introduction"
MenuTitle = "Introduction"
chapter = false
weight = 2
pre = "<i class='fas fa-info'></i>   "
+++

# Introduction

Welcome to Project Trident!

Project Trident is a desktop distribution of [TrueOS](https://www.trueos.org), which is a rolling-release variant of [FreeBSD](https://www.freebsd.org).
The goal of the Project is to provide a simple, secure, and highly usable FreeBSD experience.
Project Trident is completely independent and [financially backed through the generous contributions of the Open Source community](/sponsors).

[Project Trident](https://project-trident.org) began in 2018 when TrueOS was reorganized into a scaled down server installation of FreeBSD.
The discontinued desktop portion of TrueOS was taken by Ken Moore and J.T. Pennington and rebuilt into Project Trident.

Project Trident is essentially a customized installation of TrueOS and FreeBSD, not a forked derivative.
Project Trident has a simple graphical installer that has partition support and other customization options.
The underlying TrueOS/FreeBSD system is kept intact and provides a fully functional FreeBSD system.
Other differences from FreeBSD include:

-   Project Trident pre-configures the BSD-licensed Lumina desktop environment.
    Additional desktop environments can be installed and appear in the graphical login menu.

-   The Project Trident installer supports configuring ZFS partitions during installation.

-   Project Trident has both graphical and command line software management systems.

-   Project Trident provides many graphical utilities for system configuration and management.

-   Project Trident comes pre-configured with a number of automatic scripts for dynamically configuring the graphics display system and other desktop-oriented automatic systems such as dynamically suppoerting removable media.

-   The Project Trident boot menu supports boot environments or snapshots of the operating system.
    The System Update Manager automatically creates a new boot environment before every update.
    If an update fails, the system can be rebooted into an earlier boot environment.
    This allows for easy recovery if any issues happen during the update process.

These articles cover the installation and use of Project Trident.
All documentation must be considered a "work in progress" and is wholly dependent on Project Trident community contributions.

## Features

Project Trident provides many features:

-   **Easy installation:** Insert the installation media and reboot the system to start the installer.
    Fill in the prompts in the installation menus.

-   **Automatically configured hardware:** Video, sound, network, and other devices automatically configure during installation.

-   **Customizable desktop interface:** Project Trident installs the Lumina desktop by default.
    Additional desktop environments can also be installed to support user preferences.

-   **Easy software management:** The AppCafe makes installing, upgrading, and uninstalling software safe and easy.

-   **Lots of software available:** Most software ported to FreeBSD is available on Project Trident.
    There are currently over 26,100 applications available on FreeBSD.

-   **Easy to update:** Project Trident has a built-in System Update Manager.
    This notifies the user about available updates and makes it easy to apply TrueOS security fixes, bug fixes, and system enhancements.
    Additionally, the Update Manager is used to upgrade the operating system or update installed software.

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

-   **Naturally immune to viruses and other malware:** Most viruses are written to exploit the Windows operating system.
    These are incompatible with the binaries and paths found on a Project Trident system.
    Additional antivirus software is also available in the Appcafe.
    This is useful when sending or forwarding email attachments to users running other operating systems.

-   **Potential for serious damage is limited:** Privilege separation between users and the administrator account (root) are built-in.
    Files and directories can only be modified by root any any users and groups with permission.
    Any executed programs or scripts are only granted the permissions of that user.
    A malicious program can only infect the files and directories owned by the user.
    Core operating system files are protected.
    Only users that are *wheel* and/or *operator* group members can gain administrative access.
    These users are still not allowed to list directory contents or access files outside of the set "user" and "group" permissions.

-   **Built-in firewall:** The default firewall ruleset allows Internet access and any available network shares.
    The firewall does not allow any inbound connections to the computer.

-   **Few default services:** All boot services can be viewed in the Service Manager.
    Service Manager also allows starting, stopping, and adding or removing from boot any system service.

-   **SSH is disabled:** SSH can only be enabled by the administrator (root).
    This prevents bots and outside individuals from accessing the Project Trident system.
    If SSH access is required, add `sshd\_enable=YES` to **/etc/rc.conf**.
    Then, start the service with the Service Manager or by typing `sudo service sshd start` in the command line.
    Root access is required.
    A firewall rule must also be added using the Firewall Manager.
    Allow SSH connections through the default SSH TCP port *22*.

-   **SSH root logins are disabled:** If SSH is enabled, login as a regular user and use `su` or `sudo` for administrative actions.
    Do not change this setting, as it prevents an unwanted user from having complete access to the system.

-   **sudo is installed:** `sudo` allows users in the *wheel* group permission to run an administrative command after typing the user password, not the *root* password.
    The first user created during installation is added to the *wheel* group.
    Use the User Configuration in Desktop Settings to add other users to the *wheel* group.
    To change the default `sudo` configuration, use `visudo` as *root*.
    This command verifies there are no syntax errors, which could inadvertently prevent root access.
    
-   [AES instruction set](https://en.wikipedia.org/wiki/AES_instruction_set) (AESNI) support is loaded by default for the Intel Core i5/i7 processors that support this encryption set.
    This support speeds up AES encryption and decryption.
    
-   **Automatic notification of security advisories:** The System Update Manager utility automatically checks for any updates available from a [security advisory](https://www.freebsd.org/security/advisories.html) that affects Project Trident.
The administrator can keep the operating system fully patched against vulnerabilities with a mouse click.

-   Tor Mode can be used to anonymously access Internet sites as it automatically forwards all Internet traffic through the [Tor Project's](https://www.torproject.org/) transparent proxy service.

To learn more about security on TrueOS and Project Trident systems, `man security` is a good place to start.
These resources provide more information about security on FreeBSD-based operating systems:

-   [FreeBSD Security Information](https://www.freebsd.org/security/)
-   [Security Section in the FreeBSD Handbook](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/security.html)
-   [Hardening FreeBSD](http://www.bsdguides.org/2005/hardening-freebsd/)

