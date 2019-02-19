echo -e "${GREEN}Install Halyard${NOCOLOR}"

# curl -O https://raw.githubusercontent.com/spinnaker/halyard/master/install/debian/InstallHalyard.sh

CheckLastCommandStatus "Failed to download halyard"

# sudo bash InstallHalyard.sh

CheckLastCommandStatus "Failed to install halyard after version check"

# . ~/.bashrc
