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
  description = "The display name for the SNS topic"
}