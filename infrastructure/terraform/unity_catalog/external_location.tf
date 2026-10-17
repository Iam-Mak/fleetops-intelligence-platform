locals {
  storage_filesystems = toset([
    "landing",
    "bronze",
    "silver",
    "gold",
    "managed"
  ])
}

resource "databricks_external_location" "fleetops" {
  for_each = local.storage_filesystems

  name = "fleetops_${each.key}"

  url = "abfss://${each.key}@${replace(
    trimsuffix(data.terraform_remote_state.foundation.outputs.storage_dfs_endpoint, "/"),
    "https://",
    ""
  )}/"

  credential_name = databricks_storage_credential.fleetops.name

  comment = "FleetOps ${each.key} storage location."
}