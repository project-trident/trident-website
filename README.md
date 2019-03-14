# trident-website
Source repository for the [Project Trident website](http://project-trident.org).
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

## Charts and such
The "mermaid" shortcode can be use to access the mermaid.js library for generating flowcharts and such. The reference material for this library is located [HERE](https://mermaidjs.github.io/flowchart.html), and can be used in a markdown pages as such:
```
{{< mermaid >}}
graph LR
  A[Square Box] --> B((Circle))
  B --> C{Diamond}
  C -.-> A
{{< /mermaid >}}
```
