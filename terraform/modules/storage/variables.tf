variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "development"
}

variable "enable_versioning" {
  description = "Enable versioning on the S3 bucket"
  type        = bool
  default     = true
}

variable "iam_role_name" {
  description = "Name of the IAM role for EC2 S3 access"
  type        = string
  default     = "ec2-s3-role"
}

variable "iam_policy_name" {
  description = "Name of the IAM policy for S3 access"
  type        = string
  default     = "ec2-s3-policy"
}

variable "tags" {
  description = "Additional tags to add to resources"
  type        = map(string)
  default     = {}
}
