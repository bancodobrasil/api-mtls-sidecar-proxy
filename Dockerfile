FROM nginx:1.18-alpine

EXPOSE 443

VOLUME [ "/etc/nginx/conf.d/certs" ]
ENV ALLOWED_SSL_CLIENT_S_DN 'CN=Client 000000001,OU=Lab,O=Alice Ltd,L=Dream,ST=Sandman,C=WL'

COPY nginx.conf /nginx.template

CMD ["/bin/sh","-c", "envsubst '${ALLOWED_SSL_CLIENT_S_DN} ${PROXY_PASS}' < /nginx.template > /etc/nginx/conf.d/nginx.conf; nginx-debug -g 'daemon off;'"]