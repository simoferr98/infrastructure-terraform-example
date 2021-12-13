output "mail_name" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.mail.sqs_queue_name
}

output "mail_arn" {
  description = "The ARN of the SQS queue"
  value       = module.mail.sqs_queue_arn
}

output "mail_id" {
  description = "The name of the SQS queue"
  value       = module.mail.sqs_queue_id
}