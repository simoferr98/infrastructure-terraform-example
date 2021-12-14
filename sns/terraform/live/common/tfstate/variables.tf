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
variable "bucket_tfstate_encryption_configuration" {
  description = "Type of encryption to apply to buckets"
  type        = any
  default = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
}

variable "bucket_tfstate_versioning" {
  description = "Type of encryption to apply to buckets"
  type        = map(string)
  default = {
    enabled = true
  }
}

variable "dynamodb_table_tfstate_read_capacity" {
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  default     = "5"
}

variable "dynamodb_table_tfstate_write_capacity" {
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  default     = "5"
}