+++
title = "2020 OS Migration"
menutitle = "2020 OS Migration"
description = "Taking Project Trident into the Void"
date = "2019-10-14"
draft = true
pre = "<i class='fa fa-exclamation'></i>	"
+++


## Background
First let me remind everybody that Project Trident has never been, nor will ever be, an operating system. It has always been a *distribution* of an existing operating system. Project Trident has always focused on enhancing the *usability* of an operating through all sorts of means: custom installers, automatic setup routines, graphical utilities, and more.

Project Trident up to this point has always been based on FreeBSD (via the TrueOS build framework and changes) due to the relationship between the Project Trident team and the TrueOS team. Unfortunately, we have multiple issues with the underlying FreeBSD OS (typically surrounding hardware compatibility or basic communications standards ) and even after many years there is still no resolution for any of those issues in sight. Because of this, we felt that it was time to shift our focus and move to an operating system that better suites Project Trident and our users.

## Requirements
For a stable and reliable end-user experience, there were several requirements that Project Trident had for the underlying operating system while we were looking for a new base:

1. Must be able to be run completely with *packages* from the upstream OS provider. If the answer to every configuration question is to recompile the kernel and/or every package on the system, then that is not for us.
2. Upstream application packages must be both *up-to-date* (current state) and regularly *updated* (future state) in a timely manner.
3. The OS must be willing to accept changes from outside contributors in a timely manner. Some kind of continuous integration system for building and testing pending changes would be preferred.
4. The OS must have the graphical subsystems available and working, but not have any other well-established desktop development community available at the present time. Project Trident has never been one to follow the pack and we want to partner with the OS to help it grow and expand into the graphical desktop area by writing tools and utilities specially-tailored for that OS.
5. The OS must have newer hardware support than FreeBSD, and also be setup for continuing/regular updates to that hardware support in a timely manner.
6. The OS must be setup in a sustainable model that is likely to be around for the next decade or two. Project Trident focuses on the long-term instead of chasing every new fad in the computing world.
7. Since we are most comfortable with BSD systems, we would prefer to find a system which follows (at least loosely) the "do one thing and do it well" motto. This typically results in a larger collection of small and fast utilities which are easier to update individually without breaking the entire system.

## Non-Requirements
These are things we **intentionally** did not factor into the requirements for a new OS.

1. Size of the community. 
   * We want to help the OS grow their community by helping to develop new features and functionality. 
   * While there is still a minimum size needed for some of our other requirements, we were *not* looking for a well-established system just so that we can siphon away some of their existing community.
2. ZFS-on-root. 
   * While this is preferred due to our experience with using OpenZFS on TrueOS/FreeBSD, this is not a deal-breaker if the system does not provide ZFS-on-root support. In fact, this might be the first area where Project Trident can contribute back to the OS by adding support for this type of installation.

# The Result
After several months of examination and testing of the various operating systems that are available right now, we have reached a conclusion. Project Trident will be moving to [***Void Linux***](https://voidlinux.org).

In additional to meeting our OS requirements with flying colors, there were several features of Void Linux that also attracted our attention:

* **runit** 
   * The more we run this, the more impressed we are with the speed, simplicity, and ease of management for this init system.
* **LibreSSL**
   * This was one of the initial features of Project Trident when it split from TrueOS in 2018, but had to get shelved due to changes in upstream FreeBSD. We are greatly looking forward to getting back to using LibreSSL by default.
* **musl libc**
   * We are greatly impressed with the musl version of libc and looking forward to not using glibc for our tools.
   * For those of you unfamiliar with it, here is a quick comparison between the various libc versions that we found: [http://www.etalabs.net/compare_libcs.html](http://www.etalabs.net/compare_libcs.html)

## Benefits of the migration
This change will result in some *immediate* benefits for Project Trident:

1. Better GPU driver support
   * Functional AMD video card support via the amdgpu driver.
   * Newer NVIDIA 390.x driver support.
   * Many other open-source graphics drivers also become functional.
2. Better sound card and streaming support.
   * Newer audio chipsets are supported automatically.
   * Streaming audio through HDMI connections should now become functional.
3. Better wireless support
   * Newer wifi shipsets are supported.
   * Wireless connections will actually run at the proper connection speeds for the protocol type (n, ac, etc..).
4. Bluetooth support
   * For the first time, PT will actually be able to start supporting and leveraging bluetooth devices due to a functional backend implementation from the OS.
5. Much newer versions of applications for end-users.
6. Faster boot times.
7. Hybrid EFI/Legacy installation and boot support.

## Detriments of the migration
As with all change, there will be some immediate downsides as well for the project as well:

1. Loss of the TrueOS system configuration utilities.
   * These are TrueOS/FreeBSD specific utilities such as *sysadm*.
   * This is not a huge deal. We were already needing to write replacement utilities for *sysadm* anyway.
2. Loss of a familiar environment.
   * As with all major changes like there, there will be a learning period with the new system.
   * This downside will rapidly fade with time but is one of the reasons why we are taking our time with the switchover. We want to ensure that we are doing things the "right" way instead of just following the "easy" way.

## Timetable for the migration
We will continue working toward this migration over the next couple months and are planning to announce/release the new version of Project Trident based on Void Linux in January of 2020.
We may make an early-access "alpha" or "beta" image available prior to then, with the understanding the many things may still be incomplete or missing until the actual release.

We will **not** be creating a migration path from the FreeBSD-based Project Trident over to the new Void-based version. Please be prepared to copy your user data (/home/*) to a temporary location such as a removable drive before installing the new version and copying the data back.

# Conclusion
To sum up - this is a very exciting time for Project Trident. The more we use Void Linux in our testing, the more impressed we are. We look forward to continuing working on a system where people can focus on getting stuff done.


To quote from *Casablanca* : "I think this is the beginning of a beautiful friendship"
