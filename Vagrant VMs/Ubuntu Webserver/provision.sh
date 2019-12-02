sudo timedatectl set-timezone  Europe/Berlin

# Update all software non-interactivly
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" dist-upgrade

apt-get install -y aptitude
aptitude install -y python3-pip
# Install Apache2 and neccessary mods
aptitude install -y apache2 libapache2-mod-wsgi-py3

cp /vagrant/configfiles/.profile /home/vagrant
cp /vagrant/configfiles/.vimrc /home/vagrant

