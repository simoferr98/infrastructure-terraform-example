output "mail_name" {
  description = "The name of the SNS"
  value       = module.mail.sns_topic_name
}

output "mail_arn" {
  description = "The ARN of the SNS"
  value       = module.mail.sns_topic_arn
}

output "mail_id" {
  description = "The ID of the SNS"
  value       = module.mail.sns_topic_id
}

output "mail_owner" {
  description = "The OWNER of the SNS"
  value       = module.mail.sns_topic_owner
}