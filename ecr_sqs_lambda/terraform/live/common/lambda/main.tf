#------------------------
#password_db
#segret of the database password used by the lambda function
#------------------------
resource "aws_ssm_parameter" "password_smtp" {
  name   = "/${local.project_name}-password-smtp"
  type   = "SecureString"
  value  = "changeMe"
  tier   = "Standard"
  key_id = var.password_db_key_id

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}

#------------------------
#policy access_secretmanager_ro and access_sqs_from_send_mail
#policy to allow the lambda function to access the secret and the sqs queue
#------------------------
data "aws_iam_policy_document" "access_secretmanager_ro" {
  statement {
    sid       = "AllowReadingSecretsFromSecretManager"
    actions   = ["ssm:GetParameters"]
    resources = ["arn:aws:ssm:${local.region}:${local.account_id}:parameter/${local.project_name}/*", ]
  }
}

data "aws_iam_policy_document" "access_sqs_from_send_mail" {
  statement {
    sid = "AccessSQSfromlambda"
    actions = [
      "sqs:DeleteMessage",
      "sqs:ReceiveMessage",
      "sqs:GetQueueAttributes"
    ]
    resources = [data.terraform_remote_state.sqs.outputs.sqs_01_arn]
  }
}

#------------------------
#send_mail
#lambda function to send notifications to the user
#------------------------
module "send_mail" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "2.21.0"

  function_name = local.send_mail_function_name
  description   = local.send_mail_function_description

  create_package = false
  image_uri      = "${data.terraform_remote_state.ecr.outputs.app_repository_url}:latest"
  package_type   = "Image"

  cloudwatch_logs_retention_in_days = var.send_mail_log_retention_days
  memory_size                       = var.send_mail_memory_size
  timeout                           = var.send_mail_timeout
  reserved_concurrent_executions    = var.send_mail_reserved_concurrent_executions

  environment_variables = local.send_mail_environment_variables

  role_name        = local.send_mail_function_name
  role_description = local.send_mail_function_description
  role_path        = "/${local.project_name}/"

  attach_network_policy = true
  attach_policy_jsons   = true
  policy_jsons = [
    data.aws_iam_policy_document.access_secretmanager_ro.json,
    data.aws_iam_policy_document.access_sqs_from_send_mail.json
  ]
  number_of_policy_jsons = 2

  event_source_mapping = {
    sqs = {
      event_source_arn = data.terraform_remote_state.sqs.outputs.sqs_01_arn
    }
  }
}