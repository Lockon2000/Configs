sudo timedatectl set-timezone  Europe/Berlin
apt-get update && apt-get upgrade -y
apt-get install -y aptitude
aptitude install -y netcat-openbsd tcpdump traceroute mtr
cp /vagrant/configfiles/.profile /home/vagrant
cp /vagrant/configfiles/.vimrc /home/vagrant