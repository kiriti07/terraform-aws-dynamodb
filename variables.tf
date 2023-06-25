/*variable "table_name" {
  description = "The name of the DynamoDB table."
  type        = string
}

variable "columns" {
  description = "A map of column names and their data types."
  type        = map
  default     = {}
}
*/

variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "columns" {
  description = "List of columns to create in the DynamoDB table"
  type        = list(object({
    name = string
    type = string
  }))
}