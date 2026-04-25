variable "aws_region" {
  description = "AWS region for resources"
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  default     = true
}

variable "vpc_name" {
  description = "Name of the VPC"
  default     = "wdoc-vpc"
}

variable "igw_name" {
  description = "Name of the Internet Gateway"
  default     = "wdoc-igw"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/28"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the first private subnet"
  default     = "10.0.2.0/28"
}

variable "private_subnet_cidr_b" {
  description = "CIDR block for the second private subnet"
  default     = "10.0.3.0/28"
}

variable "public_subnet_az" {
  description = "Availability zone for the public subnet"
  type        = string
}

variable "private_subnet_az" {
  description = "Availability zone for the first private subnet"
  type        = string
}

variable "private_subnet_az_b" {
  description = "Availability zone for the second private subnet"
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Auto-assign public IP addresses to instances in the public subnet"
  default     = true
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  default     = "wdoc-public-subnet"
}

variable "private_subnet_name" {
  description = "Name of the private subnet"
  default     = "wdoc-private-subnet"
}

variable "public_route_table_name" {
  description = "Name of the public route table"
  default     = "wdoc-public-rt"
}
