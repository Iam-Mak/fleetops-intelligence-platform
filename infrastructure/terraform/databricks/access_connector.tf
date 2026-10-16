
resource "azurerm_databricks_access_connector" "fleetops" {
  name                = "ac-fleetops-dev"
  resource_group_name = data.terraform_remote_state.foundation.outputs.resource_group_name
  location            = data.terraform_remote_state.foundation.outputs.location

  identity {
    type = "SystemAssigned"
  }

  tags = local.common_tags
}

resource "azurerm_role_assignment" "fleetops_storage_access" {
  scope                = data.terraform_remote_state.foundation.outputs.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_databricks_access_connector.fleetops.identity[0].principal_id
  principal_type       = "ServicePrincipal"
}
