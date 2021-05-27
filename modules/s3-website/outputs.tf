output "s3_bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "s3_bucket_name" {
  value = local.sanatized_bucket_name
}

output "s3_logging_bucket_name" {
  value = local.sanatized_logging_bucket_name
}

output "rendered" {
  value = data.template_file.website.rendered
}
