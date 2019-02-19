+++
title = "BSD Heritage"
MenuTitle = "BSD Heritage"
description = "Relationship and differences from other BSD operating systems"
chapter = false
weight = 2
pre = "<i class='fa fa-server'></i>	"
+++

Project Trident is a desktop-focused disribution of [TrueOS](http://trueos.org), which in turn is a variation of the [FreeBSD](http://freebsd.org) operating system which was officially started [in the early 1990's](https://www.freebsd.org/doc/handbook/history.html) but is itself a direct decendant of the [original AT&T UNIX](http://www.unix.org/what_is_unix/history_timeline.html).

Rather than re-iterate the history of the FreeBSD and TrueOS projects, this page focuses on the similarities and differences between Project Trident and TrueOS/FreeBSD.

## Similarities
The base operating system and kernel are identical between the various projects, as they are all built directly from the same source code, although at different times or from different branches of the source repositories.
This includes the kernel, hardware drivers, file systems, and more.

All of the applications which are available in the form of packages are built from the exact same "ports tree", which is a source repository of build instructions for over 35000 applications, libraries, and more.
These "ports" generally result in binaries which are compiled to run specifically on different FreeBSD-based operating system architectures.

### Architectures
FreeBSD itself supports multiple types of computer architectures (i386, amd64, various flavors of ARM, etc..), but TrueOS and Project Trident are specifically focused on the amd64 architecture (often called x86-64, or "64-bit"), but also include the support capabilities to directly run i386 binaries ("32-bit").

### Ports
Due to the addition of OpenRC to TrueOS for service management, the TrueOS project maintains a version of the FreeBSD ports tree which includes many additional files.
These extra files ensure that OpenRC versions of service files are available alongside the traditional *rc.d* service files from FreeBSD.
They also provide a testing area for other TrueOS changes before submission back to FreeBSD, including new ports, new versions of ports, and more.
TrueOS also uses GitHub for managing it's ports repository[1], whereas FreeBSD still uses a privately-hosted SVN repository[2].

*[1] [TrueOS ports repository](https://github.com/trueos/trueos-ports)*
*[2] [FreeBSD ports repository](https://svn.freebsd.org/)*

## Differences From TrueOS
*Note: Differences listed here also generally apply to other TrueOS-based distributions*

Being a desktop-focused distribution, Project Trident provides many different graphical solutions for common tasks on TrueOS based systems:

* Graphical front-end to the "pc-sysinstall" utility from TrueOS for managing the installation.
* Graphical system setup
   * While this is typically a manual task on TrueOS/FreeBSD, Project Trident provides a suite of scripts and utilities which handle all of the setup and maintenance of the graphical systems.
     These utilities run during the bootup routine and dynamically provide these features:
      * Automatic "best-driver" setup for your hardware based upon which graphical drivers are installed and whether they match the type of GPU contained by your hardware.
      * Automatic failover to one of two different graphical drivers ("vesa" or "scfb") should the main graphics driver fail to work (such as installing the wrong version of the NVIDIA driver for your system).
      * Dynamic loading of the video driver and any associated kernel modules on bootup, allowing the system harddrive to be moved between systems as needed with little to no loss of functionality (provided that the drivers for both are installed already - otherwise one of the failover drivers may be used).
* Graphical utilities for common tasks
   * The PCDM login manager.
   * The [Lumina Desktop Environment](https://lumina-desktop.org) is pre-installed and pre-configured for out-of-box usage.
   * A [graphical system-update utility](https://github.com/project-trident/trident-updatemgr) has been written just for Project Trident. This provides easy access to configuring and performing updates in addition to the ability to roll-back a system update as desired.
   * Removable media detection and on-demand usage is provided via integrations between Project Trident and the Lumina Desktop.
* Stable OS, Rolling Ports
   * Project Trident uses the 6-month "stable" branch of TrueOS for the OS-components themselves. This ensures there are no radical changes or binary compatibility issues for a 6-month period of time.
   * Project Trident also builds and provides a package repository of every "port" contained in the TrueOS ports repository. This package repository is also updated every week, ensuring a steady stream of new or updated applications very soon after they appear in FreeBSD/TrueOS.
   * Project Trident uses a [customized build configuration](https://github.com/project-trident/trident-build/blob/master/trident-master.json/) for both OS and ports to ensure that everything is built specifically to be used for a graphical operating system.

## Differences From FreeBSD

Many of these differences from FreeBSD actually come from the TrueOS project, so this list will change over time as the TrueOS and FreeBSD projects continue to evolve.

### OpenRC

TrueOS provides the OpenRC system for managing services on the OS in place of the "legacy" RC system currently used on FreeBSD. This difference is most notable in a few key ways:

* Faster bootup - OpenRC starts up services much faster and with better dependency handling than FreeBSD.
* Better status reporting - the `rc-status` utility provides an instant look of all the services on your system and their current status.
* Service files are located in "[/usr/local]/etc/init.d" rather than "[/usr/local]/etc/rc.d"
* Some services have different names: "dhcpcd" instead of "dhclient", "network" instead of "netif"
* Many OpenRC services are "multiplexed" for individual device/profile management
   * Example: The "network.wlan0" service controls the first wifi device, and should be started/stopped instead of the "network" service when reconfiguring the wifi settings.
* The [service-name]_enable="YES" entries on FreeBSD are no longer needed to enable services on bootup. Instead, OpenRC provides a method for grouping services together (called "runlevels"), and the `rc-update` utility is used to add/remove bootup registrations for services within these groups.
   * Example: `rc-update add dbus default` will add the "dbus" service to the "default" runlevel and enable it to automatically start on bootup. 
   * Example 2: `rc-update delete dbus default` will remove the "dbus" service from the "default" runlevel and prevent it from starting during bootup.
* The "service" utility can be used exactly the same way as on FreeBSD to interact with services.
   * Example: `service dbus stop` stops the **dbus** service when it is running.
   * Example 2: `service network.wlan0 restart` restarts the networking associated with the first wireless device.

### Base Packages 

TrueOS uses the package system for installing the OS itself in addition to the pre-compiled "ports". This functionality is called "base packages" and allows single package repository to contain both the OS and all the available applications in a single unified collection of files. This functionality provides the following features:

* The OS and packages are always in sync. A single system update can be used for the entire end-to-end update of the system - even when OS changes (such as a new kernel) are provided during a major release cycle.
* System updates are *FAST* and clean. All updates are performed within a new Boot Environment, ensuring that your live system is never touched while you are using it. All it needs is a reboot to finish the procedures and boot into the newly-updated system.
