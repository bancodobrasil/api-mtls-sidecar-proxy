# API mTLS Sidecar

Sidecar Docker containers used to authenticate using mTLS for the Open Banking and PIX API communication as client (request) or as server (webhook)

## Running

## Building with bundled certificate

To build this sidecar bundling your certificates, create a Dockerfile with the following contents:

```Dockerfile
FROM bancodobrasil/api-mtls-sidecar-server:0.1.0

COPY pat/to/server.pem /etc/nginx/conf.d/certs/server.pem
COPY pat/to/server-key.pem /etc/nginx/conf.d/certs/server-key.pem
COPY pat/to/ca.pem /etc/nginx/conf.d/certs/ca.pem
```

## External References

- https://jamielinux.com/docs/openssl-certificate-authority/create-the-root-pair.html: This guide demonstrates how to act as your own certificate authority (CA) using the OpenSSL command-line tools.
