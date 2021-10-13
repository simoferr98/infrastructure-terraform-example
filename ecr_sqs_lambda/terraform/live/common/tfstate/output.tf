output "bucket_tfstate_id" {
  description = "The name of the bucket"
  value       = module.bucket_tfstate.s3_bucket_id
}

output "bucket_tfstate_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname"
  value       = module.bucket_tfstate.s3_bucket_arn
}

output "bucket_tfstate_website_domain" {
  description = "The domain of the website endpoint, if the bucket is configured with a website"
  value       = module.bucket_tfstate.s3_bucket_website_domain
}

output "bucket_tfstate_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name"
  value       = module.bucket_tfstate.s3_bucket_bucket_regional_domain_name
}

output "dynamodb_table_tfstate_dynamodb_table_id" {
  description = "ID of the DynamoDB table"
  value       = module.dynamodb_table_tfstate.dynamodb_table_id
}