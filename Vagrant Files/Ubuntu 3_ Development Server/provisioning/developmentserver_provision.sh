# Install all needed packages #

echo "############### Installing python3-pip ###############################################"
aptitude install -y python3-pip

# Install Node.js and npm from NodeSource PPA
echo "############### Installing Node.js and npm from NodeSource PPA ###############################################"
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
aptitude install -y nodejs

# Install Apache2 and neccessary mods
echo "############### Installing apache2 and libapache2-mod-wsgi-py3 ###############################################"
aptitude install -y apache2 libapache2-mod-wsgi-py3

