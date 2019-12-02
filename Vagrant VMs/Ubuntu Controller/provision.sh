sudo timedatectl set-timezone  Europe/Berlin

# Update all software non-interactivly
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" dist-upgrade

apt-get install -y aptitude
aptitude install -y python3-pip
aptitude install -y netcat-openbsd tcpdump traceroute mtr
# Install Ansible
aptitude install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
aptitude install -y ansible

cp /vagrant/configfiles/.profile /home/vagrant
cp /vagrant/configfiles/.vimrc /home/vagrant

