#! /bin/bash

if [[ "x$COW_ENV_AUTH_USERNAME" != "x" && "x$COW_ENV_AUTH_PASSWORD" != "x" ]]
then
  COW_ENV_ENABLE_AUTH=""
  COW_ENV_ENABLE_AUTH_FILE="#"
else
  if [[ "x$COW_ENV_AUTH_FILE" != "x" ]]
  then
    COW_ENV_ENABLE_AUTH_FILE=""
    COW_ENV_ENABLE_AUTH="#"
  else
    COW_ENV_ENABLE_AUTH="#"
    COW_ENV_ENABLE_AUTH_FILE="#"
  fi
fi

if [[ "x$SS_ENV_PASSWORD" == "x" ]]
then
  echo "please set SS_ENV_PASSWORD to connect shadowsocks with password"
  exit 1
fi

cp /rc.template /rc.tmp

sed -i "s/{{COW_ENV_HOST}}/$COW_ENV_HOST/g" /rc.tmp
sed -i "s/{{COW_ENV_PORT}}/$COW_ENV_PORT/g" /rc.tmp
sed -i "s/{{COW_ENV_ENABLE_AUTH}}/$COW_ENV_ENABLE_AUTH/g" /rc.tmp
sed -i "s/{{COW_ENV_AUTH_USERNAME}}/$COW_ENV_AUTH_USERNAME/g" /rc.tmp
sed -i "s/{{COW_ENV_AUTH_PASSWORD}}/$COW_ENV_AUTH_PASSWORD/g" /rc.tmp
sed -i "s/{{COW_ENV_ENABLE_AUTH_FILE}}/$COW_ENV_ENABLE_AUTH_FILE/g" /rc.tmp
sed -i "s/{{COW_ENV_AUTH_FILE}}/$COW_ENV_AUTH_FILE/g" /rc.tmp
sed -i "s/{{COW_ENV_AUTH_TIMEOUT}}/$COW_ENV_AUTH_TIMEOUT/g" /rc.tmp
sed -i "s/{{SS_ENV_HOST}}/$SS_ENV_HOST/g" /rc.tmp
sed -i "s/{{SS_ENV_PORT}}/$SS_ENV_PORT/g" /rc.tmp
sed -i "s/{{SS_ENV_PASSWORD}}/$SS_ENV_PASSWORD/g" /rc.tmp

mv /rc.tmp ~/.cow/rc

cow -v --debug
