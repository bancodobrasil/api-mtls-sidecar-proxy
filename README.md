# API mTLS Sidecar

Sidecar Docker containers used to authenticate using mTLS for the Open Banking and PIX API communication as client (request) or as server (webhook)

## Quick Start

To quickly take a look at this running, open your terminal and:

```bash

git clone  https://github.com/bancodobrasil/api-mtls-sidecar-server.git
docker-compose up

```

Open **https://localhost/** on your browser and you will be warned about an insecure certificate. Accept the "risks" and then check that the server returns a `400 Bad Request` to the browser. That's because you have not provided a client cetificate accepted by the server.

If using Firefox, import the client certificate `examples/client-certs/mtls-client.cert.p12` on the Preferences page and reload the page. The browser will now ask you which certificate you want to use. Choose the imported certificate and voilà!

## Building with bundled certificate

In the [example folder](/example) you have some instructions on how to build this sidecar bundling your certificates. Basically, you will create a Dockerfile with the following contents:

```Dockerfile
FROM bancodobrasil/api-mtls-sidecar-server:0.1.0

ENV ALLOWED_SSL_CLIENT_S_DN 'CN=Pinning your Certificate,OU=Lab,O=Alice Ltd,L=Dream,ST=Sandman,C=WL'

COPY path/to/server.pem /etc/nginx/conf.d/certs/server.pem
COPY path/to/server-key.pem /etc/nginx/conf.d/certs/server-key.pem
COPY path/to/clients-ca.pem /etc/nginx/conf.d/certs/clients-ca.pem
```

This way you won't need to map any volume or define environment var. The container will be built specifically for one specific client.

## External References

- https://jamielinux.com/docs/openssl-certificate-authority/create-the-root-pair.html: This guide demonstrates how to act as your own certificate authority (CA) using the OpenSSL command-line tools.
