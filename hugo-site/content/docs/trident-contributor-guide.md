+++
title = "Contributor Guide"
menutitle = "Contributor Guide"
description = "How to contribute to Project Trident"
pre = "<i class='fa fa-font'></i>	"
+++

## Introduction

Are you interested in contributing to Project Trident, but don't know where to get started?
This guide describes a wide variety of options to contribute to the project, from contributing code to making a simple donation.

### Quickstart

- Code contributions are made as pull requests on the [trident-build](https://github.com/project-trident/trident-build), [trident-installer](https://github.com/project-trident/trident-installer), and [trident-core](https://github.com/project-trident/trident-core) repositories.
- Documentation contributions are made as pull requests on the [trident-website](https://github.com/project-trident/trident-website) repository.
- Translations are to be determined.
- Use the GitHub issue system to report bugs.
  See the Project Trident [Open Source](http://project-trident.org/information/opensource/) page for a list of repositories to report issues.
- Donations are made on the [Trident website](http://project-trident.org/) by clicking the **Donate** button on the lower-left corner of the page.

## Code Contributions

Contributing code and fixing bugs is an important and very appreciated way to contribute to the project!
The general process to making Trident code contributions is to branch the relevant Project Trident repository, make changes, and submit a pull request to merge branches.
Forking the repository and submitting changes back upstream is also a good option.
See these [git workflow guides](https://guides.github.com/) for more details about working with *git* and GitHub. 

### Guidelines

Code languages.

Add comments to code changes!
Commenting code is extremely helpful to other contributors, testers, and users of the project.

Test submissions.

### Submitting a Change

To be added.

## Documentation Contributions

Writing documentation is a very easy way to begin contributing to Open Source projects.
Project Trident welcomes all documentation contributions!
Documentation for Trident is written in [Markdown](https://daringfireball.net/projects/markdown/) and stored in the **/hugo-site/content/docs/** directory of the [trident-website](https://github.com/project-trident/trident-website/tree/master/hugo-site/content/docs) repository.

There are no restrictions on a documentation contribution other than it be relevant to Project Trident.
Documentation contributions to Project Trident will be edited according to the [Style Guide](http://project-trident.org/docs/style-guide/).
It is recommended to reference the Style Guide when writing documentation for Project Trident, but it is not required.

### Edit Existing Documentation

Go to the [Project Trident website](http://project-trident.org/). Go to any page on the website and click **Edit this page** in the upper-right corner.
This opens a new browser tab to the relevant **.md** file on GitHub.
Log in to GitHub and click the **Pencil** (Edit this file) icon.
Make any changes to the text.
Click the **Preview Changes** tab to test the text for any Markdown syntax errors.
Write a summary of the changes in the fields at the bottom of the screen.
Click **Create a new branch for this commit and start a pull request.**
Click **Propose file change** and GitHub opens a pull request for review.

### Add New Documentation

Log in to GitHub and go to the [/docs/](https://github.com/project-trident/trident-website/tree/master/hugo-site/content/docs) directory in the **trident-website** repository.
Click **Create new file**.

Name the file, but be sure to add `.md` to the end of the name: `new-documentation.md`
Click into the **Edit new file** text area and write out the new file.
Reference the [Style Guide](http://project-trident.org/docs/style-guide/) for help with Markdown syntax or other writing guidelines.
Click the **Preview Changes** tab to test the text for any Markdown syntax errors.
Scroll to the bottom of the page when finished and write a quick summary of the new document.
Click **Create a new branch for this commit and start a new pull request.**
Click **Propose new file** and GitHub automatically opens a Pull Request to add the contribution to the Project.

### Local Workflow

On a system with **git** installed, open a terminal.
Enter `git clone https://github.com/project-trident/trident-website.git` to download the **trident-website** repository into a directory of the same name on the local system.
Make a new branch of the repository with `git checkout -b new-branch-name`
Go to the `/docs` subdirectory and open the **.md** files with a text editor to make changes.

Save changes with `git commit`: `git commit filename.md`.
This opens an editor to write a summary of the changes.
Push the branch to GitHub with `git push`: `git push origin new-branch-name`.

Open a browser and go to https://github.com/project-trident/trident-website.
Click the **Branch:** dropdown menu and select the branch that was just pushed.
Click **New pull request** to merge the branch into the **master** branch.  

## Translations

The translation system for Project Trident is still to be determined.

## Issue Reporting

Reporting an issue with Project Trident is handled through GitHub.
Go to the [relevant project-trident repository](http://project-trident.org/information/opensource/) and click the **Issues** tab.
Click **New Issue**, enter a descriptive title, and describe the bug.
Clarify if the report is about a current bug with Project Trident or a feature request for new functionality.

### Recommendations for Creating a Good Issue

Include useful details like system hardware information.
Don't overload the report with so much detail it distracts from the issue.
Be brief and direct about the issue.

Watch for activity on the issue after it is created.
Responding quickly to questions or other contributions in the issue thread can push an issue to a quicker resolution.

### Example Ticket

To be added.

## Donations

Maintaining a project is not free!
Donations are always welcome and used for project expenses.
Make a [donation](https://www.paypal.com/donate/?token=pMzYSgKGevR1OKxpnv_G1l7re8o40_RckGAAUbmfrLO29Xd5BRVvDZkCvVg-AjQP-7aoum&country.x=US&locale.x=US) by going to the [Project Trident](http://project-trident.org) website and clicking the **Donate** button in the lower-left corner of the page.

Project Trident also welcomes Enterprise-level sponsorships.
Contact the [Trident Core Team](mailto:core@project-trident.org) to set up a sponsorship.

Project Trident also welcomes donations of testing hardware and other equipment.
E-mail the [Trident Core Team](mailto:core@project-trident.org) about making equipment donations.

### Donation Transparency

The [trident-finances](https://github.com/project-trident/trident-finances) repository is updated quarterly with a list of project donations and expenses.
Donors will not be named unless otherwise requested.
