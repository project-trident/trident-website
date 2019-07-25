+++
title = "Project Trident STABLE-12 Now Available"
menutitle = "STABLE-12 Release"
description = "STABLE update train is now available based on TrueOS 12"
date = "2019-07-25"
draft = true
pre = "<i class='fa fa-exclamation'></i>	"
+++

A new update train is now available based upon the FreeBSD/TrueOS STABLE branch (version 12).

This version uses the "trueos/stable/12" branch of the [TrueOS source repository](https://github.com/trueos/trueos) for the operating system itself, as well as rolling updates to the packages that are available in the repository. This brings the following benefits:

* **Static ABI:** Self-compiled binaries will continue to run as-is for the lifetime of the stable branch
* **Base Packages:** Just as with the current builds, we are using the base package framework from TrueOS for building/distributing the stable branch. This results in cross-compatibility between the stable and release versions of Project Trident, and allows you to easily swap back and forth between versions as desired.
* **OpenRC:** TrueOS has also applied their OpenRC change to the FreeBSD 12-STABLE sources, allowing for the continued use of OpenRC for service management on the STABLE release just as it is on the current release.

## Installation Images
We are making installation images for the STABLE branch available on our download page alongside the current release images.

## Upgrades
The new "Trident-stable" repository is available in the graphical update manager (configuration page). Simply activate that repository and perform a full system update to switch over to that release train.

For the 19.07 release, there is a bug where the graphical configuration utility is not populating the available repository list. In this case, you can run the following command from a system terminal in order to switch to the new repository:
```
sudo sysup --change-train Trident-stable
```
One that is done, you can start the update process via the graphical utility normally.

# Important Notes
* "sysutils/hal" has been blacklisted from Project Trident and will no longer be available in the package repositories due to ongoing security concerns.
   * Utility was put into maintenance mode in May of 2008
   * Current version of FreeBSD port was added in May of 2010
   * Last maintenance commit to the upstream utility was in October of 2011
   * There have been security reports about hal for years, including the "Bald Eagle" exploit which was announced in a [2017 Wikileaks document release](https://wikileaks.org/ciav7p1/cms/page_9535850.html).
* As a side effect of blacklisting the "hal" port, all ports which have an *explicit* dependency on hal are automatically ignored by the package build system and will no longer have packages available in the Project Trident repositories. Some of these packages include:
   * The XFCE desktop environment
   * The MATE desktop environment
   * The GNOME desktop environment
   * The Cinnamon desktop environment.
   * None of these desktops are officially supported by Project Trident, but if you are manually installing and using these desktops, you will need to contact the relevant FreeBSD port maintainers to get this issue resolved: [bugs.freebsd.org](https://bugs.freebsd.org)

# FAQ
* **Q. Can I switch from the current release (FreeBSD 13) to the stable release (FreeBSD 12)**
   * **YES** Because of the base packages system that Trident uses from TrueOS, jumping between different OS versions is as simple as activating the desired package repository and performing a full system update. This also ensures that the update is performed within a new Boot Environment, allowing you the ability to roll back to previous system/OS versions at any time.
