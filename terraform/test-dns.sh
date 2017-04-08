#!/bin/sh

DNS_MASTER=`cat terraform.log | grep elastic_ip_of_dns-master | awk -F= '{print $2}'`
nslookup www.centossrv.com $DNS_MASTER >> /dev/null
if [ $? -eq 0 ]; then
  RES="pass"
else
  RES="false"
fi
echo "<<RESULT>>"
echo "www.centossrv.com,$RES"
