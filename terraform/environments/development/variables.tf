variable "aws_region" {
  description = "AWS region for development resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the development VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the development public subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the development private subnet"
  type        = string
  default     = "10.10.2.0/24"
}

variable "public_subnet_az" {
  description = "Availability zone for the development public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "private_subnet_az" {
  description = "Availability zone for the development private subnet"
  type        = string
  default     = "us-east-1b"
}

variable "vpc_name" {
  description = "Name of the development VPC"
  type        = string
  default     = "wdoc-dev-vpc"
}

variable "igw_name" {
  description = "Name of the development Internet Gateway"
  type        = string
  default     = "wdoc-dev-igw"
}

variable "public_subnet_name" {
  description = "Name of the development public subnet"
  type        = string
  default     = "wdoc-dev-public-subnet"
}

variable "private_subnet_name" {
  description = "Name of the development private subnet"
  type        = string
  default     = "wdoc-dev-private-subnet"
}

variable "public_route_table_name" {
  description = "Name of the development public route table"
  type        = string
  default     = "wdoc-dev-public-rt"
}

variable "instance_type" {
  description = "EC2 instance type for development"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Name of the development EC2 instance"
  type        = string
  default     = "wdoc-dev-app-server"
}

variable "security_group_name" {
  description = "Name of the development EC2 security group"
  type        = string
  default     = "ec2-dev-sg"
}

variable "security_group_description" {
  description = "Description of the dev EC2 security group"
  type        = string
  default     = "Allow HTTP, HTTPS, SSH"
}

variable "key_name" {
  description = "SSH key pair name for development"
  type        = string
}

variable "public_key_path" {
  description = "Path to the development public key file"
  type        = string
}

variable "ec2_users" {
  description = "Linux users to create on development EC2"
  type        = list(string)
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into development EC2"
  type        = string
  default     = "0.0.0.0/0"
}

variable "bucket_name" {
  description = "Name of the development S3 bucket"
  type        = string
  default     = "wdoc-dev-bucket"
}

variable "enable_versioning" {
  description = "Enable versioning for the development S3 bucket"
  type        = bool
  default     = true
}

variable "iam_role_name" {
  description = "IAM role name for development EC2 S3 access"
  type        = string
  default     = "wdoc-dev-ec2-s3-role"
}

variable "iam_policy_name" {
  description = "IAM policy name for development EC2 S3 access"
  type        = string
  default     = "wdoc-dev-ec2-s3-policy"
}

variable "tags" {
  description = "Extra tags for development resources"
  type        = map(string)
  default     = {}
}
