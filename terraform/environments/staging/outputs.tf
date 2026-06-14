output "vpc_id" {
  value       = module.network.vpc_id
  description = "ID of the provisioned VPC."
}

output "public_subnet_id" {
  value       = module.network.public_subnet_id
  description = "ID of the public subnet."
}

output "private_subnet_id_a" {
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

output "db_instance_id" {
  value       = module.database.db_instance_id
  description = "ID of the RDS PostgreSQL instance."
}

output "db_instance_endpoint" {
  value       = module.database.db_instance_endpoint
  description = "Connection endpoint of the RDS instance."
}

output "db_instance_address" {
  value       = module.database.db_instance_address
  description = "DNS address of the RDS instance."
}

output "db_instance_port" {
  value       = module.database.db_instance_port
  description = "Database connection port."
}

output "db_security_group_id" {
  value       = module.database.security_group_id
  description = "ID of the RDS database security group."
}

output "cdn_domain_name" {
  value       = module.cdn.distribution_domain_name
  description = "Domain name of the CloudFront distribution."
}

output "cloudfront_domain_name" {
  value       = module.cdn.distribution_domain_name
  description = "Alias domain name of the CloudFront distribution for pipeline compatibility."
}

output "cdn_distribution_id" {
  value       = module.cdn.distribution_id
  description = "ID of the CloudFront distribution."
}

output "cdn_hosted_zone_id" {
  value       = module.cdn.hosted_zone_id
  description = "Route 53 hosted zone ID associated with the CloudFront distribution."
}

output "acm_certificate_arn" {
  value       = module.acm.certificate_arn
  description = "ARN of the ACM SSL certificate attached to CloudFront."
}

output "acm_validation_records" {
  value       = module.acm.domain_validation_options
  description = "DNS domain validation options required for manual CNAME record creation."
}

output "acm_dns_validation" {
  value       = module.acm.domain_validation_options
  description = "Alias for domain validation options to ensure backward compatibility with external automation scripts."
}

output "origin_domain" {
  value       = local.origin_domain
  description = "Target origin hostname for custom external DNS routing directly to the compute resource."
}
