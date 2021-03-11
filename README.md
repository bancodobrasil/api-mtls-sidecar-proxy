# API mTLS Sidecar (Server)

Sidecar Docker containers used to authenticate using mTLS for the Open Banking and PIX API communication as client (request) or as server (webhook)

## Quick Start

To quickly take a look at this running, open your terminal and:

```bash

git clone https://github.com/bancodobrasil/api-mtls-sidecar-server.git

```

```bash

docker-compose up

```

Then try `curl` **without** a client certificate to see a Bad Request response:

```bash
curl -k https://localhost
```

Response:

```bash

<html>
<head><title>400 No required SSL certificate was sent</title></head>
<body>
<center><h1>400 Bad Request</h1></center>
<center>No required SSL certificate was sent</center>
<hr><center>nginx/1.18.0</center>
</body>
</html>

```

And then run a `curl` **with** a valid client certificate to see the iana.org proxied through the sidecar mTLS:

```bash
curl --cacert ../server-certs/clients-ca.pem --key mtls-client.key.pem --cert mtls-client.cert.pem -k https://localhost
```

Response:

```bash
<!doctype html>
<html>
<head>
	<title>Internet Assigned Numbers Authority</title>

	<meta charset="utf-8" />
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

...
</body>

</html>

```

### Testing with a Browser (Firefox)

Open **https://localhost/** on your browser and you will be warned about an insecure certificate. Accept the "risks" and then check that the server returns a `400 Bad Request` to the browser. That's because you have not provided a client cetificate accepted by the server.

If using Firefox, import the client certificate `examples/sidecar/client-certs/mtls-client.cert.p12` on the Preferences page and reload the page. The browser will now ask you which certificate you want to use. Choose the imported certificate and voilà!

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
