#------------------------
#local project
#------------------------
locals {
  project_name = var.project_name
  region       = var.region
  environment  = var.environment
  owner        = var.owner

  common_tags = {
    Terraform   = true
    Environment = local.environment
    Owner       = local.owner
    Project     = local.project_name
  }
}