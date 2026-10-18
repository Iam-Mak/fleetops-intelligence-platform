
resource "azurerm_resource_group" "fleetops" {
  name     = var.resource_group_name
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "data_lake" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.fleetops.name
  location                 = azurerm_resource_group.fleetops.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true

  tags = local.common_tags
}

resource "azurerm_storage_data_lake_gen2_filesystem" "lake" {
  for_each = toset([
    "landing",
    "bronze",
    "silver",
    "gold",
    "managed"
  ])

  name               = each.value
  storage_account_id = azurerm_storage_account.data_lake.id
}