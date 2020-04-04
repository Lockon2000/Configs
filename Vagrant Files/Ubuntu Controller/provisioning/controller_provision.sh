# Install all neded packages
echo "############### Installing python3-pip ###############################################"
aptitude install -y python3-pip
echo "############### Installing netcat-openbsd tcpdump traceroute mtr ###############################################"
aptitude install -y netcat-openbsd tcpdump traceroute mtr
# Install Ansible
# We are using pip3 to install ansible to configure ansible with python3
echo "############### Installing ansible via pip3 ###############################################"
pip3 install ansible
echo "############### Installing sshpass ###############################################"
aptitude install -y sshpass

