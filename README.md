# Docker Container for TimeTrex Workforce Management

## acknowledgements

this repo is heavily influenced by https://github.com/apnar/docker-image-timetrex

This is a Docker image for running the TimeTrex open source
time tracking and payroll system. It contains apache, php,
postgres database, and TimeTrex Community Edition.

More details at https://www.timetrex.com/community-edition

Run quickly:
download timetrx (v 14.1.0 used here) ans extract it's files into ./docker/timetrex

```
 docker-compose up -d
```

Mounts get bound to these directories and presistant data like this:

- ./docker/database:/var/lib/postgresql/data:rw
- ./docker/timetrex:/var/www/html/timetrex:rw
- ./docker-entrypoint.sh:/docker-entrypoint.sh:rw

On first run it'll rebuild the image as well as initialize the postgres database.

Then finish install at: http://localhost:8080/timetrex/interface/install/install.php
