resource "aws_dynamodb_table" "terraform_locks_staging" {
  name         = "wdoc-terraform-locks-staging"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
