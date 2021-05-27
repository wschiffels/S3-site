module "s3-website" {
  source = "./modules/s3-website"

  bucketname               = "test.site"
  enable_bucket_encryption = true
  enable_logging           = true
  enable_versioning        = true
}
