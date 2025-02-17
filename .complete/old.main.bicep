// Example Parameters:

// @description('ShortName is required for a unique storage account name. Only 5 characters.')
// param shortName string = ''
// param vnetName string = 'vnet-mcjava-priv'
// param vnetAddressPrefixes array = [
//   '192.168.1.0/24'
// ]
// param subnetAzureFirewallName string = 'AzureFirewallSubnet'
// param subnetAzureFirewallPrefix string = '192.168.1.0/26'
// param subnetStorageName string = 'storage'
// param subnetStoragePrefix string = '192.168.1.64/27'
// param subnetWebName string = 'web'
// param subnetWebPrefix string = '192.168.1.96/27'
// param subnetAzureFirewallManagementName string = 'AzureFirewallManagementSubnet'
// param subnetAzureFirewallManagementPrefix string = '192.168.1.128/26'
// param pdnsName string = 'privatelink.blob.core.windows.net'
// param midName string = 'mid-mcjava'
// param midTags object = {
//   application: 'mcjava'
// }

// param workspaceName string = 'oiwmin001'
// param location string = location
// param storageAccountName string = '${shortName}mcjavaservfiles01'
// param blobName string = 'mcjavablob'

// param mngEnvName string = 'mc0101'

// param workloadProfiles array = [
//   {
//     maximumCount: 3
//     minimumCount: 0
//     name: 'CAW01'
//     workloadProfileType: 'D4'
//   }
// ]

// param cappsName string = 'capmcjava01'

// param cappsContainers array = [
//   {
//     image: 'docker.io/itzg/minecraft-server'
//     name: 'minecraft-container'
//     resources: {
//       cpu: '2'
//       memory: '4Gi'
//     }
//     env: [
//       { name: 'EULA', value: 'true' }
//       { name: 'MEMORY', value: '3G' }
//       { name: 'DIFFICULTY', value: 'normal' }
//       { name: 'SERVER_NAME', value: 'Minecraft' }
//       { name: 'OPS', value: 'mattffffff' }
//       { name: 'VIEW_DISTANCE', value: '32' }
//     ]
//   }
// ]

module network 'network.main.bicep' = {
  name: 'network'
}

resource workspace 'Microsoft.OperationalInsights/workspaces@2023-09-01' existing = {}

resource vnet 'Microsoft.Network/virtualNetworks@2024-05-01' existing = {}

resource subnetStorage 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' existing = {}

resource subnetWeb 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' existing = {}

resource pdnssto 'Microsoft.Network/privateDnsZones@2024-06-01' existing = {}

module storageAccount 'br/public:avm/res/storage/storage-account:0.x.x' = {}

module managedEnvironment 'br/public:avm/res/app/managed-environment:0.x.x' = {}

module capps 'br/public:avm/res/app/container-app:0.x.x' = {}

// Container Insights
