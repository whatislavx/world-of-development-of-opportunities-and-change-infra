resource "aws_ses_domain_identity" "this" {
  domain = var.domain
}

resource "aws_ses_domain_dkim" "this" {
  domain = aws_ses_domain_identity.this.domain
}

resource "aws_ses_email_identity" "this" {
  email = var.email
}

output "email_domain_identity_arn" {
  value = aws_ses_domain_identity.this.arn
}

output "email_email_identity_arn" {
  value = aws_ses_email_identity.this.arn
}
