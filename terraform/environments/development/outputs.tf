output "vpc_id" {
  value       = module.network.vpc_id
  description = "ID of the provisioned VPC."
}

output "public_subnet_id" {
  value       = module.network.public_subnet_id
  description = "ID of the public subnet."
}

output "private_subnet_id" {
  value       = module.network.private_subnet_id_a
  description = "ID of the first private subnet (Availability Zone A)."
}

output "private_subnet_id_b" {
  value       = module.network.private_subnet_id_b
  description = "ID of the second private subnet (Availability Zone B)."
}

output "instance_id" {
  value       = module.compute.instance_id
  description = "ID of the EC2 application instance."
}

output "instance_public_ip" {
  value       = module.compute.public_ip
  description = "Public IP address of the EC2 instance."
}

output "instance_public_dns" {
  value       = module.compute.public_dns
  description = "Public DNS hostname of the EC2 instance."
}

output "security_group_id" {
  value       = module.compute.security_group_id
  description = "ID of the EC2 application security group."
}

output "bucket_id" {
  value       = module.storage.bucket_id
  description = "Name (ID) of the S3 media bucket."
}

output "bucket_arn" {
  value       = module.storage.bucket_arn
  description = "ARN of the S3 media bucket."
}

output "iam_role_arn" {
  value       = module.storage.iam_role_arn
  description = "ARN of the IAM role assigned to the EC2 instance profile."
}

output "iam_instance_profile_name" {
  value       = module.storage.iam_instance_profile_name
  description = "Name of the IAM instance profile for the EC2 application."
}
