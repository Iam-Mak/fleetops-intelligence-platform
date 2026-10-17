resource "databricks_storage_credential" "fleetops" {
  name = "fleetops_adls_credential"

  azure_managed_identity {
    access_connector_id = data.terraform_remote_state.databricks.outputs.access_connector_id
  }

  comment = "Storage credential for FleetOps ADLS Gen2 access."
}
