/* KMS key to encrypt bucket at rest */
resource "aws_kms_key" "key" {
  deletion_window_in_days = 10
  description             = "This key is used to encrypt bucket objects"
  enable_key_rotation     = true
}
