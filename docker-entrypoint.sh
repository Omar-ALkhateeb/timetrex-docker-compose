#!/bin/bash

sleep 10;

echo "Connect to http://localhost:8080/timetrex/interface/install/install.php to finish the installtion."

# mv /var/www/html/timetrex/timetrex.ini.php-example_linux /var/www/html/timetrex/timetrex.ini.php

chmod 777 -R /var/www/html/timetrex/


exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf 1>/dev/null
