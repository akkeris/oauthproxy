#!/bin/bash

ENVVARS=`env | grep OAUTHPROXY_`
for var in $ENVVARS; do
   key1=`echo $var | sed -e 's/OAUTHPROXY_/-/g'|cut -d '=' -f 1`
   key2=`echo $key1 | tr '[:upper:]' '[:lower:]'`
   key3=`echo $key2 | sed -e 's/_/-/g'`
   var2=`echo $var | awk -F"=" -v key4=$key3 '{st = index($0,"="); print key4"="substr($0,st+1)}'`
   full="$full $var2"
done

/go/bin/oauth2_proxy $full
