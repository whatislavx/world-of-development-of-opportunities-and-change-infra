output "vpc_id" {
	value = module.network.vpc_id
}

output "public_subnet_id" {
	value = module.network.public_subnet_id
}

output "private_subnet_id" {
	value = module.network.private_subnet_id
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
