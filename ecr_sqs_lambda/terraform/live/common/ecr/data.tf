data "aws_caller_identity" "current" {}

data "terraform_remote_state" "sqs" {
  backend = "s3"

  config = {
    bucket = "terraform-state-${local.project_name}-${local.environment}"
    key    = "${local.environment}/sqs.tfstate"
    region = local.region
  }
}