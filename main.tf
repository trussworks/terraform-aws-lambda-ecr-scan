locals {
  name = "ecr-scan"
}

data "aws_iam_policy_document" "main" {
  statement {
    effect = "Allow"

    actions = [
      "ecr:DescribeImageScanFindings",
      "ecr:StartImageScan",
    ]

    resources = var.ecr_repositories
  }
}

resource "aws_iam_policy" "main" {
  name   = "${local.name}-${var.job_identifier}-policy"
  policy = data.aws_iam_policy_document.main.json
}

module "ecrscan_lambda" {
  source  = "trussworks/lambda/aws"
  version = "~> 2.6.0"

  name                           = local.name
  handler                        = local.name
  job_identifier                 = var.job_identifier
  runtime                        = "go1.x"
  role_policy_arns_count         = 1
  role_policy_arns               = [aws_iam_policy.main.arn]
  cloudwatch_logs_retention_days = var.cloudwatch_logs_retention_days
  publish                        = var.publish
  timeout                        = var.timeout

  s3_bucket = var.s3_bucket
  s3_key    = "${local.name}/${var.version_to_deploy}.zip"

  env_vars = {
    MAX_SCAN_AGE = "24"
    LAMBDA       = "true"
  }

  tags = {
    Name       = "${local.name}-${var.job_identifier}"
    Automation = "Terraform"
  }
}
