resource "aws_cloudfront_origin_access_identity" "origin" {
  comment = "example-com-origin"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = var.domain_name
    origin_id   = var.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = var.is_ipv6_enabled
  default_root_object = var.default_root_object

  dynamic "logging_config" {
    for_each = var.enable_cloudfront_logging ? ["true"] : []

    content {
      include_cookies = false
      bucket          = var.cloudfront_logging_bucket
      prefix          = "cloudfront"
    }
  }

  /* ToDo: implement aliases
  aliases = [
    "mysite.example.com", "yoursite.example.com"
  ]
  */

  /* ToDo: Add some configurable options here */
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = var.viewer_protocol_policy
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }


  price_class = var.price_class

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  /* ToDo: implement custom certificate */
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
