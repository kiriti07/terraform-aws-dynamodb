# AWS DynamoDB Table Terraform module

Terraform module to create a DynamoDB table.

## Usage

```hcl
module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name     = "my-table"
  hash_key = "id"

  attributes = [
    {
      name = "id"
      type = "N"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "staging"
  }
}
```

## Notes

**Warning: enabling or disabling autoscaling can cause your table to be recreated**

There are two separate Terraform resources used for the DynamoDB table: one is for when any autoscaling is enabled the other when disabled. If your table is already created and then you change the variable `autoscaling_enabled` then your table will be recreated by Terraform. In this case you will need to move the old `aws_dynamodb_table` resource that is being `destroyed` to the new resource that is being `created`. For example:

```
terraform state mv module.dynamodb_table.aws_dynamodb_table.this module.dynamodb_table.aws_dynamodb_table.autoscaled
```

**Warning: autoscaling with global secondary indexes**

When using an autoscaled provisioned table with GSIs you may find that applying TF changes whilst a GSI is scaled up will reset the capacity, there
is an [open issue for this on the AWS Provider](https://github.com/hashicorp/terraform-provider-aws/issues/671). To get around this issue you can enable
the `ignore_changes_global_secondary_index` setting however, using this setting means that any changes to GSIs will be ignored by Terraform and will
hence have to be applied manually (or via some other automation).

## Module wrappers

Users of this Terraform module can create multiple similar resources by using [`for_each` meta-argument within `module` block](https://www.terraform.io/language/meta-arguments/for_each) which became available in Terraform 0.13.

Users of Terragrunt can achieve similar results by using modules provided in the [wrappers](https://github.com/terraform-aws-modules/terraform-aws-dynamodb-table/tree/master/wrappers) directory, if they prefer to reduce amount of configuration files.
