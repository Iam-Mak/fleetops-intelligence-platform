
variable "fleet_operations_catalog_name" {
  description = "Name of the FleetOps operations catalog."
  type        = string
  default     = "fleet_operations"
}

variable "fleet_maintenance_catalog_name" {
  description = "Name of the FleetOps maintenance catalog."
  type        = string
  default     = "fleet_maintenance"
}

variable "databricks_account_id" {
  description = "Databricks account ID for account-level resources."
  type        = string
}
