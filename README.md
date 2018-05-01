# trident-website
Source repository for the Project Trident website.

## Deployment
On a FreeBSD/TrueOS system, just run the following command:
`sudo ./deploy_nginx.sh`
This will install the website and startup the nginx web server.

Notes:
* The first time the deploy script is run, it will prompt to install a number of packages (nginx, php*). Once those have been installed, the script will run non-interactively mode.
* It is highly recommended to install the website into a FreeBSD/TrueOS jail.


## Site Modification
Locations of files (relative to root of repository):
Pages: grav-site/user/pages
