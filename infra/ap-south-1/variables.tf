variable "region" {
  description = "The AWS region"
  type        = string
  default     = "ap-south-1"
}

data "aws_caller_identity" "current" {}
