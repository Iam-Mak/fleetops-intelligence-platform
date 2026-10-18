
resource "databricks_grants" "fleet_operations_catalog" {
  catalog = databricks_catalog.fleet_operations.name

  grant {
    principal  = "data-engineers"
    privileges = ["USE_CATALOG", "CREATE_SCHEMA"]
  }

  grant {
    principal  = "data-analysts"
    privileges = ["USE_CATALOG"]
  }
}

resource "databricks_grants" "fleet_maintenance_catalog" {
  catalog = databricks_catalog.fleet_maintenance.name

  grant {
    principal  = "data-engineers"
    privileges = ["USE_CATALOG", "CREATE_SCHEMA"]
  }

  grant {
    principal  = "data-analysts"
    privileges = ["USE_CATALOG"]
  }
}
