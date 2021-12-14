#------------------------
#bucket_tfstate
#stores the state as a given key in a given bucket on Amazon S3
#it is highly recommended that you enable Bucket Versioning on the S3 bucket to allow for state recovery in the case of accidental deletions and human error
#------------------------
module "bucket_tfstate" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.9.0"

  server_side_encryption_configuration = var.bucket_tfstate_encryption_configuration
  bucket                               = "terraform-state-${local.project_name}"
  versioning                           = var.bucket_tfstate_versioning
  block_public_acls                    = true
  block_public_policy                  = true
  ignore_public_acls                   = true
  restrict_public_buckets              = true

}

#------------------------
#dynamodb_table_tfstate
#this backend also supports state locking and consistency checking via Dynamo DB, which can be enabled by setting the dynamodb_table field to an existing DynamoDB table name
#------------------------
module "dynamodb_table_tfstate" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "1.1.0"

  name           = "terraform-state-locks-${local.project_name}"
  hash_key       = "LockID"
  read_capacity  = var.dynamodb_table_tfstate_read_capacity
  write_capacity = var.dynamodb_table_tfstate_write_capacity

  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]
}