locals {
  medallion_schemas = {
    landing = "Incoming source data."
    bronze  = "Raw ingested data."
    silver  = "Cleaned and conformed data."
    gold    = "Curated data for analytics."
  }
}

resource "databricks_schema" "fleet_operations" {
  for_each = local.medallion_schemas

  catalog_name = databricks_catalog.fleet_operations.name
  name         = each.key
  comment      = each.value
}

resource "databricks_schema" "fleet_maintenance" {
  for_each = local.medallion_schemas

  catalog_name = databricks_catalog.fleet_maintenance.name
  name         = each.key
  comment      = each.value
}