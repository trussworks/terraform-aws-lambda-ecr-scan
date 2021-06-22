variable "cloudwatch_logs_retention_days" {
  description = "Number of days to retain Cloudwatch logs."
  type        = string
  default     = "90"
}

variable "job_identifier" {
  description = "A generic job identifier to make resources for this job more obvious."
  type        = string
}

variable "s3_bucket" {
  description = "The name of the bucket used to store the Lambda builds."
  type        = string
}

variable "ecr_repositories" {
  description = "The ECR repositories the Lambda will have permission to analyze."
  type        = list(string)
}

variable "version_to_deploy" {
  description = "The version of the Lambda function to deploy."
  type        = string
}

variable "publish" {
  description = "Whether to publish creation/change as new Lambda Function Version."
  type        = bool
  default     = false
}

variable "timeout" {
  description = "Lambda Function timeout in seconds"
  type        = number
  default     = 120
}