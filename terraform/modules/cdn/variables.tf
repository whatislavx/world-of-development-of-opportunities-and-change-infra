variable "environment" {
  type        = string
  description = "Environment name (e.g. staging)"
}

variable "site_domain" {
  type        = string
  description = "Public site domain (e.g. stage-wdoc.pp.ua), used for CDN aliases and Nginx origin Host header"
}

variable "nginx_domain" {
  type        = string
  description = "CDN origin hostname (<origin-prefix>.<site_domain>). Must resolve to EC2 and have a valid TLS certificate."
}

variable "s3_bucket_id" {
  type        = string
  description = "S3 media bucket name"
}

variable "s3_bucket_arn" {
  type        = string
  description = "S3 media bucket ARN"
}

variable "s3_bucket_domain_name" {
  type        = string
  description = "S3 bucket regional domain name"
}

variable "acm_certificate_arn" {
  type        = string
  description = "ACM certificate ARN in us-east-1 for custom CDN domain. Leave empty to use the default *.cloudfront.net certificate."
  default     = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}
