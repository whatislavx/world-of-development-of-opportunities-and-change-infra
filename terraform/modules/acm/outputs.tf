output "certificate_arn" {
  value = (
    length(aws_acm_certificate_validation.this) > 0
    ? aws_acm_certificate_validation.this[0].certificate_arn
    : aws_acm_certificate.this.arn
  )
  description = "ACM certificate ARN (us-east-1)"
}

output "domain_validation_options" {
  value = aws_acm_certificate.this.domain_validation_options
  description = "DNS records required to validate the certificate when route53_zone_id is not set"
}

output "certificate_status" {
  value       = aws_acm_certificate.this.status
  description = "ACM certificate status"
}
