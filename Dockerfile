FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

USER root

# ENV LANG en_US.UTF-8
# ENV LANGUAGE en_US:en
# ENV LC_ALL en_US.UTF-8
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository universe
RUN apt-get install -y unzip apache2 supervisor libapache2-mod-php php php7.2-cgi php7.2-cli php7.2-pgsql php7.2-pspell php7.2-gd php7.2-gettext php7.2-imap php7.2-intl php7.2-json php7.2-soap php7.2-zip php7.2-curl php7.2-ldap php7.2-xml php7.2-xsl php7.2-mbstring php7.2-bcmath

RUN service apache2 restart

RUN sleep 10

COPY ["*.sh", "/"]
COPY ["*.zip", "/"]
COPY ["./docker/timetrex/", "/var/www/html/timetrex/"]

# RUN unzip TimeTrex_Community_Edition-manual-installer.zip -d /var/www/html/

# RUN mv /var/www/html/TimeTrex_Community_Edition_v14.1.0/ /var/www/html/timetrex

# RUN mv /var/www/html/timetrex/timetrex.ini.php-example_linux /var/www/html/timetrex/timetrex.ini.php

RUN mkdir -p /var/timetrex/storage
RUN mkdir -p /var/log/timetrex
RUN chgrp -R www-data /var/timetrex/
RUN chmod 775 -R /var/timetrex
RUN chgrp www-data -R /var/log/timetrex/
RUN chmod 775 -R /var/log/timetrex
RUN chmod 775 -R /var/log/supervisor
RUN chgrp www-data -R /var/www/html/timetrex/
RUN chmod 775 -R /var/www/html/timetrex/

COPY ["supervisord.conf", "httpd.conf", "maint.conf", "/etc/supervisor/conf.d/"]

EXPOSE 80

USER root

ENTRYPOINT ["./docker-entrypoint.sh"]
