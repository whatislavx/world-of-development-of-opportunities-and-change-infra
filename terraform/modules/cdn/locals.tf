locals {
  origin_nginx = "NginxServer"
  origin_s3    = "S3MediaBucket"

  # AWS managed CloudFront cache / origin request policies
  cache_policy_caching_optimized               = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  cache_policy_caching_disabled                = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
  origin_request_policy_cors_s3_origin         = "88a5eaf4-2fd4-4709-b370-d4c650ea3f43"
  origin_request_policy_all_viewer_except_host = "216adef6-5c7f-47e4-b989-5492eafa07d3"

  use_custom_domain = var.acm_certificate_arn != ""
}
