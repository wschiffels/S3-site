variable "bucketname" {
  type        = string
  description = "The name of the bucket. Bucket naming rules will be enforced."
}

variable "enable_bucket_encryption" {
  type        = bool
  description = "Enable bucket encryption at rest."
}

variable "enable_cloudfront_distribution" {
  type        = bool
  description = "enable cloudfront distribution for the website"
}

variable "enable_logging" {
  type        = bool
  description = "Enable logging. Logs will be purged after 30 days."
}

variable "enable_versioning" {
  type        = bool
  description = "Enable s3 bucket versioning."
}

variable "logging_bucket_expiration_days" {
  type        = number
  default     = 30
  description = "Period after which the logging object expire"
}

variable "logging_bucket_lifecycle_enabled" {
  type        = bool
  description = "Enable logging bucket lifecycle"
  default     = true

}
