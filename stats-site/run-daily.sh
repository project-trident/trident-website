#!/bin/sh
DIR=$(dirname $0)
STATSDIR="/root/stats-cache"     
if [ ! -d "${STATSDIR}" ] ; then
  mkdir -p "${STATSDIR}"
fi  
#First re-generate the current-month stats file
${DIR}/stats-scan analyze ${STATSDIR}/currentmonth.json /var/log/nginx-stats.log
#And now regenerate the daily/monthly graph files from the cache
${DIR}/stats-scan graph ${DIR}/web/daily.json true ${STATSDIR}/currentmonth.json ${STATSDIR}/lastmonth.json
${DIR}/stats-scan graph ${DIR}/web/monthly.json false ${STATSDIR}/*.json
