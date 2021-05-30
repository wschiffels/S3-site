output "s3_bucket_arn" {
  value       = aws_s3_bucket.bucket.arn
  description = "The Bucket's ARN."
}

output "s3_bucket_name" {
  value       = local.sanatized_bucket_name
  description = "The sanitized name of the bucket."
}

output "s3_bucket_domain_name" {
  value       = aws_s3_bucket.bucket_domain_name
  description = "The bucket domain name"
}

output "s3_website_endpoint" {
  value       = aws_s3_bucket.bucket.website_endpoint
  description = "The website endpoint, if the bucket is configured with a website."
}
output "s3_logging_bucket_name" {
  value       = local.sanatized_logging_bucket_name
  description = "The sanitized name of the logging bucket."

}

output "rendered" {
  value       = data.template_file.website.rendered
  description = "The contents of the rendered index document."
}
