#!/bin/sh                             
DIR=$(dirname $0)          
if [ ! -d "${DIR}/stats" ] ; then
  mkdir -p "${DIR}/stats"
fi           
for log in `ls /var/log/nginx-stats.log.*`
do 
  dname=`stat -f "%Sm" -t "%y-%m" ${log}`
  dname="${DIR}/stats/${dname}.json"
  if [ -e "${dname}" ] ; then continue ; fi
  ${DIR}/stats-scan analyze "${dname}" /var/log/nginx-stats.log*
  if [ "${log}" = "/var/log/nginx-stats.log.0.bz2" ] ; then
    #Update the symlink for the most recent full-month
    ln -sf "${dname}" "${DIR}/stats/lastmonth.json"
  fi
done
