terraform {
  required_version = "~> 1.0"

  backend "s3" {
    bucket         = "terraform-state-ecs-sqs-lambda-example"
    key            = "dev/lambda.tfstate"
    dynamodb_table = "terraform-state-locks-ecs-sqs-lambda-example"
    region         = "eu-central-1"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.62.0"
    }
  }
}

provider "aws" {
  region = local.region
  default_tags {
    tags = local.common_tags
  }
}