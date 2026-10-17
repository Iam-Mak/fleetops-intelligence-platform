resource "databricks_group" "data_engineers" {
  provider     = databricks.account
  display_name = "data-engineers"
}

resource "databricks_group" "data_analysts" {
  provider     = databricks.account
  display_name = "data-analysts"
}
