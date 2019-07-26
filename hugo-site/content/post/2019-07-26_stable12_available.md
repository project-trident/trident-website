+++
title = "Project Trident STABLE-12 Now Available"
menutitle = "STABLE-12 Release"
description = "STABLE update train is now available based on TrueOS 12"
date = "2019-07-26"
draft = false
pre = "<i class='fa fa-exclamation'></i>	"
+++

A new update train is now available based on the FreeBSD/TrueOS STABLE branch (version 12).

This version uses the TrueOS ["trueos/stable/12"](https://github.com/trueos/trueos/tree/trueos/stable/12) branch. This train also provides rolling updates to the packages that are available in the repository.

## Train Features:
* **Static ABI:** Self-compiled binaries continue to run as-is for the lifetime of the stable branch
* **Base Packages:** Matching CURRENT, we are using the base package framework from TrueOS for building and distributing the stable branch. This results in cross-compatibility between the STABLE and release (CURRENT) versions of Project Trident and allows easily swapping between Trident versions.
* **OpenRC:** TrueOS has also applied OpenRC changes to the FreeBSD 12-STABLE sources. This allows using OpenRC for service management on the STABLE release just as it is on the CURRENT release.

## Installation Images
We are making installation images for the STABLE branch [available on our download page](https://project-trident.org/download/) alongside the current release images.

## Upgrades
The new "Trident-stable" repository is available in the configuration page of the graphical update manager. Activate that repository and perform a full system update to switch to that release train.

For the 19.07 release, there is a bug where the graphical configuration utility is not populating the available repository list. In this case, run the following command from a system terminal to switch to the new repository:
```
sudo sysup --change-train Trident-stable
```
When the command is finished, the update process can be started normally with the graphical utility.

# Summary
* **Q. Can I switch from the current release (FreeBSD 13) to the stable release (FreeBSD 12)**
   * **YES** Because of the base packages system that Trident uses from TrueOS, switching between different OS versions is as simple as activating the desired package repository and performing a full system update. This also ensures that the update is performed within a new Boot Environment, allowing you to roll back to previous system versions at any time.
* **Q. Is the CURRENT release train going to be removed?**
   * **NO** Due to inconsistencies in buildability for the CURRENT branch of FreeBSD/TrueOS, we made an executive decision in Project Trident to support two parallel update options: The CURRENT builds already in place and the new STABLE branch build of FreeBSD/TrueOS. The STABLE branch is more reliable and allows us to push out weekly package updates. The update schedule for the CURRENT repo is transitioning to a less frequent, probably monthly, routine.
