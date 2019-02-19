az login

CheckLastCommandStatus "Aborted or failed to login to azure"

echo -e "${GREEN}Please input subscription id: ${NOCOLOR}\c"

read SUBSCRIPTION_ID

az account set --subscription ${SUBSCRIPTION_ID}

CheckLastCommandStatus "Failed to set subscription"

echo -e "${GREEN}Please input app id: ${NOCOLOR}\c"

read APP_ID

echo -e "${GREEN}Please input tenant id: ${NOCOLOR}\c"

read TENANT_ID

echo -e "${GREEN}Please input resource group: ${NOCOLOR}\c"

read RESOURCE_GROUP

echo -e "${GREEN}Please input vault name: ${NOCOLOR}\c"

read VAULT_NAME

hal config provider azure enable

CheckLastCommandStatus "Failed to config azure provider"

hal config provider azure account add my-azure-account \
  --client-id $APP_ID \
  --tenant-id $TENANT_ID \
  --subscription-id $SUBSCRIPTION_ID \
  --default-key-vault $VAULT_NAME \
  --default-resource-group $RESOURCE_GROUP \
  --app-key

CheckLastCommandStatus "Failed to add azure provider"
