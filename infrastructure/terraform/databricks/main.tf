resource "azurerm_databricks_workspace" "fleetops" {
  name                        = var.databricks_workspace_name
  resource_group_name         = data.terraform_remote_state.foundation.outputs.resource_group_name
  location                    = data.terraform_remote_state.foundation.outputs.location
  managed_resource_group_name = var.managed_resource_group_name

  sku                           = "premium"
  public_network_access_enabled = true

  tags = local.common_tags
}