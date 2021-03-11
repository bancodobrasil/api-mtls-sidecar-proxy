FROM local/api-mtls-sidecar-server

ENV ALLOWED_SSL_CLIENT_S_DN 'CN=mTLS Teste Client000000001,OU=Lab,O=Alice Ltd,L=Dream,ST=Sandman,C=WL'

COPY server-certs/server.pem /etc/nginx/conf.d/certs/server.pem
COPY server-certs/server-key.pem /etc/nginx/conf.d/certs/server-key.pem
COPY server-certs/clients-ca.pem /etc/nginx/conf.d/certs/clients-ca.pem