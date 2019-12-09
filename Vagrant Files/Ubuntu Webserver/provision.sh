echo "############### Configuring Timezone ###############################################"
timedatectl set-timezone  Europe/Berlin
echo "############### Configuring Hostname ###############################################"
hostnamectl set-hostname Webserver

# Update all software non-interactivly
echo "############### Updating the repository indexes ###############################################"
apt-get update
echo "############### Upgrading all packages non-interactivly ###############################################"
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" dist-upgrade

echo "############### Installing aptitude ###############################################"
apt-get install -y aptitude
echo "############### Installing python3-pip ###############################################"
aptitude install -y python3-pip
# Install Apache2 and neccessary mods
echo "############### Installing apache2 libapache2-mod-wsgi-py3 ###############################################"
aptitude install -y apache2 libapache2-mod-wsgi-py3

echo "############### Copying my profile to ~ ###############################################"
cp /vagrant/configfiles/.profile /home/vagrant
echo "############### copying my .vimrc to ~ ###############################################"
cp /vagrant/configfiles/.vimrc /home/vagrant

