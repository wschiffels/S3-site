data "template_file" "website" {
  template = file("${path.module}/website.tpl")
  vars = {
    environment              = terraform.workspace
    enable_bucket_encryption = var.enable_bucket_encryption
    enable_versioning        = var.enable_versioning
    enable_logging           = var.enable_logging
  }
}

resource "aws_s3_bucket_object" "index_html" {
  acl          = "public-read"
  bucket       = aws_s3_bucket.bucket.id
  content      = data.template_file.website.rendered
  content_type = "text/html"
  key          = "index.html"
}
