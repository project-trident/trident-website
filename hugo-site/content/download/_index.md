---
title: "Downloads"
menutitle: "Downloads"
description : ""
chapter: false
draft: false
weight: 2
pre: "<i class='fa fa-download'></i>	"
---

---
# Project Trident is closing down with an End-of-Life date of March 1, 2022
---

## System Requirements
|System|Recommended|Minimum |
|:--:|:--------------------:|:--------------:|
|Architecture| 64-bit | 64-bit |
| Memory | 4GB | 2GB |
|Disk Space| **1 whole disk**: 20GB+ | **1 whole disk**: 10GB+ |

## Version Note
This ISO is a dynamic netinstall image. It requires an internet connection before the installation can be started, but it **always** installs an up-to-date version of Project Trident using the latest official packages from Void Linux. 

New ISO's are only released as needed to update the installation procedure, and do not correspond to any particular "release" of Project Trident or Void Linux.

{{< download2 "https://download.project-trident.org/iso/21.09/" "Project Trident Installer" >}}


### Security Updates 
Package updates are available daily from Void Linux. These include security updates, kernel updates, and application updates on a frequent basis.

Run the `trident-update [-check | -update]` command to perform updates as desired. For safety, this will make a ZFS snapshot of your system before anything is changed, and you can roll back to that snapshot later if needed.

## Verify ISO Integrity
Project Trident digitally signs all packages and install images with OpenSSL keys. Package signatures are automatically verified by the "xbps" package manager from Void Linux, but the ISO signatures need to be verified manually using the "openssl" utility (which is available on all major operating systems).

NOTE: These instructions assume you have access to some command-line where you can type out a simple command. Consult the documentation for your current operating system to determine how to access this command-line.

1. Download the ISO
2. Download the "SHA512 Signature" file
3. Download the "Public SSL Key" file
4. From a terminal, run the "openssl" utility.
   * Run: `openssl  dgst -sha512 -verify <public-key-file> -signature <signature-file> <ISO-file>`
   * This will print out "Verified OK" or "Verification Failure" depending on the state of the file.
