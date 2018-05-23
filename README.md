# trident-website
Source repository for the Project Trident website.

## Deployment
On a FreeBSD/TrueOS system, just run this command:
`sudo ./deploy_nginx.sh`
This will install the website and startup the nginx web server.

Notes:
* The first time the deploy script is run, it will prompt to install a number of packages (nginx, php*). Once those are installed, the script continues to run non-interactively.
* It is highly recommended to install the website into a FreeBSD/TrueOS jail.

## Local Testing
Run `./test.sh` to spin up a [local version of the website](http://localhost:8000) on port 8000.

## Site Modification
Locations of files (relative to root of repository):
* Overall Site Configuration: grav-site/user/config
* Individual Pages: grav-site/user/pages
* Images: grav-site/user/themes/photographer/img
