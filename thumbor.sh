#!/bin/bash

sed -i "s/#SECURITY_KEY = 'MY_SECURE_KEY'/SECURITY_KEY = '$TB_SECURITY_KEY'/g" /etc/thumbor.conf
sed -i "s/#ALLOW_UNSAFE_URL = True/ALLOW_UNSAFE_URL = $TB_ALLOW_UNSAFE_URL/g" /etc/thumbor.conf
sed -i "s/#STORAGE_EXPIRATION_SECONDS = 2592000/STORAGE_EXPIRATION_SECONDS = $TB_STORAGE_EXPIRATION_SECONDS/g" /etc/thumbor.conf
sed -i "s/#FILE_STORAGE_ROOT_PATH = '\/tmp\/thumbor\/storage'/FILE_STORAGE_ROOT_PATH = '\/tmp\/thumbor\/storage'/g" /etc/thumbor.conf

exec thumbor
