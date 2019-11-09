#!/usr/bin/env bash

cd /etc/apache2/sites-available
ls /etc/apache2/sites-available
a2ensite *
service apache2 restart