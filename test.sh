#!/bin/sh

#Now start up the internal test server on port 1313
origdir=${PWD}
cd hugo-site
hugo serve --disableFastRender
cd "${origdir}"
