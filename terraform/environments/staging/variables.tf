variable "aws_region" {
  description = "AWS region for staging resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the staging VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the staging public subnet"
  type        = string
  default     = "10.20.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the first staging private subnet"
  type        = string
  default     = "10.20.2.0/28"
}

variable "private_subnet_cidr_b" {
  description = "CIDR block for the second staging private subnet"
  type        = string
  default     = "10.20.2.16/28"
}

variable "public_subnet_az" {
  description = "Availability zone for the staging public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "private_subnet_az" {
  description = "Availability zone for the first staging private subnet"
  type        = string
  default     = "us-east-1b"
}

variable "private_subnet_az_b" {
  description = "Availability zone for the second staging private subnet"
  type        = string
  default     = "us-east-1a"
}

variable "vpc_name" {
  description = "Name of the staging VPC"
  type        = string
  default     = "wdoc-stage-vpc"
}

variable "igw_name" {
  description = "Name of the staging Internet Gateway"
  type        = string
  default     = "wdoc-stage-igw"
}

variable "public_subnet_name" {
  description = "Name of the staging public subnet"
  type        = string
  default     = "wdoc-stage-public-subnet"
}

variable "private_subnet_name" {
  description = "Name of the staging private subnet"
  type        = string
  default     = "wdoc-stage-private-subnet"
}

variable "public_route_table_name" {
  description = "Name of the staging public route table"
  type        = string
  default     = "wdoc-stage-public-rt"
}

variable "instance_type" {
  description = "EC2 instance type for staging"
  type        = string
  default     = "t3.micro"
}

variable "root_volume_size" {
  description = "EC2 root EBS volume size in GB for staging"
  type        = number
  default     = 20
}

variable "allocate_eip" {
  description = "Whether to allocate and associate an Elastic IP for staging EC2"
  type        = bool
  default     = true
}

variable "instance_name" {
  description = "Name of the staging EC2 instance"
  type        = string
  default     = "wdoc-stage-app-server"
}

variable "security_group_name" {
  description = "Name of the staging EC2 security group"
  type        = string
  default     = "ec2-stage-sg"
}

variable "security_group_description" {
  description = "Description of the stage EC2 security group"
  type        = string
  default     = "Allow HTTP, HTTPS, SSH"
}

variable "key_name" {
  description = "SSH key pair name for staging"
  type        = string
}

variable "public_key_path" {
  description = "Path to the staging public key file"
  type        = string
}


variable "ec2_users" {
  description = "Linux users to create on staging EC2"
  type        = list(string)
  default     = ["wdoc_ansible_user"]
}

variable "passwordless_sudo_users" {
  description = "Linux users that should have passwordless sudo access on staging EC2"
  type        = list(string)
  default     = ["wdoc_ansible_user"]
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into staging EC2"
  type        = string
  default     = "0.0.0.0/0"
}

variable "bucket_name" {
  description = "Name of the staging S3 bucket"
  type        = string
  default     = "wdoc-stage-bucket"
}

variable "enable_versioning" {
  description = "Enable versioning for the staging S3 bucket"
  type        = bool
  default     = true
}

variable "iam_role_name" {
  description = "IAM role name for staging EC2 S3 access"
  type        = string
  default     = "wdoc-stage-ec2-s3-role"
}

variable "iam_policy_name" {
  description = "IAM policy name for staging EC2 S3 access"
  type        = string
  default     = "wdoc-stage-ec2-s3-policy"
}

variable "db_name" {
  description = "Name of the staging database"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Master username for the staging database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Master password for the staging database"
  type        = string
  sensitive   = true
}

variable "db_engine_version" {
  description = "PostgreSQL engine version for staging"
  type        = string
  default     = "15.7"
}

variable "db_instance_class" {
  description = "RDS instance class for staging"
  type        = string
  default     = "db.t3.micro"
}

variable "db_storage" {
  description = "Allocated storage in GB for staging RDS"
  type        = number
  default     = 20
}

variable "db_backup_retention_period" {
  description = "Backup retention period for staging RDS"
  type        = number
  default     = 7
}

variable "db_multi_az" {
  description = "Enable Multi-AZ deployment for staging RDS"
  type        = bool
  default     = false
}

variable "db_skip_final_snapshot" {
  description = "Skip final snapshot when destroying staging RDS"
  type        = bool
  default     = false
}

variable "db_publicly_accessible" {
  description = "Whether the staging RDS is publicly accessible"
  type        = bool
  default     = false
}

variable "db_deletion_protection" {
  description = "Enable deletion protection for staging RDS"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Extra tags for staging resources"
  type        = map(string)
  default     = {}
}
