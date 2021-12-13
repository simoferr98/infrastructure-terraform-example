output "lambda_01_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = module.lambda_01.lambda_function_arn
}

output "lambda_01_function_invoke_arn" {
  description = "The Invoke ARN of the Lambda Function"
  value       = module.lambda_01.lambda_function_invoke_arn
}

output "lambda_01_function_name" {
  description = "The name of the Lambda Function"
  value       = module.lambda_01.lambda_function_name

}

output "lambda_01_function_qualified_arn" {
  description = "The ARN identifying your Lambda Function Version"
  value       = module.lambda_01.lambda_function_qualified_arn
}

output "lambda_01_role_arn" {
  description = "The ARN of the IAM role created for the Lambda Function"
  value       = module.lambda_01.lambda_role_arn
}

output "lambda_01_role_name" {
  description = "The name of the IAM role created for the Lambda Function"
  value       = module.lambda_01.lambda_role_name
}