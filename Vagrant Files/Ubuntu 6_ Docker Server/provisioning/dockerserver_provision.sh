# Installing all needed packages #

echo "############### Installing python3-pip ###############################################"
aptitude install -y python3-pip

## Installing Docker ##
echo "############### Installing Docker ###############################################"

# Install all required packages
aptitude install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# Set up the stable repository
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# Update the package index and install the latest version of docker and containerd
aptitude update && aptitude install -y docker-ce docker-ce-cli containerd.io
# Add user vagrant to the docker group to be able to use docker as a non-root user
usermod -aG docker vagrant

