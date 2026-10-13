output "resource_group_name" {
  description = "Name of the Azure Resource Group."
  value       = azurerm_resource_group.commercial_vehicle.name
}

output "resource_group_id" {
  description = "Resource ID of the Azure Resource Group."
  value       = azurerm_resource_group.commercial_vehicle.id
}

output "storage_account_name" {
  description = "Name of the ADLS Gen2 storage account."
  value       = azurerm_storage_account.data_lake.name
}

output "storage_account_id" {
  description = "Resource ID of the ADLS Gen2 storage account."
  value       = azurerm_storage_account.data_lake.id
}

output "storage_dfs_endpoint" {
  description = "Primary DFS endpoint of the ADLS Gen2 storage account."
  value       = azurerm_storage_account.data_lake.primary_dfs_endpoint
}

output "landing_filesystem_name" {
  description = "Name of the ADLS Gen2 landing filesystem."
  value       = azurerm_storage_data_lake_gen2_filesystem.landing.name
}

output "bronze_filesystem_name" {
  description = "Name of the ADLS Gen2 bronze filesystem."
  value       = azurerm_storage_data_lake_gen2_filesystem.bronze.name
}

output "silver_filesystem_name" {
  description = "Name of the ADLS Gen2 silver filesystem."
  value       = azurerm_storage_data_lake_gen2_filesystem.silver.name
}

output "gold_filesystem_name" {
  description = "Name of the ADLS Gen2 gold filesystem."
  value       = azurerm_storage_data_lake_gen2_filesystem.gold.name
}

output "location" {
  description = "Azure region where the foundation resources are deployed."
  value       = azurerm_resource_group.commercial_vehicle.location
}

output "managed_filesystem_name" {
  description = "Name of the ADLS Gen2 managed filesystem for Unity Catalog."
  value       = azurerm_storage_data_lake_gen2_filesystem.managed.name
}