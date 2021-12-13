#------------------------
#terraform project variables
#------------------------
variable "project_name" {}
variable "region" {}
variable "environment" {}
variable "owner" {}

#------------------------
#terraform module variables
#------------------------
variable "mail_name" {
  description = "This is the human-readable name of the queue"
}

variable "mail_visibility_timeout_seconds" {
  description = "The visibility timeout for the queue. An integer from 0 to 43200 (12 hours)"
  default     = "30"
}

variable "mail_delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes)"
  default     = "0"
}

variable "mail_message_retention_seconds" {
  description = "The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days)"
  default     = "1209600"
}

variable "mail_receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds)"
  default     = "20"
}

variable "mail_max_message_size" {
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB)"
  default     = "262144"
}

variable "mail_kms_data_key_reuse_period_seconds_value" {
  description = "The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours)"
  default     = "300"
}

variable "mail_kms_master_key_id" {
  description = "he ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK"
  default     = "alias/aws/sqs"
}