## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.s3_distribution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_identity.origin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudfront_logging_bucket"></a> [cloudfront\_logging\_bucket](#input\_cloudfront\_logging\_bucket) | the bucket for cloudfront logging | `string` | n/a | yes |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL | `string` | `"index.html"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The website's S3 bucket endpoint. | `string` | n/a | yes |
| <a name="input_enable_cloudfront_logging"></a> [enable\_cloudfront\_logging](#input\_enable\_cloudfront\_logging) | enable cloudfront logging | `bool` | `true` | no |
| <a name="input_is_ipv6_enabled"></a> [is\_ipv6\_enabled](#input\_is\_ipv6\_enabled) | enable IPv6 for the cloudfront distribution. | `bool` | `true` | no |
| <a name="input_price_class"></a> [price\_class](#input\_price\_class) | The price class that corresponds with the maximum price that you want to pay for CloudFront service. | `string` | `"PriceClass_100"` | no |
| <a name="input_s3_origin_id"></a> [s3\_origin\_id](#input\_s3\_origin\_id) | A unique identifier for the origin. Should be the website-buckets' id. | `string` | n/a | yes |
| <a name="input_viewer_protocol_policy"></a> [viewer\_protocol\_policy](#input\_viewer\_protocol\_policy) | Specify the protocol that users can use to access the files. | `string` | `"redirect-to-https"` | no |

## Outputs

No outputs.
