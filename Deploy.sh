echo -e "Deploy spinnaker"

hal deploy apply

CheckLastCommandStatus "Failed to deploy spinnaker"

hal deploy connect

CheckLastCommandStatus "Failed to connect spinnaker ui"
