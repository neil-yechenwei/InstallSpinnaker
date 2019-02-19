echo "${GREEN}Choose your environment"

sudo apt install git -y

CheckLastCommandStatus "Failed to install git"

sudo apt install netcat -y

CheckLastCommandStatus "Failed to install netcat"

sudo apt install redis-server -y

CheckLastCommandStatus "Failed to install redis-server"

sudo add-apt-repository ppa:openjdk-r/ppa

CheckLastCommandStatus "Failed to add apt repo for java jdk"

sudo apt-get update

sudo apt-get install openjdk-8-jdk

CheckLastCommandStatus "Failed to install java jdk"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

CheckLastCommandStatus "Failed to download node"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

nvm install v10.15.1

CheckLastCommandStatus "Failed to install nvm"

npm install -g yarn

CheckLastCommandStatus "Failed to install yarn"

echo -e "Please see all related repo from https://www.spinnaker.io/reference/architecture/#spinnaker-microservices and fork them to your git account"
IsContinue

echo -e "${GREEN}Please input your email: ${NOCOLOR}\c"

read EMAIL

ssh-keygen -t rsa -b 4096 -C "${EMAIL}"

CheckLastCommandStatus "Failed to generate ssh key"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa

CheckLastCommandStatus "Failed to add ssh key"

sudo apt-get install xclip

CheckLastCommandStatus "Failed to install xclip"

xclip -sel clip < ~/.ssh/id_rsa.pub

CheckLastCommandStatus "Failed to copy ssh key to memory"

echo -e "The key has been copied in memory, please goto github settings page https://github.com/settings/keys and add a new key with this key."
echo -e "The instruction https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/"
IsContinue

echo -e "${GREEN}Please input your github username: ${NOCOLOR}\c"

read YOUR_GITHUB_USERNAME

hal config deploy edit --type localgit --git-origin-user=${YOUR_GITHUB_USERNAME}

CheckLastCommandStatus "Failed to edit deploy mode"

hal config version edit --version branch:upstream/master

CheckLastCommandStatus "Failed to edit branch version"
