terraform {
  backend "s3" {
    bucket         = "wdoc-tfstate-dev-668751951204"
    key            = "development/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "wdoc-terraform-locks-development"
  }
}

