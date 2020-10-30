+++
title = "Live Statistics"
MenuTitle = "Statistics"
description = "Automated statistics for numbers of Project Trident systems"
chapter = false
weight = 99
pre = "<i class='fa fa-line-chart'></i>	"
+++

Project Trident has a strict "no-tracking" policy for our users, and this directly translates over to runtime statistics that the project collects and maintains.

Project Trident does not include any "anonymous reporting" methods that are common in applications. Instead, the only thing that Project Trident tracks is the number of update file downloads from our web servers. This provides basic but useful statistics about the number of systems that are online at any given day or month. This also lets us see the version breakdown that are still running "out in the wild".

### Details
The metrics reported here are simply counts of the number of systems which are checking-in to the Project Trident package repository for updates. This only counts actual systems (using xbps) and also ignores additional events from the same IP within each 24-hour period.


{{< embed "https://project-trident.org:40001" >}}
