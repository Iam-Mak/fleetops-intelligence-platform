
output "fleet_operations_catalog_name" {
  description = "Name of the FleetOps operations catalog."
  value       = databricks_catalog.fleet_operations.name
}

output "fleet_maintenance_catalog_name" {
  description = "Name of the FleetOps maintenance catalog."
  value       = databricks_catalog.fleet_maintenance.name
}

output "storage_credential_name" {
  description = "Name of the Unity Catalog storage credential."
  value       = databricks_storage_credential.fleetops.name
}

output "workspace_id" {
  description = "Full Azure resource ID of the Databricks workspace."
  value       = data.terraform_remote_state.databricks.outputs.workspace_id
}

output "workspace_url" {
  description = "URL of the Databricks workspace."
  value       = data.terraform_remote_state.databricks.outputs.workspace_url
}
