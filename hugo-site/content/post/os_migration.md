+++
title = "2020 OS Migration"
menutitle = "2020 OS Migration"
description = "Taking Project Trident into the Void"
date = "2019-10-14"
draft = false
pre = "<i class='fa fa-exclamation'></i>	"
+++


## Background
It's important to reiterate that Project Trident is a *distribution* of an existing operating system. Project Trident has never been a stand-alone operating system. The goal of Project Trident is enhancing the *usability* of an operating system as a graphical workstation through all sorts of means: custom installers, automatic setup routines, graphical utilities, and more.

Currently, Project Trident is based on FreeBSD and uses the TrueOS build framework. Over the years, we have accumulated multiple long-standing issues with the underlying FreeBSD OS. Issues with hardware compatibility, communications standards, or package availability continue to limit Project Trident users. After many years of waiting for solutions, there don't appear to be any resolutions on the horizon. To continue to strive for the stated project goals, we have had to make the difficult decision to shift our focus and move to an operating system that better suits what Project Trident is trying to deliver to our users.

## Operating System Requirements
For a stable and reliable end-user experience, there were several requirements that Project Trident had for the underlying operating system while we were looking for a new base:

1. Must be able to be run completely with *packages* from the upstream OS provider. The project does not want to force its users to recompile the kernel and/or every package on the system when there are configuration issues.
2. Upstream application packages must be both *up-to-date* (current state) and regularly *updated* (future state) in a timely manner. Project Trident users are continuously asking for updated packages and we want to make sure we are choosing the best solution for this need.
3. The OS must be willing to accept changes from outside contributors in a timely manner. Some kind of continuous integration system for building and testing proposed changes is preferred.
4. The OS must have working graphical subsystems, but not have any other well-established desktop development community. Project Trident is seeking to "fill a need". We want to partner with an OS to help it grow and expand into the graphical desktop area by writing tools and utilities specially-tailored for that OS.
5. The OS must have newer hardware support than FreeBSD. It must also be organized to continually update hardware support in a timely manner.
6. The OS must have a sustainable long-term model. Project Trident wants to offer a stable environment that people can use for many years.
7. Since we are most comfortable with BSD systems, we would prefer to find a system that follows (at least loosely) the "do one thing and do it well" motto. This typically results in a larger collection of small and fast utilities that are easier to update individually without breaking the entire system.

## Non-Requirements
These are things we *intentionally* did not factor into the requirements for a new OS.

1. Size of the community.
   * We want to help the OS grow their community by helping to develop new features and functionality. 
   * While there is still a minimum size needed for some of our other requirements, we are not *not* looking to steal users away from a well-established system.
2. ZFS-on-root. 
   * While this is preferred due to our experience with using OpenZFS on TrueOS/FreeBSD, this is not a deal-breaker if the system does not provide ZFS-on-root support. In fact, this is a good opportunity for Project Trident to contribute back to the OS by adding support for this type of installation.

# The Result
After several months of examination and testing of the various operating systems that are available right now, we have reached a conclusion. Project Trident will rebasing with [***Void Linux***](https://voidlinux.org).

In additional to meeting our OS requirements with flying colors, there were several features of Void Linux that also attracted our attention:

* [**runit**](http://smarden.org/runit/)
   * The more we run this, the more impressed we are with the speed, simplicity, and ease of management for this init system.
* **LibreSSL**
   * This was one of the initial features of Project Trident when it split from TrueOS in 2018, but had to get shelved due to changes in upstream FreeBSD. We are greatly looking forward to getting back to using LibreSSL by default.
* **musl libc**
   * We are greatly impressed with the musl version of libc and wanted to avoid being locked into using glibc for our tools.
   * For those of you unfamiliar with it, here is a quick comparison between the various libc versions that we found: [http://www.etalabs.net/compare_libcs.html](http://www.etalabs.net/compare_libcs.html)
* [**xbps package manager**](https://voidlinux.org/usage/xbps/)
   * Since the system is managed primarily through packages, it is important to ensure that the package management utility is up to the task. The "xbps" package manager seals the deal with a fast, reliable method for interacting with system packages.

## Migration Benefits
This change will result in many *immediate* benefits for Project Trident:

1. Better GPU driver support
   * Functional AMD video card support with the amdgpu driver.
   * Newer NVIDIA 390.x driver support.
   * Many other open-source graphics drivers also become functional.
2. Better sound card and streaming support.
   * Newer audio chipsets are supported automatically.
   * Streaming audio through HDMI connections should now become functional.
3. Better wireless support
   * Newer wifi shipsets are supported.
   * Wireless connections will actually run at the proper connection speeds for the protocol type (n, ac, etc..).
4. Bluetooth support
   * For the first time, PT will be able to start supporting and leveraging bluetooth devices due to a functional backend implementation from the OS.
5. Much newer versions of applications for end-users.
6. Faster boot times.
7. Hybrid EFI/Legacy installation and boot support.

## Migration Drawbacks
As with all change, there will be some initial drawbacks for the project:

1. Loss of the TrueOS system configuration utilities.
   * These are TrueOS/FreeBSD specific utilities such as *sysadm*.
   * This is not as big a problem as it may appear. Project Trident has already planned to write replacement utilities for the *sysadm* utility independently of this OS migration.
2. Loss of a familiar environment.
   * As with all major changes, there will be a learning period with the new system.
   * This downside is temporary, but we intend to take more time with this switchover to lessen the impact on our users. We want to ensure that we are doing things the "right" way instead of just following the "easy" way.

## Migration Timetable
We will continue working toward this migration over the next several months and are planning to announce and release the new Void Linux version of Project Trident in January 2020.
We might make an early-access "alpha" or "beta" image available before January, but please understand that many things can be unfinished until the actual release.

We will **not** be creating a migration path from the FreeBSD-based Project Trident to the new Void-based version. Please be prepared to copy your user data (`/home/*`) to a temporary location like a removable drive before installing the new version and copying the data back.

# Conclusion
To sum up - this is a very exciting time for Project Trident. The more we've tested Void Linux, the more impressed we have been. We look forward to working with an operating system that helps Project Trident continue to provide a stable, high-quality graphical desktop experience.


To quote from *Casablanca* : "I think this is the beginning of a beautiful friendship"
