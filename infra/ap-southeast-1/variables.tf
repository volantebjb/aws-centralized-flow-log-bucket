data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid    = "PutObject"
    effect = "Allow"

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "${module.bucket_with_policy.bucket_arn}",
      "${module.bucket_with_policy.bucket_arn}/*"
    ]

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "default_policy" {
  statement {
    sid    = "SecureTransport"
    effect = "Deny"

    actions = [
      "s3:*"
    ]

    resources = [
      "${module.bucket_with_policy.bucket_arn}",
      "${module.bucket_with_policy.bucket_arn}/*"
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}

data "aws_iam_policy_document" "merged_policy" {
  source_policy_documents = [
    data.aws_iam_policy_document.bucket_policy.json,
    data.aws_iam_policy_document.default_policy.json
  ]
}

data "aws_caller_identity" "current" {}