output "table_arn" {
  description = "ARN of the created DynamoDB table"
  value       = aws_dynamodb_table.example.arn
}

output "table_name" {
  description = "Name of the created DynamoDB table"
  value       = aws_dynamodb_table.example.name
}
