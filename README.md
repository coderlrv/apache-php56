# php:5.6-alpine
Apache e PHP 5.6 image baseada no Alpine - 3.8

## Exemplos

Usando Dockerfile:

```
FROM php:5.6-alpine
RUN echo "<?php phpinfo() ?>" > /app/index.php
```

Executar diretamente:

```
docker run -it coderlrv/php:5.6-alpine
```

Usando no docker-compose.yml:

```
version: '3'

services:
	web:
	    image: coderlrv/php:5.6-alpine
	    ports:
	       - 80:80
	       - 443:443
	    volumes:
	      - ./:/app/
```
```
Run: docker-compose up -d
```

