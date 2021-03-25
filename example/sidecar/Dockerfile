FROM labbsr0x/api-mtls-sidecar-proxy:0.0.2

COPY server-certs/server.pem /etc/nginx/conf.d/certs/server.pem
COPY server-certs/server-key.pem /etc/nginx/conf.d/certs/server-key.pem
COPY server-certs/clients-ca.pem /etc/nginx/conf.d/certs/clients-ca.pem