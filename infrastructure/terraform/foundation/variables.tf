variable "resource_group_name" {
  description = "Name of the Azure Resource Group for the platform foundation."
  type        = string

  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0
    error_message = "Resource group name must not be empty."
  }
}

variable "location" {
  description = "Azure region where the foundation resources are deployed."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "Azure location must not be empty."
  }
}

variable "environment" {
  description = "Deployment environment."
  type        = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test, or prod."
  }
}

variable "storage_account_name" {
  description = "Name of the Azure Data Lake Storage Gen2 account."
  type        = string

  validation {
    condition = (
      length(var.storage_account_name) >= 3 &&
      length(var.storage_account_name) <= 24 &&
      can(regex("^[a-z0-9]+$", var.storage_account_name))
    )

    error_message = "Storage account name must be 3-24 characters and contain only lowercase letters and numbers."
  }
}