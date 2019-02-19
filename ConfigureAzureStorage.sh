echo -e "${GREEN}Configure Azure Storage${NOCOLOR}"

echo -e "${GREEN}Please input storage subscription id: ${NOCOLOR}\c"

read STORAGE_SUBSCRIPTION_ID

az account set --subscription ${STORAGE_SUBSCRIPTION_ID}

CheckLastCommandStatus "Failed to set storage subscription id"

echo -e "${GREEN}Please input storage resource group: ${NOCOLOR}\c"

read STORAGE_RESOURCE_GROUP

echo -e "${GREEN}Please input storage account name: ${NOCOLOR}\c"

read STORAGE_ACCOUNT_NAME

STORAGE_ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP --account-name $STORAGE_ACCOUNT_NAME --query [0].value | tr -d '"')

CheckLastCommandStatus "Failed to get storage account key"

hal config storage azs edit \
  --storage-account-name $STORAGE_ACCOUNT_NAME \
  --storage-account-key $STORAGE_ACCOUNT_KEY

CheckLastCommandStatus "Failed to edit the storage settings"

hal config storage edit --type azs

CheckLastCommandStatus "Failed to set the storage source to AZS"
