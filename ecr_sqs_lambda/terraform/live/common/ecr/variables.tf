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
variable "app_name" {
  description = "Name of the registry"
}