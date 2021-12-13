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

#------------------------
#local module sqs
#------------------------
locals {
  name_01 = join("-", [local.environment, local.project_name, var.mail_name])
}