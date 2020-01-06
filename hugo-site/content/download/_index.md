---
title: "Downloads"
menutitle: "Downloads"
description : ""
chapter: false
draft: false
weight: 2
pre: "<i class='fa fa-download'></i>	"
---

## System Requirements
|System|Recommended|Minimum |
|:--:|:--------------------:|:--------------:|
|Architecture| 64-bit | 64-bit |
| Memory | 4GB | 2GB |
|Disk Space| 20GB+ | 10GB |
|Virtualization| VMWare, bhyve | VirtualBox |


{{< download2 "https://raw.githubusercontent.com/project-trident/trident-website/master/hugo-site/static/iso-manifests/" "Void Linux BETA" >}}
For details about what this BETA image provides, please see [the announcement](/post/void-beta-available/).

{{< downloads "https://pkg.project-trident.org/iso/stable/" "[Deprecated Jan 2020] Last FreeBSD STABLE" >}}

## Differences Between Versions
| Version | Repository Name | OS | OS Branch | Package Updates | Notes |
| :---: | :---: | :---: | :---: | :---: | :---: |
| STABLE | Trident-stable | TrueOS 12 | trueos/stable/12 | ~Weekly | Latest Release of FreeBSD |
| CURRENT | Trident-release | TrueOS 13 | trueos/master | No More Updates - Will be removed Dec 31, 2019 | Development branch of FreeBSD |

### Security Updates
Both versions receive regular security updates from FreeBSD which are then imported into TrueOS. These security fixes are included in the regularly scheduled package updates.

### Stability
The CURRENT version is based off of the development branch of FreeBSD and TrueOS, and may periodically contain work that is only partially-completed. While Project Trident attempts to catch and fix any issues from this, there is still a possibility that an issue will sneak past our QA and impact a release.

The STABLE version is based off of the most recent release verson of FreeBSD and TrueOS, with regular backports of security fixes after initial testing on the development branch. This results in many additional layers of QA for changes and is a much more "stable" experience.

### System ABI
The STABLE version has a static system ABI, meaning that self-created binaries and packages built for this version of the OS will continue to work across updates until it changes to the next major version number. The CURRENT version changes system ABI very regularly, typically every update or two.

### Driver Support
The STABLE version tends to lag quite a bit behind with regards to driver support for newer hardware. The CURRENT version contains all the latest hardware drivers and updates that have been committed to FreeBSD. For optimal hardware support on systems that were created within the last 2-3 years, it is recommended to use the CURRENT version.

## Verify ISO Integrity
Project Trident digitally signs all packages and install images with OpenSSL keys. Package signatures are automatically verified by the "pkg" utility on Project Trident, but the ISO signatures need to be verified manually using the "openssl" utility (which is available on all major operating systems).

NOTE: These instructions assume you have access to some command-line where you can type out a simple command. Consult the documentation for your current operating system to determine how to access this command-line.

1. Download the ISO
2. Download the "SHA512 Signature" file
3. Download the "Public SSL Key" file
4. From a terminal, run the "openssl" utility.
   * Run: `openssl  dgst -sha512 -verify <public-key-file> -signature <signature-file> <ISO-file>`
   * This will print out "Verified OK" or "Verification Failure" depending on the state of the file.

## General Release Notes
### Application/Package Availability
Every single release includes a manifest of all the packages and versions that are available in the repository.
This plaintext file can easily be [downloaded from the package server](http://pkg.project-trident.org/iso/release/manifests/pkg.list)

#### If the package does not appear on the list
1. See if a port exists for FreeBSD using [freshports.org](https://www.freshports.org)
  * *No Port*: You can follow the [FreeBSD Porters Handbook](https://www.freebsd.org/doc/en/books/porters-handbook/) to create a new port, and then submit it either to [FreeBSD](https://bugs.freebsd.org/bugzilla/) or to [TrueOS](https://github.com/trueos/trueos-ports). Once accepted by either project, the port will become available by Project Trident a short time later.
2. See if the port is failing to build by looking at the [port build logs](https://builds.ixsystems.com/poseidon/jail.html?mastername=trident-master-current).
   * Note that all the package build are iterative - so if the latest build has no record of it you may need to look at previous builds to find the job that tried to build the package.
   * Bug ticket and fixes for ports can both be submitted to the [TrueOS Ports repository](https://github.com/trueos/trueos-ports)
   * If a port build option needs to be changed, you can submit changes to the [Project Trident package settings on the trident-build repository](https://github.com/project-trident/trident-build/blob/master/trident-master.json).
