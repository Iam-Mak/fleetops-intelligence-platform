locals {
  project     = "fleetops-intelligence"
  application = "data-platform"

  common_tags = {
    project     = local.project
    application = local.application
    environment = var.environment
    managed_by  = "terraform"
  }
}
