+++
title = "Alternate Architectures"
menutitle = "Alternate Architectures"
description = "What will it take to support other system hardware?"
date = "2018-09-17"
draft = false
pre = "<i class='fa fa-server'></i>	"
+++

We are asked frequently about the ability to run on architectures other than x86.  We are generally limited by the upstream support from TrueOS and FreeBSD for these architectures.  Whatever options we have through those projects is what we can work with.

The request we receive more than any other so far is ARM support. However, that’s not the only option on the table.

### What architectures are we interested in?
Ken is interested in RISC-V and has looked at the HiFive board which you can read about here: [https://www.sifive.com/products/hifive-unleashed/](https://www.sifive.com/products/hifive-unleashed/)

JT is interested in the OpenPOWER architecture.  He has some experience with working on Power6 and Power7 systems, but has never had the opportunity to work with Power8 or Power9.  He's currently eyeing up one of [Raptor Computing's Development Systems](https://www.raptorcs.com/content/TLSDS3/intro.html)

As mentioned above, we are often asked about arm64.  While arm64 does look promising, the landscape of arm boards is very fractured.  One of JT's good friends, Jason Plum, is one of the core developers of Arch Linux ARM and has significant experience in porting Linux to the plethora of arm boards that are produced and released onto the market. Knowing the type of work that is required to support new boards and the constant effort to chase every new board developed, we do not feel that it is our best interest to spend time and energy into supporting tons of random boards.

Cavium’s ThunderX is very attractive, but we run into the same problem of sourcing hardware.  You can read about ThunderX here: [https://www.cavium.com/product-thunderx-arm-processors.html](https://www.cavium.com/product-thunderx-arm-processors.html)

###  What do you need to get started with other architectures?
The hardware sourcing problem is the same problem that we have for all of the big three Architectures; ThunderX, OpenPower, and RISC-V.
A decent dev system for any of these alternate architectures is going to run in the neighborhood of $2,500 to obtain.  With this cost barrier, we won't be able to target every alternative architecture right away. However, if the community wants to donate hardware or contribute time and code to supporting these architectures, we will do what we can to support these efforts.

Hopefully, we will eventually support all of the architectures we listed, but we have to pick a logical starting point. The first architecture support attempt has not been decided by the current project contributors.

.....

Oh, and since we know there is going to be *someone* out there who asks about MIPS...  Lets just say that if you can find a MIPS system on par with the systems mentioned previously then we might consider it.
