# Setting up my enviroment
echo "############### Copying all config files to ~ ###############################################"
cp -rT /vagrant/configfiles /home/vagrant

# Configuring system parameters
echo "############### Configuring Timezone ###############################################"
timedatectl set-timezone  Europe/Berlin

# Configuring ssh service
echo "############### Configuring PasswordAuthentication for ssh ###############################################"
sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
systemctl restart sshd

# Update all packages non-interactivly
echo "############### Updating the repository indexes ###############################################"
apt-get update
echo "############### Upgrading all packages non-interactivly ###############################################"
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" dist-upgrade

# Install all neded packages
echo "############### Installing aptitude ###############################################"
apt-get install -y aptitude
echo "############### Installing python3-pip ###############################################"
aptitude install -y python3-pip
# Install Apache2 and neccessary mods
echo "############### Installing apache2 and libapache2-mod-wsgi-py3 ###############################################"
aptitude install -y apache2 libapache2-mod-wsgi-py3
# Install Node.js and npm from NodeSource PPA
echo "############### Installing Node.js and npm from NodeSource PPA ###############################################"
cd /tmp
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
bash nodesource_setup.sh
aptitude install -y nodejs

