variable "aws_region" {
  description = "AWS region for resources"
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
  default     = 8
}

variable "allocate_eip" {
  description = "Whether to allocate and associate an Elastic IP to the instance"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
}

variable "ec2_users" {
  description = "Linux users to create on EC2 for SSH access"
  type        = list(string)
  default     = ["wdoc_ansible_user"]
}

variable "iam_instance_profile" {
  description = "Optional IAM instance profile name for the EC2 instance"
  type        = string
  default     = null
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH access"
  default     = "0.0.0.0/0"
}

variable "environment" {
  description = "Environment name"
  default     = "development"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  default     = "wdoc-app-server"
}

variable "security_group_name" {
  description = "Name of the security group"
  default     = "ec2-sg"
}

variable "security_group_description" {
  description = "Description of the security group"
  default     = "Allow HTTP, HTTPS, SSH"
}
