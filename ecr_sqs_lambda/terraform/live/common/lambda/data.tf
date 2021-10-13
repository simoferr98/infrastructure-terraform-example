data "aws_caller_identity" "current" {}

data "terraform_remote_state" "sqs" {
  backend = "s3"

  config = {
    bucket = "terraform-state-${local.project_name}"
    key    = "${local.environment}/sqs.tfstate"
    region = local.region
  }
}

data "terraform_remote_state" "ecr" {
  backend = "s3"

  config = {
    bucket = "terraform-state-${local.project_name}"
    key    = "${local.environment}/ecr.tfstate"
    region = local.region
  }
}