# Setting up my enviroment
echo "############### Copying my profile to ~ ###############################################"
cp /vagrant/configfiles/.profile /home/vagrant
cp /vagrant/configfiles/.profile /root
echo "############### copying my .vimrc to ~ ###############################################"
cp /vagrant/configfiles/.vimrc /home/vagrant
cp /vagrant/configfiles/.vimrc /root

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
echo "############### Installing Anaconda ###############################################"
# Download the installation script (NOTE: update the url to the latest/required version)
curl -s https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -o /tmp/anaconda-install.sh
# Execute the insalltion script in batch mode
bash /tmp/anaconda-install.sh -b -p /home/vagrant/anaconda3
# Remove the unneccesary installtion script
rm /tmp/anaconda-install.sh
# Activate the base enviroment to make the conda command available
eval "$(/home/vagrant/anaconda3/bin/conda shell.bash hook)"
# Initialize the conda environment and modify the .bashrc to make the conda command always available
conda init
# Source the .bashrc to make the changes from 'conda init' take effect
. /root/.bashrc
# Change to user 'vagrant'
sudo -i -u vagrant bash << EOF
eval $(/home/vagrant/anaconda3/bin/conda shell.bash hook)
conda init
# Generate the default config file for jupyterlab in order to modify the settings
jupyter lab --generate-config
EOF
# Make the jupyterlab server respond to clients other than localhost
sed -i "/#c.NotebookApp.ip = 'localhost'/c\c.NotebookApp.ip = '0.0.0.0'" /home/vagrant/.jupyter/jupyter_notebook_config.py
# Don't open a browser on the server (no GUI installed)
sed -i "/#c.NotebookApp.open_browser = True/c\c.NotebookApp.open_browser = False" /home/vagrant/.jupyter/jupyter_notebook_config.py
# install needed conda packages
pip install vpython pycav
