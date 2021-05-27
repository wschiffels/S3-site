/* backend configuration */
terraform {
  backend "s3" {
    bucket               = "terraform"
    key                  = "terraform.tfstate"
    region               = "eu-central-1"
    profile              = "default"
    workspace_key_prefix = ""
    dynamodb_table       = "terraform-lock"
  }
}

/* Terraform IAM Roles */
variable "workspace_iam_roles" {
  type = map(string)
  default = {
    test    = "arn:aws:iam::1234567891234:role/terraform"
    live    = "arn:aws:iam::2345678901234:role/terraform"
    develop = "arn:aws:iam::3456789123456:role/terraform"
  }
}

/* Provider configuration */
provider "aws" {
  region  = "eu-central-1"
  profile = "default"
  assume_role {
    role_arn = var.workspace_iam_roles[terraform.workspace]
  }
}
