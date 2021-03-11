FROM local/api-mtls-sidecar-server

COPY server-certs/server.pem /etc/nginx/conf.d/certs/server.pem
COPY server-certs/server-key.pem /etc/nginx/conf.d/certs/server-key.pem
COPY server-certs/clients-ca.pem /etc/nginx/conf.d/certs/clients-ca.pem