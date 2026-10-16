resource "azurerm_databricks_workspace" "fleetops" {
  name                = var.databricks_workspace_name
  resource_group_name = data.terraform_remote_state.foundation.outputs.resource_group_name
  location            = data.terraform_remote_state.foundation.outputs.location

  sku = "premium"

  tags = local.common_tags
}