# Install Anaconda

echo "############### Installing Anaconda ###############################################"
## Download the installation script (NOTE: update the url to the latest/required version)
curl -s https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -o /tmp/anaconda-install.sh
## Execute the insalltion script in batch mode
bash /tmp/anaconda-install.sh -b -p /home/vagrant/anaconda3
## Remove the unneccesary installtion script
rm /tmp/anaconda-install.sh

# Config Anaconda

echo "############### Config Anaconda for user root ###############################################"
## Activate the base enviroment to make the conda command available
eval "$(/home/vagrant/anaconda3/bin/conda shell.bash hook)"
## Initialize the conda environment and modify the .bashrc to make the conda command always available
conda init
## Source the .bashrc to make the changes from 'conda init' take effect
. /root/.bashrc
## Add needed channels
conda config --append channels conda-forge
conda config --set channel_priority strict

echo "############### Config Anaconda and JupyterLab for user vagrant ###############################################"
## Change to user 'vagrant'
sudo -i -u vagrant bash << EOF
eval $(/home/vagrant/anaconda3/bin/conda shell.bash hook)
conda init
# Generate the default config file for jupyterlab in order to modify the settings
jupyter lab --generate-config
# Make the jupyterlab server respond to clients other than localhost
sed -i "/#c.NotebookApp.ip = 'localhost'/c\c.NotebookApp.ip = '0.0.0.0'" /home/vagrant/.jupyter/jupyter_notebook_config.py
# Don't open a browser on the server (no GUI installed)
sed -i "/#c.NotebookApp.open_browser = True/c\c.NotebookApp.open_browser = False" /home/vagrant/.jupyter/jupyter_notebook_config.py
# # Make the authentication token persistent
# sed -i "/#c.NotebookApp.token = '<generated>'/c\c.NotebookApp.token = '23442db30a2e54e32c95f52691fe2acb57c13822c214a1d6'" /home/vagrant/.jupyter/jupyter_notebook_config.py
# Change the root directory
sed -i "/#c.NotebookApp.notebook_dir = ''/c\c.NotebookApp.notebook_dir = '/home/vagrant/.jupyter/'" /home/vagrant/.jupyter/jupyter_notebook_config.py
EOF

# Install any further needed packages

echo "############### Install all needed software and packages  ###############################################"
## install any needed software
aptitude install -y python3-pip
# ## install needed packages through conda ecosystem
# conda install <packeges>
# ## install needed packages through pypi
# pip install <packeges>

