output "workspace_id" {
  description = "Resource ID of the FleetOps Databricks workspace."
  value       = azurerm_databricks_workspace.fleetops.id
}

output "workspace_url" {
  description = "URL of the FleetOps Databricks workspace."
  value       = azurerm_databricks_workspace.fleetops.workspace_url
}