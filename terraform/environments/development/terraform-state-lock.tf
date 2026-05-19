resource "aws_dynamodb_table" "terraform_locks_development" {
  name         = "wdoc-terraform-locks-development"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
