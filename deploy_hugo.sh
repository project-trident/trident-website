#!/bin/sh
#Script to take the statically-generated pages and deploy them with nginx
DIST_DIR="$1"
PROFILE_NAME="trident"
FINAL_SITE="project-trident.org"

if [ -z "${DIST_DIR}" ] ; then
  DIST_DIR="/usr/local/www/${PROFILE_NAME}"
fi

if [ 0 -ne `id -u` ] ; then
  CMD_PREFIX="sudo"
fi

# Build the static site with Hugo and deploy it in the dist dir
basedir=`realpath $(dirname $0)`
cd "${basedir}/hugo-site"
/usr/local/bin/hugo --ignoreCache -b "http://${FINAL_SITE}" -d "${basedir}/dist"
cd ..
chown -R www:www "${basedir}/dist"

if [ -d "${DIST_DIR}" ] ; then
  ${CMD_PREFIX} rm -rf "${DIST_DIR}"
fi
${CMD_PREFIX} mv "${basedir}/dist" "${DIST_DIR}"

exit $?
