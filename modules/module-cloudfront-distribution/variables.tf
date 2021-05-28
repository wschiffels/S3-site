variable "domain_name" {
  description = "The website's S3 bucket endpoint."
  type        = string
}

variable "s3_origin_id" {
  description = "A unique identifier for the origin. Should be the website-buckets' id."
  type        = string
}

variable "default_root_object" {
  description = "The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL"
  type        = string
  default     = "index.html"
}

variable "enable_cloudfront_logging" {
  type        = bool
  description = "enable cloudfront logging"
  default     = true
}

variable "cloudfront_logging_bucket" {
  type        = string
  description = "the bucket for cloudfront logging"
}

variable "price_class" {
  description = "The price class that corresponds with the maximum price that you want to pay for CloudFront service."
  default     = "PriceClass_100"
  type        = string
}

variable "viewer_protocol_policy" {
  type        = string
  description = "Specify the protocol that users can use to access the files."
  default     = "redirect-to-https"
}

variable "is_ipv6_enabled" {
  default     = true
  type        = bool
  description = "enable IPv6 for the cloudfront distribution."
}
