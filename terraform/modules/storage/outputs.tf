output "bucket_id" {
  value       = aws_s3_bucket.this.id
  description = "The name of the S3 bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "The ARN of the S3 bucket"
}

output "bucket_versioning_enabled" {
  value = var.enable_versioning ? one(aws_s3_bucket_versioning.this[*].versioning_configuration[0].status) : "Disabled"
}

output "iam_role_arn" {
  value       = aws_iam_role.ec2_s3_role.arn
  description = "The ARN of the IAM role for EC2 S3 access"
}

output "iam_role_name" {
  value       = aws_iam_role.ec2_s3_role.name
  description = "The name of the IAM role for EC2 S3 access"
}

output "iam_instance_profile_name" {
  value       = aws_iam_instance_profile.ec2_profile.name
  description = "The name of the EC2 instance profile for S3 access"
}

output "bucket_region" {
  value       = aws_s3_bucket.this.region
  description = "The region of the S3 bucket"
}
