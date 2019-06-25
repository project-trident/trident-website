#!/bin/sh                             
DIR=$(dirname $0)   
STATSDIR="/root/stats-cache"       
if [ ! -d "${STATSDIR}" ] ; then
  mkdir -p "${STATSDIR}"
fi           
for log in `ls /var/log/nginx-stats.log.*`
do 
  dname=`stat -f "%Sm" -t "%y-%m" ${log}`
  dname="${STATSDIR}/${dname}.json"
  if [ -e "${dname}" ] ; then continue ; fi
  ${DIR}/stats-scan analyze "${dname}" /var/log/nginx-stats.log*
  if [ "${log}" = "/var/log/nginx-stats.log.0.bz2" ] ; then
    #Update the symlink for the most recent full-month
    ln -sf "${dname}" "${STATSDIR}/lastmonth.json"
  fi
done
