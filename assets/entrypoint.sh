#!/bin/bash

echo "Configuring Develop Environment..."

appName="demo";
dirName="demo";

echo "Configuring Nginx"
cp -r /www/${dirName}/assets/nginx/conf/server/* /usr/local/nginx/conf/server/

/usr/local/nginx/sbin/nginx
/usr/local/php7/sbin/www-fpm start
/etc/init.d/crond start

while true
do
    echo "hello world" > /dev/null
    sleep 6s
done


