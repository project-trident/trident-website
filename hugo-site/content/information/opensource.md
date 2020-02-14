+++
title = "Open Source"
MenuTitle = "Open Source"
description = "Description of all sources and how to submit changes"
chapter = false
weight = 10
pre = "<i class='fa fa-github'></i>	"
+++

Project Trident is fully open-source, meaning that anybody can view the underlying "control code" for the operating system as well as all of our utilities. The BSD license that we use for our project also ensure that anybody can copy/modify/use our source code as desired without any legal entanglement or repercussions.
We strongly encourage everybody who is interested in the underpinnings of Project Trident to take a look! If you see anything that could use to be changed, please feel free to open a bug ticket about it or even submit the change directly!

To help you get started, we have listed the breakdown and summary of each of our source repositories below, as well as links to relevant bug trackers or websites as well.

### Primary Repositories
Project only has a few repositories that govern the overall course of the project. Most components are stand-along tools and utilities which each have their own developers and bug trackers:

| Project | Source Repository | Bug Tracker | Description |
|:---------:|:----------------------------:|:----------------:|:----------------:|
|trident-installer|[project-trident/trident-installer](https://github.com/project-trident/trident-installer)|[GitHub issues](https://github.com/project-trident/trident-installer/issues)|ISO creation|
|trident-core|[project-trident/trident-core](https://github.com/project-trident/trident-core)|[GitHub issues](https://github.com/project-trident/trident-core/issues)|Core configuration files and settings for post-install use|
|trident-artwork|[project-trident/trident-artwork](https://github.com/project-trident/trident-artwork)|[GitHub issues](https://github.com/project-trident/trident-artwork/issues)|Artwork, wallpapers, banners, and other graphics for Project Trident|
|trident-icons|[project-trident/trident-icons](https://github.com/project-trident/trident-icons)|[GitHub issues](https://github.com/project-trident/trident-icons/issues)|XDG icon theme(s) for Project Trident|
|trident-website|[project-trident/trident-website](https://github.com/project-trident/trident-website)|[GitHub issues](https://github.com/project-trident/trident-website/issues)|Everything associated with this website (including Hugo pages/theme)|

### Featured Repositories
There are a number of tools and utilities that Project Trident relies on for functionality, but are external projects with their own websites and source control.

| Project | Source Repository | Bug Tracker | Description | Website |
|:---------:|:----------------------------:|:----------------:|:----------------:|:-----------:|
|Lumina Desktop|[lumina-desktop](https://github.com/lumina-desktop)|[GitHub issues](https://github.com/lumina-desktop/lumina/issues)|Graphical user interface: Everything post-login|[lumina-desktop.org](https://www.lumina-desktop.org)|
|Void Linux Packages| [void-packages](https://github.com/void-linux/void-packages)|[GitHub issues](https://github.com/void-linux/void-packages/issues)|All packages: including Linux kernel and userland|[voidlinux.org](https://www.voidlinux.org)|

### Inherited Repositories from TrueOS
A number of the graphical utilities from the old TrueOS "desktop" release were also migrated over to Project Trident. Some of these tools may be active and available as a package and some of them may just be archives that are preserved for historical reference.

|Status | Project | Source Repository | Description |
|:--------:|:---------:|:----------------------------:|:----------------:|
| **Active** | qsudo | [project-trident/qsudo](https://github.com/project-trident/qsudo) | Graphical interface to "sudo" (launch app as root) |
| *Archive* | PCDM | [project-trident/pcdm](https://github.com/project-trident/pcdm) | Graphical login manager for TrueOS |
| *Archive* | pc-mixer | [project-trident/pc-mixer](https://github.com/project-trident/pc-mixer) | Graphical mixer utility for the system tray |
| *Archive* | pc-networkmanager | [project-trident/pc-networkmanager](https://github.com/project-trident/pc-networkmanager) | Graphical network configuration utility |
| *Archive* | pc-firewall | [project-trident/pc-firewall](https://github.com/project-trident/pc-firewall) | Graphical firewall utility: *Replaced by SysAdm* |
| *Archive* | pc-webkitviewer | [project-trident/pc-webkitviewer](https://github.com/project-trident/pc-webkitviewer) | Small browser "wrapper" to make a local html file or URL look like a native app |
| *Stagnant* | pc-diskmanager | [project-trident/pc-diskmanager](https://github.com/project-trident/pc-diskmanager) | Graphical tool for viewing/changing zpool and disk information |
| *Archive* | pc-pdfviewer | [project-trident/pc-pdfviewer](https://github.com/project-trident/pc-pdfviewer) | Small PDF viewer using Qt5 : *Replaced by lumina-pdf* |
| *Archive* | pc-mounttray | [project-trident/pc-mounttray](https://github.com/project-trident/pc-mounttray) | Small tray utility for detecting/mounting removable media : *Replaced by FreeBSD automountd integrations* |
| *Archive* | gitterdone | [project-trident/gitterdone](https://github.com/project-trident/gitterdone) | Small browser wrapper around the "Gitter" website to make it seem like a local app |
| *Archive* | diligent | [project-trident/diligent](https://github.com/project-trident/diligent) | Small browser wrapper around the "Slack" website to make it seem like a local app |

## How to send in an update
Changes to all of the above repositories can be performed/submitted via git or the GitHub website. The only prerequisite is that you [create an account on GitHub](https://github.com/join?source=header-home) before you can send in changes.

### Simple Changes (1 file at a time)
Once logged into GitHub and browsing through the sources via the GitHub web interface, you can submit changes the following ways:

#### Edit an existing file
When viewing an existing file, just follow these steps to make/submit a change to it:

* Click on the little "pencil" icon on the right-hand side of the file header bar near the top of the page (desktop site only - if using a mobile device you will need to scroll to the bottom of the page and click the option to switch to the desktop version of the website first).
* Make your changes in the (now editable) file area.
* At the bottom of the page, fill in a commit message (usually a short summary of what you changed and why)
* Select the option to "Create a new branch for this commit and start a pull request".
* Click the "Commit changes" button.
* This will automatically open a new page to fill in a message for the pull request (PR). Just fill that out in the same way as the commit message and click the "create pull reqest" button.

#### Add a new file
For submitting new artwork, wallpapers, or other new individual files just follow the following steps:

* *TO-DO*


#### Thats all it takes! 
One of the Project Trident team members will review your PR within a week (typically within a day or two), and either merge your change into the repo or submit a reply/comment on your PR asking for additional information or changes before the PR is accepted. 
If a change is requested for your PR, you can make further changes to the file directly through the PR page itself (using the same procedure listed above for single-file changes).
