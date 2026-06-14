output "distribution_domain_name" {
  value       = aws_cloudfront_distribution.this.domain_name
  description = "CDN distribution domain (*.cloudfront.net)"
}

output "distribution_id" {
  value       = aws_cloudfront_distribution.this.id
  description = "CDN distribution ID"
}

output "distribution_arn" {
  value       = aws_cloudfront_distribution.this.arn
  description = "CDN distribution ARN"
}

output "hosted_zone_id" {
  value       = aws_cloudfront_distribution.this.hosted_zone_id
  description = "Route53 hosted zone ID for CDN alias records"
}
