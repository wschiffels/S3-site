variable "bucketname" {
  type        = string
  description = "The name of the bucket. Dots will be automatically converted to dashes."
}

variable "enable_bucket_encryption" {
  type        = bool
  description = "Enable bucket encryption at rest."
}

variable "enable_logging" {
  type        = bool
  description = "Enable logging. Logs will be purged after 30 days."
}

variable "enable_versioning" {
  type        = bool
  description = "Enable s3 bucket versioning."
}
