terraform {
  backend "s3" {
    bucket  = "wdoc-tfstate-stage-668751951204"
    key     = "stage/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
