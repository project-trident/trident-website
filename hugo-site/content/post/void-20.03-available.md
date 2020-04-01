+++
title = "Void Linux 20.03 updates"
menutitle = "[20.03] Package Updates"
description = "New PT package versions now available"
date = "2020-04-01"
draft = false
pre = "<i class='fa fa-exclamation'></i>	"
+++

The 20.03 package updates for the Project Trident packages are now available!

The main changes to the packages (aside from the general package updates from Void itself) are:

### trident-core 20.03
* Additional tuning for ZFS
* Changes to the `trident-update` utility
   * Remove old kernels before update
   * Auto-update xbps as needed (with pre-update snapshot of BE)
   * Additional safeguard for re-generating the initramfs post-update
* Theme the bash shell by default (user settings still overwrite these as appropriate)
* Add the ability to inject custom firewall rules into the open-out profile (/etc/firewall-conf/custom-*.conf)

### trident-desktop 20.03
* Pull in the new trident-networkmgr utility by default
* Enable touchpad tap-to-click out of box
* Ensure the XDG_RUNTIME_DIR is wiped on logout.

### trident-networkmgr
This is a brand-new utility from Project Trident, specifically for managing network setup and devices.

**Key Features:**

* View current status of all network links
* Selectively enable/disable specific links (typically not needed for daily use)
* Browse and connect to wifi networks (if wifi device is available)
   * This uses wpa_supplicant in the backend - so that service must be enabled for this functionality to work. PT already enables this service out-of-box.
* Setup static IP profiles which will activate based upon which network you connect to.
   * This uses dhcpcd in the backend - so that service must be enabled for this functionality to work. PT already enables this service out-of-box.
   * If you connect to a network where none of your profiles match, it will automatically use DHCP address assignment.
   * Note: If you already use some kind of hard-coded static IP setting on your system, you will need to disable that change before using trident-networkmgr to setup your static IP profiles. The different setting mechanisms may conflict with each other.
* DNS Management via resolvconf
   * This allows you to easily inject custom DNS servers into the resolver ordering.
   * This uses `resolvconf` in the backend, and plays nicely with other services which need to adjust DNS as needed (such as VPN's or docker).
* Firewall management for nftables.
   * This ties in to the new firewall profile mechanisms from the trident-core package (if installed) and grants the ability to create/edit custom firewall rules on top of the selected profile.
   * Also provides a quick interface to see if the firewall is active and stop/start the firewall as needed.
* VPN Management (wireguard)
   * If wireguard is installed, this provides an easy way to import wireguard client profiles and start/stop them as needed.
   * We are planning to add OpenVPN support to this tool in a later version as well.

The trident-networkmgr utility is also available for pure Void-Linux systems as well, but you may need to install and enable the wpa_supplicant, dhcpcd, and nftables services before functionality becomes available in the utility (it will disable pages/tabs as appropriate for your system). Wireguard will also need to be installed before that functionality is usable.
