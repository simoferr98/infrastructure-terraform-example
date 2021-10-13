#------------------------
#mail
#sqs queue to contain the messages processed by the lambda
#------------------------
module "mail" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "3.1.0"
  create  = true
  name    = local.name_01

  visibility_timeout_seconds = var.mail_visibility_timeout_seconds
  delay_seconds              = var.mail_delay_seconds
  message_retention_seconds  = var.mail_message_retention_seconds
  receive_wait_time_seconds  = var.mail_receive_wait_time_seconds
  max_message_size           = var.mail_max_message_size
  kms_master_key_id          = var.mail_kms_master_key_id
}