#!/bin/sh
DIR=$(dirname $0)
if [ ! -d "${DIR}/stats" ] ; then
  mkdir -p "${DIR}/stats"
fi
#First re-generate the current-month stats file
${DIR}/stats-scan analyze ${DIR}/stats/currentmonth.json /var/log/nginx-stats.log
#And now regenerate the daily/monthly graph files from the cache
${DIR}/stats-scan graph ${DIR}/web/daily.json true ${DIR}/stats/currentmonth.json ${DIR}/stats/lastmonth.json
${DIR}/stats-scan graph ${DIR}/web/monthly.json false ${DIR}/stats/*.json
