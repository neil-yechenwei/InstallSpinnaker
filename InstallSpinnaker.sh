#!/bin/bash

current_working_dic=`pwd`
. ${current_working_dic}/Helper.sh
. ${current_working_dic}/InstallDependency.sh
. ${current_working_dic}/InstallHalyard.sh
. ${current_working_dic}/ConfigureCloudProvider.sh
. ${current_working_dic}/ConfigureEnvironment.sh
. ${current_working_dic}/ConfigureAzureStorage.sh
. ${current_working_dic}/Deploy.sh
. ${current_working_dic}/ConfigureCIPipeline.sh
. ${current_working_dic}/Deploy.sh
