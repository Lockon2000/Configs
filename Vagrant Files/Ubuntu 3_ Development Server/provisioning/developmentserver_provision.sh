# Install all needed packages #

# Install python utilities
echo "############### Installing python3-pip ###############################################"
aptitude install -y python3-pip
echo "############### Installing python3 global packages ###############################################"
pip3 install pipenv pylint pycodestyle black ipython

# Install Node.js and npm from NodeSource PPA
echo "############### Installing Node.js and npm from NodeSource PPA ###############################################"
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
aptitude install -y nodejs

# Install php
echo "############### Installing php ###############################################"
aptitude install -y php 

# Install Apache2 and neccessary mods
echo "############### Installing apache2, libapache2-mod-wsgi-py3, libapache2-mod-php ###############################################"
aptitude install -y apache2 libapache2-mod-wsgi-py3 libapache2-mod-php

# Install MySQL and php module
echo "############### Installing mysql-server, php-mysql ###############################################"
aptitude install -y mysql-server php-mysql


# Some Configurations #

# Make the websites directory and give the neccesary premisions
mkdir /srv/web
chmod a+rwx /srv/web

# Configure a basic website
mkdir /srv/web/localhost
chown vagrant:vagrant /srv/web/localhost
cat << 'EOF' > /etc/apache/sites-available/localhost.conf
<VirtualHost *:80>
    ServerName localhost

    ServerAdmin webmaster@localhost

    DocumentRoot /srv/web/localhost
    <Directory /srv/web/localhost>
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
a2ensite localhost
a2dissite 000-default.conf
systemctl restart apache2

# Configure the MySQL root user to use password authentication
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'vagrant'; FLUSH PRIVILEGES;"