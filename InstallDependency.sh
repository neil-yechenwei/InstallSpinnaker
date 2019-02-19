echo -e "${GREEN}Install curl${NOCOLOR}"

sudo apt install curl -y

echo -e "${GREEN}Install azure cli${NOCOLOR}"

sudo apt-get install apt-transport-https lsb-release software-properties-common dirmngr -y

CheckLastCommandStatus "Failed to install prerequisite packages"

AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    sudo tee /etc/apt/sources.list.d/azure-cli.list

CheckLastCommandStatus "Failed to modify your sources list"

sudo apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv \
     --keyserver packages.microsoft.com \
     --recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF

CheckLastCommandStatus "Failed to get the Microsoft signing key"

sudo apt-get update

sudo apt-get install azure-cli

CheckLastCommandStatus "Failed to install azure cli"

echo -e "${GREEN}Choose cloud provider${NOCOLOR}"
