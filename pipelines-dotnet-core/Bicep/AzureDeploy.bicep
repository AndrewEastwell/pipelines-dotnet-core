@maxLength(40)
@description('Name of the resource')
param webAppName string

@description('Location for all resources.')
param location string = resourceGroup().location

@description('Select tier name, options available include F1, B1, B2, B3, S1, S2, S3, {P1, P2, P3}')
param tierName string

// Create the appService Plan 
var appServicePlanName_var = 'AppServicePlan-${webAppName}'

resource appServicePlanName 'Microsoft.Web/serverfarms@2020-06-01' = {
  kind: 'app'
  name: appServicePlanName_var
  location: location
  tags: {
    displayName: 'AppServicePlan'
  }
  sku: {
    name: tierName
  }
  properties: {}
}
