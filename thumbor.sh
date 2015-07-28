#!/bin/bash

sed -i "s/#SECURITY_KEY = 'MY_SECURE_KEY'/SECURITY_KEY = '$SECURITY_KEY'/g" /etc/thumbor.conf
sed -i "s/#ALLOW_UNSAFE_URL = True/ALLOW_UNSAFE_URL = $ALLOW_UNSAFE_URL/g" /etc/thumbor.conf

exec thumbor
