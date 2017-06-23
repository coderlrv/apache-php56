# apache-php56
Apache and PHP 5.6 image based on Alpine

## Docker image usage

```
docker run [docker-options] cogso/apache-php56
```

## Examples

Typical basic usage:

```
docker run -it cogso/apache-php56
```

Typical usage in Dockerfile:

```
FROM cogso/apache-php56
RUN echo "<?php phpinfo() ?>" > /app/index.php
```

Typical usage:

```
docker run -it --link=somedb:db cogso/apache-php56
```

Typical usage in docker-compose.yml:

```
version: '2'

services:
	web:
	    image: cogso/apache-php56
	    container_name: apache_php56
	    ports:
	       - 80:80
	       - 443:443
	    volumes:    # Volumes (directories) to mount
	      - ${PWD}/app:/app/
	      - ${PWD}/logs:/var/log/apache2/
	    restart: always
	    mem_limit: 128m
```
```
Run: docker-compose up -d
```
