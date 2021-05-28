variable "base_url" {
  type = map(string)
  default = {
    "test"    = "a-super&long#bucket%name§with|weird)characters#noone'would=actally{want}to[use" # 80 characters
    "live"    = "production"
    "develop" = "dev"
  }
}

module "s3-website" {
  source = "./modules/s3-website"

  bucketname                       = "bucket" #var.base_url[terraform.workspace]
  enable_bucket_encryption         = "true"   #terraform.workspace == "live" ? true : false
  enable_logging                   = true
  enable_versioning                = true
  logging_bucket_lifecycle_enabled = true
  logging_bucket_expiration_days   = 15
  enable_cloudfront_distribution   = true
}

# http(s)://<bucket>.s3.amazonaws.com/<object>
# http(s)://s3.amazonaws.com/<bucket>/<object>
# https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
