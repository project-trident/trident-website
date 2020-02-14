---
title: "Known Errata"
menutitle: "Errata"
description : "Additional steps that may be required when upgrading from older versions"
chapter: false
draft: false
weight: 3
pre: "<i class='fa fa-exclamation-triangle'></i>	"
---

## Known Virtualization Issues
* **VirtualBox Guest**: When resizing the window for the Project Trident VM, there may be a delay in the session detecting/adjusting to the new "screen" size. When using the Lumina desktop, you may also need to run `killall fluxbox` from the command-line to re-initialize the window manager if the borders around windows disappear after a session resize from outsize the VM.
   * **Bug Bypass**: Use the "Preferences -> Display" settings utility (`lumina-xconfig`) from within the VM to change the session size. This will ensure that the session resize is performed in a consistent manner for the entire VM.
