FROM nginx:1.18-alpine

EXPOSE 443

VOLUME [ "/etc/nginx/conf.d/certs" ]

ENV ALLOWED_CERTIFICATE_FINGERPRINT 'all'
ENV PROXY_PASS ''

COPY nginx.conf /nginx.template

CMD ["/bin/sh","-c", "envsubst '${ALLOWED_CERTIFICATE_FINGERPRINT} ${PROXY_PASS}' < /nginx.template > /etc/nginx/conf.d/nginx.conf; nginx-debug -g 'daemon off;'"]