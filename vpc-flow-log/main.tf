resource "aws_flow_log" "vpc_flow_log" {
  vpc_id               = var.vpc_id
  log_destination      = module.s3_bucket.bucket_arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
}

module "s3_bucket" {
  source      = "../s3"
  bucket_name = "${data.aws_caller_identity.current.account_id}-vpc-flow-logs"
  additional_tags = {
    PUBLIC = "N",
    PII    = "Y"
  }
}

resource "aws_s3_bucket_policy" "vpc_flow_log_policy" {
  bucket = module.s3_bucket.bucket_id
  policy = data.aws_iam_policy_document.vpc_flow_log_policy.json
}
