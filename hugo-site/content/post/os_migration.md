+++
title = "2020 OS Migration"
menutitle = "2020 OS Migration"
description = "Taking Project Trident into the Void"
date = "2019-10-14"
draft = true
pre = "<i class='fa fa-exclamation'></i>	"
+++


## Background
First let me remind everybody that Project Trident has never been, nor will ever be, an operating system. It has always been a **distribution** of an existing operating system. Project Trident has always focused on enhancing the *usability* of an operating through all sorts of means: custom installers, automatic setup routines, graphical utilities, and more.

Project Trident up to this point has always been based on FreeBSD (via the TrueOS build framework and changes) due to the relationship between the Project Trident team and the TrueOS team. Unfortunately, we have multiple issues with the underlying FreeBSD OS (typically surrounding hardware compatibility or basic communications standards ) and even after many years there is still no resolution for any of those issues in sight. Because of this, we felt that it was time to shift our focus and move to an operating system that better suites the goals of the project.

## Requirements
For a stable and reliable end-user experience, there are several requirements that Project Trident had for the underlying operating system:

1. Must be able to be run completely with *packages* from the upstream OS provider. If the answer to every configuration question is to recompile the kernel and/or every package on the system, then that is not for us.
2. Upstream application packages must be both *up-to-date* (current state) and regularly *updated* (future state) in a timely manner.
3. The OS must be willing to accept changes from outside contributors in a timely manner. Some kind of continuous integration system for building and testing pending changes would be preferred.
4. The OS must have the graphical subsystems available and working, but not have any other graphical "distributions" available at the present time. Project Trident has never been one to follow the pack and we want to partner with the OS to help it grow and expand by writing tools and utilities specially-tailored for that OS.
5. The OS must have newer hardware support than FreeBSD, and also be setup for continuing/regular updates to that hardware support in a timely manner.
6. The OS must be setup in a sustainable model that is likely to be around for the next decade or two. Project Trident focuses on the long-term instead of chasing every new fad in the computing world.
7. Since we are most comfortable with BSD systems, we would prefer to find a system which follows (at least loosely) the "do one thing and do it well" motto. This typically results in a larger collection of smaller and fast utilities which are easier to update individually without breaking the system.

## Non-Requirements
These are things we DID NOT care about when looking for a new OS.

1. Size of the community. We want to help the OS grow their community by helping to develop new features and functionality. While there is still a minimum size needed for some of our other requirements, we are not looking for a system just to siphon away some of their users and make ourselves look important.
2. ZFS. While preferred due to our experience with using OpenZFS on TrueOS/FreeBSD, this is not a deal-breaker if the system does not provide ZFS-on-root support. In fact, this might be the first area where Project Trident can contribute back to the OS by adding support for this type of installation.

# The Result


## Benefits of the migration
This change will result in some immediate benefits for Project Trident:

1. Better GPU driver support
   * Functional AMD video card support via the amdgpu driver.
   * Newer NVIDIA 390.x driver support.
   * Many other open-source graphics drivers also become functional.
2. Better sound card and streaming support.
   * Newer audio chipsets are supported automatically.
   * Streaming audio through HDMI connections should now become functional. This is especially important for newer laptop models.
3. Better wireless support
   * Newer wifi shipsets are supported.
   * Wireless connections will actually run at the proper connection speeds for the protocol type (n, ac, etc..).
4. Bluetool support
   * For the first time, PT will actually be able to start leveraging bluetooth device support due to a functional backend implementation from the OS.

## Detriments of the migration
As with all change, there will be some immediate downsides as well:

1. Loss of the TrueOS system configuration utilities.
   * These are TrueOS/FreeBSD specific, so it will take some time for PT to write new graphical configuration utilities for all the various types of system configuration settings that are available.
