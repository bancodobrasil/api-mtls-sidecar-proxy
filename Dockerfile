FROM nginx:1.18-alpine

EXPOSE 443

VOLUME [ "/etc/nginx/conf.d/certs" ]
ENV ALLOWED_SSL_CLIENT_S_DN 'CN=demo.local,O=Local Demo Inc,L=Local,ST=Loc,C=BR'

COPY nginx.conf /etc/nginx/conf.d/

COPY startup.sh /startup.sh

CMD [ "/startup.sh" ]