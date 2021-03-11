FROM nginx:1.18-alpine

EXPOSE 443

VOLUME [ "/etc/nginx/conf.d/certs" ]
ENV ALLOWED_SSL_CLIENT_S_DN 'CN=Client 000000001,OU=Lab,O=Alice Ltd,L=Dream,ST=Sandman,C=WL'

COPY nginx.conf /etc/nginx/conf.d/

COPY startup.sh /startup.sh

CMD [ "/startup.sh" ]