# Setting up user enviroments
echo "############### Copying all config files to ~ for root and vagrant ###############################################"
cp -rT /vagrant_share/provisioning/ubuntu/files/home_files /root
cp -rT /vagrant_share/provisioning/ubuntu/files/home_files /home/vagrant

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

# Install aptitude
echo "############### Installing aptitude ###############################################"
apt-get install -y aptitude

