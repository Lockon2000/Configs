echo "############### Configuring Timezone ###############################################"
timedatectl set-timezone  Europe/Berlin
echo "############### Configuring Hostname ###############################################"
hostnamectl set-hostname Controller

# Update all software non-interactivly
echo "############### Updating the repository indexes ###############################################"
apt-get update
echo "############### Upgrading all packages non-interactivly ###############################################"
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" dist-upgrade

echo "############### Installing aptitude ###############################################"
apt-get install -y aptitude
echo "############### Installing python3-pip ###############################################"
aptitude install -y python3-pip
echo "############### Installing netcat-openbsd tcpdump traceroute mtr ###############################################"
aptitude install -y netcat-openbsd tcpdump traceroute mtr
# Install Ansible
echo "############### Installing software-properties-common ###############################################"
aptitude install -y software-properties-common
echo "############### Adding the ansible repositroy ###############################################"
apt-add-repository --yes --update ppa:ansible/ansible
echo "############### Installing ansible ###############################################"
aptitude install -y ansible

echo "############### Copying my profile to ~ ###############################################"
cp /vagrant/configfiles/.profile /home/vagrant
echo "############### copying my .vimrc to ~ ###############################################"
cp /vagrant/configfiles/.vimrc /home/vagrant

