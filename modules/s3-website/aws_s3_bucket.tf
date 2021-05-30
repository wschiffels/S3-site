locals {
  /* see https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html */
  sanatized_bucket_name         = substr(lower(replace(var.bucketname, "/[=&#,§|+()$~%.'\"/:*?<>{}]/", "-")), 0, 62)
  sanatized_logging_bucket_name = format("%s-%s", substr(local.sanatized_bucket_name, 0, 54), "logging")
}

module "cloudfront-distribution" {
  count = var.enable_cloudfront_distribution == true ? 1 : 0

  source                    = "../module-cloudfront-distribution"
  cloudfront_logging_bucket = aws_s3_bucket.logging[0].id
  domain_name               = aws_s3_bucket.bucket.website_endpoint
  s3_origin_id              = aws_s3_bucket.bucket.id
}

/* The S3 Website Bucket */
resource "aws_s3_bucket" "bucket" {
  bucket = local.sanatized_bucket_name

  versioning {
    enabled = var.enable_versioning
  }

  website {
    error_document = "error.html"
    index_document = "index.html"
  }

  dynamic "server_side_encryption_configuration" {
    for_each = var.enable_bucket_encryption ? ["true"] : []

    content {
      rule {
        bucket_key_enabled = true
        apply_server_side_encryption_by_default {
          kms_master_key_id = aws_kms_key.key.arn
          sse_algorithm     = "aws:kms"
        }
      }
    }
  }

  tags = {
    "Environment" = terraform.workspace
  }
}

/* S3 Website Bucket Policy */
resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.policy-document.json
}

/* IAM Policy Document for Bucket Policy */
data "aws_iam_policy_document" "policy-document" {
  statement {
    actions = [
      "s3:GetObject"
    ]

    resources = [
      aws_s3_bucket.bucket.arn
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

/* The Logging Bucket (optional) */
resource "aws_s3_bucket" "logging" {
  count = var.enable_logging == true ? 1 : 0

  bucket = local.sanatized_logging_bucket_name
  acl    = "private"

  dynamic "lifecycle_rule" {
    for_each = var.logging_bucket_lifecycle_enabled ? ["true"] : []
    content {
      enabled = true

      expiration {
        days = var.logging_bucket_expiration_days
      }
    }
  }
  tags = {
    "Environment" = terraform.workspace
  }
}


