# System Configurations #

# Add vagrant to group www-data and the other way around
usermod -a -G www-data vagrant
usermod -a -G vagrant www-data

# Increase the amount of inotify watchers
sed -i '$a\\nfs.inotify.max_user_watches=524288' /etc/sysctl.conf
sysctl -p


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
aptitude install -y software-properties-common
add-apt-repository ppa:ondrej/php
aptitude update
aptitude install -y php

# Install php utilities
echo "############### Installing elementary php extensions ###############################################"
aptitude install -y php-mbstring php-xml php-intl php-zip php-curl

echo "############### Installing composer globally ###############################################"
EXPECTED_CHECKSUM="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"
if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi
php composer-setup.php --quiet --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php

# Install sass
wget -O /tmp/sass.tar.gz https://github.com/sass/dart-sass/releases/download/1.26.9/dart-sass-1.26.9-linux-x64.tar.gz
tar -zxvf /tmp/sass.tar.gz --directory /tmp
mv /tmp/dart-sass/* /usr/local/bin

# Install Apache2 and neccessary mods
echo "############### Installing apache2, libapache2-mod-wsgi-py3, libapache2-mod-php ###############################################"
aptitude install -y apache2 libapache2-mod-wsgi-py3 libapache2-mod-php
sudo a2enmod rewrite
chmod a+rx /var/log/apache2/

# Install MySQL and php module
echo "############### Installing mysql-server, php-mysql ###############################################"
aptitude install -y mysql-server php-mysql


# Additional Configurations #

# Make the websites directory and give the neccesary premisions
echo "############### Make and configure /srv/web ###############################################"
mkdir /srv/web
chmod a+rwx /srv/web

# Configure a basic website
echo "############### Configure the localhost website ###############################################"
mkdir /srv/web/localhost
chown vagrant:vagrant /srv/web/localhost
cat <<'EOF' > /etc/apache2/sites-available/localhost.conf
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
echo "############### Configure MySql root user password ###############################################"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'vagrant'; FLUSH PRIVILEGES;"