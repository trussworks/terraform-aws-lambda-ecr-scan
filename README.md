# terraform-aws-lambda-ecr-scan

Creates a Lambda function with associated role and policies to parse ECR image
scan findings.

## Usage

```hcl
module "ecrscan_lambda" {
  source  = "trussworks/lambda-ecr-scan/aws"

  job_identifier    = "findings"
  s3_bucket         = "lambda-builds"
  version_to_deploy = "50e9216704a67c97664dbbac521b3a674c61cee9"
  ecr_repositories  = ["arn:aws:ecr:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:repository/app-*"]
}
```

For more details on the capabilities of the `ecr-scan` tool, as
well as how to deploy it, see <https://github.com/trussworks/ecr-scan>.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecrscan_lambda"></a> [ecrscan\_lambda](#module\_ecrscan\_lambda) | trussworks/lambda/aws | ~>2.4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_document.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_logs_retention_days"></a> [cloudwatch\_logs\_retention\_days](#input\_cloudwatch\_logs\_retention\_days) | Number of days to retain Cloudwatch logs. | `string` | `"90"` | no |
| <a name="input_ecr_repositories"></a> [ecr\_repositories](#input\_ecr\_repositories) | The ECR repositories the Lambda will have permission to analyze. | `list(string)` | n/a | yes |
| <a name="input_job_identifier"></a> [job\_identifier](#input\_job\_identifier) | A generic job identifier to make resources for this job more obvious. | `string` | n/a | yes |
| <a name="input_publish"></a> [publish](#input\_publish) | Whether to publish creation/change as new Lambda Function Version. | `bool` | `false` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | The name of the bucket used to store the Lambda builds. | `string` | n/a | yes |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Lambda Function timeout in seconds | `number` | `120` | no |
| <a name="input_version_to_deploy"></a> [version\_to\_deploy](#input\_version\_to\_deploy) | The version of the Lambda function to deploy. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_arn"></a> [lambda\_arn](#output\_lambda\_arn) | ARN for the Lambda function |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Developer Setup

Install dependencies (macOS)

```shell
brew install pre-commit go terraform terraform-docs
pre-commit install --install-hooks
```
