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
variable "password_db_key_id" {
  description = "The KMS key id or arn for encrypting a SecureString"
  default     = "alias/aws/ssm"
}

variable "send_mail_name_suffix" {
  description = "Lambda sevice specific name"
}

variable "send_mail_log_retention_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, and 3653."
  default     = "5"
}

variable "send_mail_memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. Valid value between 128 MB to 10,240 MB (10 GB), in 64 MB increments."
  default     = "128"
}

variable "send_mail_timeout" {
  description = "The amount of time your Lambda Function has to run in seconds."
  default     = "20"
}

variable "send_mail_reserved_concurrent_executions" {
  description = "The amount of reserved concurrent executions for this Lambda Function. A value of 0 disables Lambda Function from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1."
  default     = "1"
}