variable "domain_name" {
  type        = string
  description = "Primary domain name for the ACM certificate"
}

variable "route53_zone_id" {
  type        = string
  description = "Route53 hosted zone ID for automatic DNS validation. Leave empty to validate manually."
  default     = ""
}

variable "tags" {
  type        = map(string)
  default     = {}
}
