variable "aws_region" {
  description = "AWS region for stage resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the stage VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the stage public subnet"
  type        = string
  default     = "10.20.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the stage private subnet"
  type        = string
  default     = "10.20.2.0/24"
}

variable "public_subnet_az" {
  description = "Availability zone for the stage public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "private_subnet_az" {
  description = "Availability zone for the stage private subnet"
  type        = string
  default     = "us-east-1b"
}

variable "vpc_name" {
  description = "Name of the stage VPC"
  type        = string
  default     = "wdoc-stage-vpc"
}

variable "igw_name" {
  description = "Name of the stage Internet Gateway"
  type        = string
  default     = "wdoc-stage-igw"
}

variable "public_subnet_name" {
  description = "Name of the stage public subnet"
  type        = string
  default     = "wdoc-stage-public-subnet"
}

variable "private_subnet_name" {
  description = "Name of the stage private subnet"
  type        = string
  default     = "wdoc-stage-private-subnet"
}

variable "public_route_table_name" {
  description = "Name of the stage public route table"
  type        = string
  default     = "wdoc-stage-public-rt"
}

variable "instance_type" {
  description = "EC2 instance type for stage"
  type        = string
  default     = "t3.micro"
}

variable "root_volume_size" {
  description = "EC2 root EBS volume size in GB for stage"
  type        = number
  default     = 20
}

variable "allocate_eip" {
  description = "Whether to allocate and associate an Elastic IP for stage EC2"
  type        = bool
  default     = true
}

variable "instance_name" {
  description = "Name of the stage EC2 instance"
  type        = string
  default     = "wdoc-stage-app-server"
}

variable "security_group_name" {
  description = "Name of the stage EC2 security group"
  type        = string
  default     = "ec2-stage-sg"
}

variable "security_group_description" {
  description = "Description of the stage EC2 security group"
  type        = string
  default     = "Allow HTTP, HTTPS, SSH"
}

variable "key_name" {
  description = "SSH key pair name for stage"
  type        = string
}

variable "public_key_path" {
  description = "Path to the stage public key file"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into stage EC2"
  type        = string
  default     = "0.0.0.0/0"
}

variable "bucket_name" {
  description = "Name of the stage S3 bucket"
  type        = string
  default     = "wdoc-stage-bucket"
}

variable "enable_versioning" {
  description = "Enable versioning for the stage S3 bucket"
  type        = bool
  default     = true
}

variable "iam_role_name" {
  description = "IAM role name for stage EC2 S3 access"
  type        = string
  default     = "wdoc-stage-ec2-s3-role"
}

variable "iam_policy_name" {
  description = "IAM policy name for stage EC2 S3 access"
  type        = string
  default     = "wdoc-stage-ec2-s3-policy"
}

variable "db_name" {
  description = "Name of the stage database"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Master username for the stage database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Master password for the stage database"
  type        = string
  sensitive   = true
}

variable "db_engine_version" {
  description = "PostgreSQL engine version for stage"
  type        = string
  default     = "15.7"
}

variable "db_instance_class" {
  description = "RDS instance class for stage"
  type        = string
  default     = "db.t3.micro"
}

variable "db_storage" {
  description = "Allocated storage in GB for stage RDS"
  type        = number
  default     = 20
}

variable "db_backup_retention_period" {
  description = "Backup retention period for stage RDS"
  type        = number
  default     = 7
}

variable "db_multi_az" {
  description = "Enable Multi-AZ deployment for stage RDS"
  type        = bool
  default     = false
}

variable "db_skip_final_snapshot" {
  description = "Skip final snapshot when destroying stage RDS"
  type        = bool
  default     = false
}

variable "db_publicly_accessible" {
  description = "Whether the stage RDS is publicly accessible"
  type        = bool
  default     = false
}

variable "db_deletion_protection" {
  description = "Enable deletion protection for stage RDS"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Extra tags for stage resources"
  type        = map(string)
  default     = {}
}
