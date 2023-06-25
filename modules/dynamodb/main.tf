/*resource "aws_dynamodb_table" "dynamodb_table" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"
  stream_enabled = false

  attribute {
    name = "id"
    type = "N"
  }

  dynamic "attribute" {
    for_each = var.columns

    content {
      name = attribute.key
      type = attribute.value
    }
  }

  tags = {
    Name = var.table_name
  }
} */

resource "aws_dynamodb_table" "example" {
  name           = var.table_name
  billing_mode   = "PROVISIONED"
  hash_key       = "id"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "id"
    type = "N"
  }

   attribute {
    name = "EmployeeID"
    type = "N"
  }

  /*dynamic "attribute" {
    for_each = var.columns
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  } */

global_secondary_index {
  name               = "IndexName"
  hash_key           = "EmployeeID"
  projection_type    = "ALL"
  write_capacity     = 5
  read_capacity      = 5
}
}