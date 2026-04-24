locals {
  environment = "staging"
}

module "network" {
  source = "../../modules/network"

  aws_region              = var.aws_region
  vpc_cidr                = var.vpc_cidr
  public_subnet_cidr      = var.public_subnet_cidr
  private_subnet_cidr     = var.private_subnet_cidr
  public_subnet_az        = var.public_subnet_az
  private_subnet_az       = var.private_subnet_az
  vpc_name                = var.vpc_name
  igw_name                = var.igw_name
  public_subnet_name      = var.public_subnet_name
  private_subnet_name     = var.private_subnet_name
  public_route_table_name = var.public_route_table_name
}

module "storage" {
  source = "../../modules/storage"

  bucket_name       = var.bucket_name
  environment       = local.environment
  enable_versioning = var.enable_versioning
  iam_role_name     = var.iam_role_name
  iam_policy_name   = var.iam_policy_name
  tags = merge(
    var.tags,
    {
      Environment = local.environment
      Project     = "TeamProject225"
    }
  )
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
  instance_class          = var.db_instance_class
  storage                 = var.db_storage
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  subnet_ids              = [module.network.private_subnet_id]
  vpc_id                  = module.network.vpc_id
  ec2_sg_id               = module.compute.security_group_id
  backup_retention_period = var.db_backup_retention_period
  multi_az                = var.db_multi_az
  skip_final_snapshot     = var.db_skip_final_snapshot
  publicly_accessible     = var.db_publicly_accessible
  deletion_protection     = var.db_deletion_protection
  tags = merge(
    var.tags,
    {
      Environment = local.environment
      Project     = "TeamProject225"
    }
  )
}
