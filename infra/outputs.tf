# outputs.tf
output "website_endpoint" {
  description = "The S3 website endpoint"
  value       = aws_s3_bucket_website_configuration.website_config.website_endpoint
}

output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "certificate_validation_domains" {
  description = "Domain validation options for ACM certificate"
  value       = aws_acm_certificate.cert.domain_validation_options
}
