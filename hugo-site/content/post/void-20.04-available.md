+++
title = "Void Linux 20.04 updates"
menutitle = "[20.04] Package Updates"
description = "New PT package versions now available"
date = "2020-05-01"
draft = false
pre = "<i class='fa fa-exclamation'></i>	"
+++

The 20.04 package updates for the Project Trident packages are now available!

The main changes to the packages (aside from the general package updates from Void itself) are:

### trident-core 20.04
* Better flow and checks for developers
  * GOPATH is automatically set/used for go-based binaries.
  * Snapshots of the docker dataset will now get auto-pruned after a week. This will prevent the system from clogging up with disused snapshots leftover from running `docker build`.
* Automated system health routines
   * The package repository index will now get updated in the background every day (or after first connecting to the network).
   * The package repository cache will automatically get pruned to save disk space. This will remove obsolete package versions from the cache only, current versions will still be cached/used as needed.
* The `docker` service will now work out of box again. A change in the upsteam runit service broke operation on ZFS and had to be disabled manually:
   * https://github.com/project-trident/trident-core/commit/4358f16df50761fb72602422b55de05865c4c273

### trident-desktop 20.04
* Mouse cursors
   * A system-default mouse cursor theme is now included.
   * The user-set cursor theme overrides the system default one as expected.
* Variable DPI support
   * Mouse cursors now auto-adjust according to the DPI setting for the session
   * DPI detection systems are updated and more reliable now.
* trident-networkmgr
   * This utility has been updated with many fixes for wifi network settings.
   * All root access prompts were reduced down to a single permission prompt per action (maximum).
   * There is a known bug with connecting to insecure wifi networks which has been fixed in source, but did not get included in the package. This will be included in the next release/update.
