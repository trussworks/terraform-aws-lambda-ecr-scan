output "lambda_arn" {
  description = "ARN for the Lambda function"
  value       = module.ecrscan_lambda.lambda_arn
}
