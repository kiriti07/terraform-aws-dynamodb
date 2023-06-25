module "dynamodb_table" {
  source = "./modules/dynamodb"

  table_name = var.table_name
  columns    = var.columns
}

output "table_arn" {
  description = "ARN of the created DynamoDB table"
  value       = module.dynamodb_table.table_arn
}

output "table_name" {
  description = "Name of the created DynamoDB table"
  value       = module.dynamodb_table.table_name
}