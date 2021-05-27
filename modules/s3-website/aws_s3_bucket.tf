/* S3 Bucket */
resource "aws_s3_bucket" "bucket" {
  acl    = "public-read"
  bucket = replace(var.bucketname, ".", "-")

  versioning {
    enabled = var.enable_versioning
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  dynamic "server_side_encryption_configuration" {
    for_each = var.enable_bucket_encryption ? ["true"] : []

    content {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
      }
    }
  }

  tags = {
    "Environment" = terraform.workspace
  }
}

/* ToDo:
   optional logging (=> new S3 bucket for logs)
   routing_rules
*/

/* S3 Bucket Policy */
resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.policy-document.json
}

/* IAM Policy Document */
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

/* Logging Bucket (optional) */
resource "aws_s3_bucket" "logging" {
  count = var.enable_logging == true ? 1 : 0

  bucket = replace(format("%s-%s", var.bucketname, "logging"), ".", "-")
  acl    = "private"

  lifecycle_rule {
    enabled = true

    expiration {
      days = 30
    }
  }

  tags = {
    "Environment" = terraform.workspace
  }
}


