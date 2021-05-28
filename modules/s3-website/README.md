## Usage


```hcl
module "s3-website" {
  source = "./modules/s3-website"

  bucketname                       = "test.bucket"
  enable_bucket_encryption         = true
  enable_logging                   = true
  enable_versioning                = true
  logging_bucket_lifecycle_enabled = true
  logging_bucket_expiration_days   = 15
}
```

rendered index document:
```html
<html>
  <head>
    <title>Hello Rubarb</title>
  </head>
  <body>
    Hello Rubarb,
    => We're running on environment: test.</br>
    => The Bucket is encrypted.</br>
    => Logging is enabled.</br>
    => Versioning is enabled.</br>
    => The sanitized bucket name is: test-bucket</br>
    => The logging bucket name is: test-bucket-logging
    </br>
    ¯\_(ツ)_/¯
  </body>
</html>
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudfront-distribution"></a> [cloudfront-distribution](#module\_cloudfront-distribution) | ../module-cloudfront-distribution |  |

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_object.four-0-four](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.index_html](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_policy.bucket-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_iam_policy_document.policy-document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [template_file.website](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucketname"></a> [bucketname](#input\_bucketname) | The name of the bucket. Bucket naming rules will be enforced. | `string` | n/a | yes |
| <a name="input_enable_bucket_encryption"></a> [enable\_bucket\_encryption](#input\_enable\_bucket\_encryption) | Enable bucket encryption at rest. | `bool` | n/a | yes |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Enable logging. Logs will be purged after 30 days. | `bool` | n/a | yes |
| <a name="input_enable_versioning"></a> [enable\_versioning](#input\_enable\_versioning) | Enable s3 bucket versioning. | `bool` | n/a | yes |
| <a name="input_logging_bucket_expiration_days"></a> [logging\_bucket\_expiration\_days](#input\_logging\_bucket\_expiration\_days) | Period after which the logging object expire | `number` | `30` | no |
| <a name="input_logging_bucket_lifecycle_enabled"></a> [logging\_bucket\_lifecycle\_enabled](#input\_logging\_bucket\_lifecycle\_enabled) | Enable logging bucket lifecycle | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rendered"></a> [rendered](#output\_rendered) | The contents of the rendered index document. |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | The Bucket's ARN. |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | The sanitized name of the bucket. |
| <a name="output_s3_logging_bucket_name"></a> [s3\_logging\_bucket\_name](#output\_s3\_logging\_bucket\_name) | The sanitized name of the logging bucket. |
