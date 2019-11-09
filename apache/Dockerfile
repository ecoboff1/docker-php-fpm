# serve apache fast cgi
FROM ubuntu:18.04

MAINTAINER Thomas Prince <me@tprince.pro>

LABEL org.label-schema.vendor="ecoboff1" \
        org.label-schema.description="Custom apache fast cgi connector for alpine-php-fpm" \
        org.label-schema.vcs-url="https://github.com/dockage/alpine-php-fpm"
# Install apache pacakges and clean up
RUN apt update -qy && apt upgrade -qy && apt autoremove -qy \
  && apt-get install -qy apache2 apache2-doc apache2-utils \
    libapache2-mod-fcgid apache2-suexec-pristine imagemagick \
    libruby libapache2-mod-python && apt-get clean && rm -rf /var/lib/apt

# Enable ssl and fast cgi packages and clean up vhosts in apache
RUN a2enmod suexec rewrite ssl actions \
    include cgi dav_fs dav auth_digest headers proxy_fcgi alias \
    && a2dissite 000-default && rm -f /etc/apache2/sites-available/*
# Copy the custom apache launch bash file so it can be run as the ENTRYPOINT
COPY ./launch-apache.sh /usr/bin/local/launch-apache.sh
RUN chmod +x /usr/bin/local/launch-apache.sh

ENTRYPOINT ["/usr/bin/local/launch-apache.sh; /usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80 443
