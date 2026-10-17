locals {
  managed_storage_root = "abfss://${data.terraform_remote_state.foundation.outputs.managed_filesystem_name}@${replace(
    trimsuffix(data.terraform_remote_state.foundation.outputs.storage_dfs_endpoint, "/"),
    "https://",
    ""
  )}"
}

resource "databricks_catalog" "fleet_operations" {
  name         = var.fleet_operations_catalog_name
  comment      = "Fleet operations data, including vehicle and trip analytics."
  storage_root = "${local.managed_storage_root}/fleet_operations/"

  depends_on = [
    databricks_external_location.fleetops["managed"]
  ]
}

resource "databricks_catalog" "fleet_maintenance" {
  name         = var.fleet_maintenance_catalog_name
  comment      = "Fleet maintenance data, including maintenance records and vehicle servicing analytics."
  storage_root = "${local.managed_storage_root}/fleet_maintenance/"

  depends_on = [
    databricks_external_location.fleetops["managed"]
  ]
}
