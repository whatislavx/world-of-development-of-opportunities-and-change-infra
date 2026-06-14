output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "private_subnet_id_a" {
  value = module.network.private_subnet_id_a
}

output "private_subnet_id_b" {
  value = module.network.private_subnet_id_b
}

output "instance_id" {
  value = module.compute.instance_id
}

output "instance_public_ip" {
  value = module.compute.public_ip
}

output "instance_public_dns" {
  value = module.compute.public_dns
}

output "security_group_id" {
  value = module.compute.security_group_id
}

output "bucket_id" {
  value = module.storage.bucket_id
}

output "bucket_arn" {
  value = module.storage.bucket_arn
}

output "iam_role_arn" {
  value = module.storage.iam_role_arn
}

output "iam_instance_profile_name" {
  value = module.storage.iam_instance_profile_name
}

output "db_instance_id" {
  value = module.database.db_instance_id
}

output "db_instance_endpoint" {
  value = module.database.db_instance_endpoint
}

output "db_instance_address" {
  value = module.database.db_instance_address
}

output "db_instance_port" {
  value = module.database.db_instance_port
}

output "db_security_group_id" {
  value = module.database.security_group_id
}

output "cdn_domain_name" {
  value       = module.cdn.distribution_domain_name
  description = "CDN distribution domain (*.cloudfront.net)"
}

output "cdn_distribution_id" {
  value       = module.cdn.distribution_id
  description = "CDN distribution ID"
}

output "cdn_hosted_zone_id" {
  value       = module.cdn.hosted_zone_id
  description = "Route53 hosted zone ID for CDN alias records"
}

output "acm_certificate_arn" {
  value       = module.acm.certificate_arn
  description = "ACM certificate ARN attached to the CDN"
}

output "acm_validation_records" {
  value       = module.acm.domain_validation_options
  description = "DNS records for ACM validation when route53_zone_id is not set"
}

output "origin_domain" {
  value       = local.origin_domain
  description = "CDN origin hostname (A record must point to EC2)"
}
