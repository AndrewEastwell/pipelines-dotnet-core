# Powershell commands for Azure infrastructure deployment required by this Sample Webapp

#LOgin 
az login

# List subscriptions (Current one is marked default=true)
az account list -o table

# Select subscription to work in (AE VS Scuscription)
az account set --subscription ef860c61-f714-46bb-a561-546579e396e2

# Create deployment group - needed to run bicep templates
az group create   --name AppSvcDemoGroup   --location "UK SOuth"
  
#list deployment groups
az group list -o table

# ==============================================================================================
# Bicep commands : Run Bicep template For web microservice App Svc plan & related  app service 
#
# Run Bicep template as a deployment within the specified resource group 'AppSvcDemoGroup' - values bound from parameters file specified below:

az deployment group create --template-file $bicepFile  --name TestAppSvcDeploy  --resource-group AppSvcDemoGroup  -TemplateParameterFile $parametersFile
!!!!!!!!!!!!!!!
unrecognized template parameter 'webAppName'. Allowed parameters: 

# setup command line vars
$bicepFile="D:\GIT\AndrewEastwell\pipelines-dotnet-core\pipelines-dotnet-core\Bicep\AzureDeploy.bicep"
$parameters = '{\"webAppName\": {\"value\":\"PipelinesDotnetCore\"}, \"tierName\": {\"value\":\"B1\" }} '
$parametersFile = 'D:\GIT\AndrewEastwell\pipelines-dotnet-core\pipelines-dotnet-core\Bicep\AzureDeploy.parameters.test.json'

# Parameters specified in variable defined above
az deployment group create --template-file $bicepFile  --name TestAppSvcDeploy  --verbose  --resource-group AppSvcDemoGroup  --paramaters $parameters 
# --name : name of this deployment
# 

# Parameters loaded from file 
az deployment group create --template-file $bicepFile  --name TestAppSvcDeploy  --resource-group AppSvcDemoGroup  --parameters @$parametersFile
az deployment group create --template-file $bicepFile  --name TestAppSvcDeploy  --resource-group AppSvcDemoGroup  --parameters @D:\GIT\AndrewEastwell\pipelines-dotnet-core\pipelines-dotnet-core\Bicep\AzureDeploy.parameters.test.min.json

# NB : How is code deployed to the AppService configured by the Bicep ??
# ===========================================================================================================================
# Misc crap down here ..
# ===========================================================================================================================


# Get details of azure powershell commands and entity groups 
az --help

# Get details of azure account group powershell commands and entity groups 
az account --help

# start session output logging to new file
script Session.log 

# start session output logging to append to existing file
script - a Session.log 

# End session logging
exit 

# App Service Plans creation
az appservice plan create -g AppSvcDemoGroup -l uksouth -n AEDemoSvcPlan --sku F1 --number-of-workers 2

# Create AppService for a demo api on the above group and service plan 
az webapp create -p AEDemoSvcPlan -g AppSvcDemoGroup -n AEDemoApi -l
# -l : Local GIT deployment - a local git repo will be created on the service ... see command output fragments below showing api and repository hosts on the service 

