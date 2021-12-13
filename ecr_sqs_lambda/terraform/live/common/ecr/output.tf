output "app_repository_url" {
  description = "The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)"
  value       = aws_ecr_repository.app.repository_url
}

output "app_repository_id" {
  description = "The registry ID where the repository was created"
  value       = aws_ecr_repository.app.id
}