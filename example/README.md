# Example: Securitying an API Endpoint

To see this example running, do the following:

```bash
docker-compose up
```

```bash
$ curl --cacert sidecar/server-certs/server-ca.pem --key client/certs/mtls-client.key.pem --cert client/certs/mtls-client.cert.pem -k https://localhost

{"data":"I'm secured by an mTLS!"}
```

## Want to see the certificate pinning work?

To see the certificate pinning work:

- execute `docker-compose down` if you are running the service
- modify the value of the `ALLOWED_CERTIFICATE_FINGERPRINT` environment variable on the `docker-compose.yml` file (**for example**: `ALLOWED_CERTIFICATE_FINGERPRINT=f90c85270cb3c7e2133119f4c02f2f36a17984dc`)
- run `docker-compose up` again to bring the service with the new value of `ALLOWED_CERTIFICATE_FINGERPRINT` applied
- execute the same `curl` describe above again
- The result should be:

```bash

<html>
<head><title>403 Forbidden</title></head>
<body>
<center><h1>403 Forbidden</h1></center>
<hr><center>nginx/1.18.0</center>
</body>
</html>

```
