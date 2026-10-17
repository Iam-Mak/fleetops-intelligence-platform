
resource "databricks_grants" "fleet_operations_catalog" {
  catalog = databricks_catalog.fleet_operations.name

  grant {
    principal  = databricks_group.data_engineers.display_name
    privileges = ["USE_CATALOG", "CREATE_SCHEMA"]
  }

  grant {
    principal  = databricks_group.data_analysts.display_name
    privileges = ["USE_CATALOG"]
  }
}

resource "databricks_grants" "fleet_maintenance_catalog" {
  catalog = databricks_catalog.fleet_maintenance.name

  grant {
    principal  = databricks_group.data_engineers.display_name
    privileges = ["USE_CATALOG", "CREATE_SCHEMA"]
  }

  grant {
    principal  = databricks_group.data_analysts.display_name
    privileges = ["USE_CATALOG"]
  }
}
