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

data "aws_iam_policy_document" "merged_policy" {
  source_policy_documents = [
    module.bucket_with_policy.default_policy.json,
    data.aws_iam_policy_document.bucket_policy.json
  ]
}

data "aws_caller_identity" "current" {}