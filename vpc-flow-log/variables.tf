variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "log_destination" {
  description = "The ARN of the S3 bucket to which the flow logs will be delivered"
  type        = string
  default     = ""
}

variable "create_s3_bucket" {
  description = "Whether to create a new S3 bucket for VPC flow logs"
  type        = bool
  default     = true
}

data "aws_iam_policy_document" "vpc_flow_log_policy" {
  statement {
    sid    = "AWSLogDeliveryWrite"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "${module.s3_bucket.bucket_arn}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values = [
        "${data.aws_caller_identity.current.account_id}"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values = [
        "bucket-owner-full-control"
      ]
    }

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values = [
        "arn:aws:logs:*:${data.aws_caller_identity.current.account_id}:*"
      ]
    }
  }

  statement {
    sid    = "AWSLogDeliveryAclCheck"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }

    actions = [
      "s3:GetBucketAcl",
      "s3:ListBucket"
    ]

    resources = [
      "${module.s3_bucket.bucket_arn}"
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values = [
        "${data.aws_caller_identity.current.account_id}"
      ]
    }

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values = [
        "arn:aws:logs:*:${data.aws_caller_identity.current.account_id}:*"
      ]
    }
  }
}

data "aws_caller_identity" "current" {}
