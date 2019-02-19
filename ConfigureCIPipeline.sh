echo -e "${GREEN}Please input jenkins base url: ${NOCOLOR}\c"

read BASEURL

echo -e "${GREEN}Please input jenkins username: ${NOCOLOR}\c"

read USERNAME

echo -e "${GREEN}Please input jenkins password: ${NOCOLOR}\c"

read PASSWORD

hal config ci jenkins enable

CheckLastCommandStatus "Failed to enable jenkins"

echo $PASSWORD | hal config ci jenkins master add my-jenkins-master \
    --address $BASEURL \
    --username $USERNAME \
    --password

CheckLastCommandStatus "Failed to configure jenkins"

echo -e "${GREEN}Please input packer storage account: ${NOCOLOR}\c"

read PACKER_STORAGE_ACCOUNT

echo -e "${GREEN}Please input packer resource group: ${NOCOLOR}\c"

read PACKER_RESOURCE_GROUP

wget "https://releases.hashicorp.com/packer/1.3.4/packer_1.3.4_linux_amd64.zip"

unzip packer_1.3.4_linux_amd64.zip

sudo cp packer /usr/local/sbin

hal config provider azure account edit my-azure-account --packer-storage-account "${PACKER_STORAGE_ACCOUNT}" --packer-resource-group "${PACKER_RESOURCE_GROUP}"

CheckLastCommandStatus "Failed to add azure provider for packer"

echo "debianRepository: http://nanxudomain.eastus2.cloudapp.azure.com:9999 trusty main" >> ~/dev/spinnaker/rosco/rosco-web/config/rosco.yml
