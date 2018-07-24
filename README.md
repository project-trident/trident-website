# trident-website
Source repository for the Project Trident website.
These sources are used by the "hugo" static-site generation system to create/deploy the website.

## Deployment
On a FreeBSD/TrueOS system, just run this command:
`sudo ./deploy_nginx.sh`
This will install the website and startup the nginx web server.

Notes:
* It is highly recommended to install the website into a FreeBSD/TrueOS jail.
* Packages used: "gohugo" and "nginx"

## Local Testing
Run `./test.sh` to spin up a [local version of the website](http://localhost:1313) on port 1313.

## Site Modification
Locations of files (relative to root of repository):
* Website source tree: "hugo-site"
* Image directory: hugo-site/static/images (can be referenced with /images/<imagefile>) within the site.
* Custom CSS file: hugo-site/static/css/theme-trident.css (overlayed on top of default theme CSS)
* Custom HTML "shortcodes" for use within Markdown pages/posts: hugo-site/layouts/shortcodes/*.html.
   * These shortcodes can be used in a markdown post via the following syntax (also see the [hugo documentation on shortcodes](https://gohugo.io/content-management/shortcodes/))
```
{{< shortcode [optional inputs] >}}
```
