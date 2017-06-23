#!/bin/sh

# Enable commonly used apache modules
sed -i 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' /etc/apache2/httpd.conf
sed -i 's/#LoadModule\ deflate_module/LoadModule\ deflate_module/' /etc/apache2/httpd.conf
sed -i 's/#LoadModule\ expires_module/LoadModule\ expires_module/' /etc/apache2/httpd.conf

sed -i "s#^DocumentRoot \".*#DocumentRoot \"/app\"#g" /etc/apache2/httpd.conf
sed -i "s#/var/www/localhost/htdocs#/app#" /etc/apache2/httpd.conf
printf "\n<Directory \"/app\">\n\tAllowOverride All\n</Directory>\n" >> /etc/apache2/httpd.conf
chown -R apache:apache /app

httpd -D FOREGROUND
