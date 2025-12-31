# Outputs for AWS Secrets Rotation

output "secret_arn" {
  description = "ARN of the RDS credentials secret"
  value       = aws_secretsmanager_secret.rds_credentials.arn
}

output "secret_name" {
  description = "Name of the secret in Secrets Manager"
  value       = aws_secretsmanager_secret.rds_credentials.name
}

output "rotation_lambda_arn" {
  description = "ARN of the rotation Lambda function"
  value       = aws_serverlessapplicationrepository_cloudformation_stack.rotation.outputs["RotationLambdaARN"]
}

output "rds_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = aws_db_instance.main.endpoint
}

output "kms_key_arn" {
  description = "ARN of the KMS key used for secret encryption"
  value       = aws_kms_key.secrets.arn
}

output "next_rotation_date" {
  description = "Instructions to check next rotation"
  value       = "Run: aws secretsmanager describe-secret --secret-id ${aws_secretsmanager_secret.rds_credentials.name} --query 'NextRotationDate'"
}

output "retrieve_secret_command" {
  description = "AWS CLI command to retrieve the current secret value"
  value       = "aws secretsmanager get-secret-value --secret-id ${aws_secretsmanager_secret.rds_credentials.name} --query 'SecretString' --output text | jq ."
}
