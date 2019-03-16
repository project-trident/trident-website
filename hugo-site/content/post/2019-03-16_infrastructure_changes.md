+++
title = "Infrastructure Upgrades"
menutitle = "Infrastructure Upgrades"
description = "Backend system distribution upgrades"
date = "2019-03-16"
draft = true
pre = "<i class='fa fa-globe'></i>	"
+++

The 18.12-U8 package updates will be delayed until the week of March 25th, due to some importance infrastructure updates that are happening right now.

## Upgrade 1 : We are moving to a CDN!

The package distribution server that Project Trident uses right now is being sponsored by iXsystems. That was apparently not enough in their efforts to encourage the use of FreeBSD around the world, so they are increasing their sponsorship and moving Project Trident onto a professionally-managed CDN! We are in the middle of copying all of the packages and ISO's over to the new CDN right now and setting up the new distribution chain to ensure a reliable flow of updates. The transition over to the CDN should be seamless, it just takes a little bit of time to get all the data migrated and test it out.


Project Trident: Powered by [KeyCDN](https://www.keycdn.com/)  thanks to [iXsystems](https://www.ixsystems.com/)!



## Upgrade 2 : Migrating to version 1.1 of the TrueOS build framework

While the package server is "frozen" for the CDN transfer, we are taking this opportunity to begin testing the migration from version 1 to [version 1.1 of the TrueOS build framework](https://github.com/trueos/build)!

The early tests are looking very promising, with a 500MB+ reduction in ISO sizes as well as faster build times. This version of the build framework also implements a new organization for the "base" OS packages which replaces the current FreeBSD base package implementation (with 200+ package which are mostly unused) with one that is much simpler and easier to manage. Now, all of the base packages are created from the ["os" category in the TrueOS ports repository](https://github.com/trueos/trueos-ports/tree/trueos-master/os) and all the world/kernel build options are properly respected during the package procedures.

* **src** : The OS sources used for the world/kernel builds
* **kernel** : (*Required*) The OS kernel
* **kernel-debug** : The debugging symbols and other debugging tools for the OS kernel
* **userland-base** : (*Required*) The OS userland (formerly called the "OS-runtime" package)
* **userland-debug** : The debugging symbols/files for the userland utilities
* **userland-docs** : Documentation files for the userland utilities
* **userland-tests** : All of the self-test scripts and/or utilities for the userland
* **userland** : Meta-port for installing all of the various userland packages.

The `sysyup` system-update utility (which the Trident update manager uses) is already able to seamlessly upgrade a system from the older-style base packages to the new ones, so there should be no special steps required to upgrade current Project Trident systems to the new style of base packages.


We have already merged everything from the Project Trident build routines directly into v1.1 of the TrueOS build framework, so this greatly simplifies the procedures to checkout and build a custom TrueOS distribution for everybody who is interested!
