locals {
  environment = "staging"

  origin_domain = "${var.origin_prefix}.${var.site_domain}"

  common_tags = merge(
    var.tags,
    {
      Environment = local.environment
      Project     = "TeamProject225"
    }
  )
}

module "network" {
  source = "../../modules/network"

  aws_region              = var.aws_region
  vpc_cidr                = var.vpc_cidr
  public_subnet_cidr      = var.public_subnet_cidr
  private_subnet_cidr     = var.private_subnet_cidr
  private_subnet_cidr_b   = var.private_subnet_cidr_b
  public_subnet_az        = var.public_subnet_az
  private_subnet_az       = var.private_subnet_az
  private_subnet_az_b     = var.private_subnet_az_b
  vpc_name                = var.vpc_name
  igw_name                = var.igw_name
  public_subnet_name      = var.public_subnet_name
  private_subnet_name     = var.private_subnet_name
  public_route_table_name = var.public_route_table_name
}

module "storage" {
  source = "../../modules/storage"

  bucket_name                    = var.bucket_name
  environment                    = local.environment
  enable_versioning              = var.enable_versioning
  iam_role_name                  = var.iam_role_name
  iam_policy_name                = var.iam_policy_name
  additional_managed_policy_arns = var.additional_managed_policy_arns
  tags                           = local.common_tags
}

module "compute" {
  source = "../../modules/compute"

  aws_region                 = var.aws_region
  instance_type              = var.instance_type
  root_volume_size           = var.root_volume_size
  allocate_eip               = var.allocate_eip
  vpc_id                     = module.network.vpc_id
  subnet_id                  = module.network.public_subnet_id
  key_name                   = var.key_name
  public_key_path            = var.public_key_path
  ec2_users                  = var.ec2_users
  passwordless_sudo_users    = var.passwordless_sudo_users
  iam_instance_profile       = module.storage.iam_instance_profile_name
  allowed_ssh_cidr           = var.allowed_ssh_cidr
  environment                = local.environment
  instance_name              = var.instance_name
  security_group_name        = var.security_group_name
  security_group_description = var.security_group_description
}

module "database" {
  source = "../../modules/database"

  name                    = "wdoc-stage-db"
  engine_version          = var.db_engine_version
  db_family               = var.db_family
  instance_class          = var.db_instance_class
  storage                 = var.db_storage
  postgres_db             = var.postgres_db
  postgres_user           = var.postgres_user
  postgres_password       = var.postgres_password
  subnet_ids              = [module.network.private_subnet_id_a, module.network.private_subnet_id_b]
  vpc_id                  = module.network.vpc_id
  ec2_sg_id               = module.compute.security_group_id
  backup_retention_period = var.db_backup_retention_period
  multi_az                = var.db_multi_az
  skip_final_snapshot     = var.db_skip_final_snapshot
  publicly_accessible     = var.db_publicly_accessible
  deletion_protection     = var.db_deletion_protection
  tags                    = local.common_tags
}

module "acm" {
  source = "../../modules/acm"

  domain_name     = var.site_domain
  route53_zone_id = var.route53_zone_id
  tags            = local.common_tags
}

module "cdn" {
  source = "../../modules/cdn"

  environment           = local.environment
  site_domain           = var.site_domain
  nginx_domain          = local.origin_domain
  s3_bucket_id          = module.storage.bucket_id
  s3_bucket_arn         = module.storage.bucket_arn
  s3_bucket_domain_name = module.storage.bucket_regional_domain_name
  acm_certificate_arn   = module.acm.certificate_arn
  tags                  = local.common_tags

  depends_on = [module.acm]
}

resource "aws_route53_record" "origin" {
  count = var.route53_zone_id != "" ? 1 : 0

  zone_id = var.route53_zone_id
  name    = local.origin_domain
  type    = "A"
  ttl     = 300
  records = [module.compute.public_ip]
}

resource "aws_route53_record" "site_cdn" {
  count = var.route53_zone_id != "" ? 1 : 0

  zone_id = var.route53_zone_id
  name    = var.site_domain
  type    = "A"

  alias {
    name                   = module.cdn.distribution_domain_name
    zone_id                = module.cdn.hosted_zone_id
    evaluate_target_health = false
  }
}
