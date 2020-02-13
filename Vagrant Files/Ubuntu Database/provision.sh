# Setting up my enviroment
echo "############### Copying my profile to ~ ###############################################"
cp /vagrant/configfiles/.profile /home/vagrant
echo "############### copying my .vimrc to ~ ###############################################"
cp /vagrant/configfiles/.vimrc /home/vagrant

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
# Install postgresql
echo "############### Installing postgresql ###############################################"
aptitude install -y postgresql

