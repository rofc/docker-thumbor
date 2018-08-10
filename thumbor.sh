#!/bin/sh

CONF='/etc/thumbor.conf'

for i in `env |cut -d '=' -f1`;
  do thumbor-config |egrep -v '^($|#{2,})' |grep '=' |sed s/\#// |egrep ^$i;
    if [ $? -eq 0 ] ; then
      thumbor-config |egrep -v '^($|#{2,})' |grep '=' |sed s/\#// |egrep ^$i |egrep '(True|False)$';
      if [ $? -eq 0 ]; then
        echo "$i = `printenv $i`" >> $CONF;
      else
        echo "$i = '`printenv $i`'" >> $CONF;
      fi;
    fi;
  done

exec thumbor -c /etc/thumbor.conf
