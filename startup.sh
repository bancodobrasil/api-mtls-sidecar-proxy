#!/bin/sh

envsubst '${ALLOWED_SSL_CLIENT_S_DN}' < /etc/nginx/conf.d/nginx.conf | tee /etc/nginx/conf.d/nginx.conf
nginx-debug '-g' 'daemon off;'