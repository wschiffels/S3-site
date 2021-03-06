/* get the provider config for website rendering*/
data "aws_region" "current" {}

/* Renders the website (index.html) */
data "template_file" "website" {
  template = file("${path.module}/website.tpl")
  vars = {
    enable_bucket_encryption      = var.enable_bucket_encryption
    enable_logging                = var.enable_logging
    enable_versioning             = var.enable_versioning
    environment                   = terraform.workspace
    sanatized_bucket_name         = local.sanatized_bucket_name
    sanatized_logging_bucket_name = local.sanatized_logging_bucket_name
    aws-region                    = data.aws_region.current.name
  }
}

/* upload rendered template */
resource "aws_s3_bucket_object" "index_html" {
  acl          = "public-read"
  bucket       = aws_s3_bucket.bucket.id
  content      = data.template_file.website.rendered
  content_type = "text/html"
  key          = "index.html"
}

/* static error document */
resource "aws_s3_bucket_object" "four-0-four" {
  acl          = "public-read"
  bucket       = aws_s3_bucket.bucket.id
  content_type = "text/html"
  key          = "404.html"
  source       = "${path.module}/404.html"
}
