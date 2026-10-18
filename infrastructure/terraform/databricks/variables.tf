
variable "databricks_workspace_name" {
  description = "Name of the Azure Databricks workspace."
  type        = string
}

variable "managed_resource_group_name" {
  description = "Name of the resource group managed by Azure Databricks."
  type        = string

  validation {
    condition     = length(trimspace(var.managed_resource_group_name)) > 0
    error_message = "Managed resource group name must not be empty."
  }
}

variable "environment" {
  description = "Deployment environment."
  type        = string

  validation {
    condition     = contains(["dev", "qa", "prod"], var.environment)
    error_message = "Environment must be one of: dev, qa, or prod."
  }
}

variable "access_connector_name" {
  description = "Name of the Azure Databricks Access Connector."
  type        = string

  validation {
    condition     = length(trimspace(var.access_connector_name)) > 0
    error_message = "Access Connector name must not be empty."
  }
}
