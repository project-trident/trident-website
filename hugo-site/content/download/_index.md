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


{{< download2 "https://raw.githubusercontent.com/project-trident/trident-website/voidify/hugo-site/static/iso-manifests/" "Void Linux" >}}

### Security Updates
Package updates are available daily from Void Linux. These include security updates, kernel updates, and application updates on a frequent basis.

## Verify ISO Integrity
Project Trident digitally signs all packages and install images with OpenSSL keys. Package signatures are automatically verified by the "xbps" package manager from Void Linux, but the ISO signatures need to be verified manually using the "openssl" utility (which is available on all major operating systems).

NOTE: These instructions assume you have access to some command-line where you can type out a simple command. Consult the documentation for your current operating system to determine how to access this command-line.

1. Download the ISO
2. Download the "SHA512 Signature" file
3. Download the "Public SSL Key" file
4. From a terminal, run the "openssl" utility.
   * Run: `openssl  dgst -sha512 -verify <public-key-file> -signature <signature-file> <ISO-file>`
   * This will print out "Verified OK" or "Verification Failure" depending on the state of the file.
