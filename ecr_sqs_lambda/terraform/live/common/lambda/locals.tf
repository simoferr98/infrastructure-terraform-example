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
#local module lambda
#------------------------
locals {
  account_id = data.aws_caller_identity.current.account_id
}

locals {
  send_mail_function_name        = join("-", [local.environment, local.project_name, var.send_mail_name_suffix])
  send_mail_function_description = "Progetto ${local.project_name}, Description ${var.send_mail_name_suffix}"
  send_mail_environment_variables = {
    REGION                           = local.region
    NOME_PARAMETRO_PASSWORD_MONGO_DB = aws_ssm_parameter.password_smtp.name
  }
}