module "bucket_with_policy" {
  source      = "../../s3"
  bucket_name = "${data.aws_caller_identity.current.account_id}-bucket-with-policy"
  additional_tags = {
    PUBLIC = "N",
    PII    = "Y"
  }
}

resource "aws_s3_bucket_policy" "bucket_with_policy_policy" {
  bucket = module.bucket_with_policy.bucket_id
  policy = data.aws_iam_policy_document.merged_policy.json
}

module "bucket_without_policy" {
  source             = "../../s3"
  bucket_name        = "${data.aws_caller_identity.current.account_id}-bucket-without-policy"
  lifecycle_duration = 30
  additional_tags = {
    PUBLIC = "N",
    PII    = "N"
  }
}

module "vpc_main" {
  source            = "../../vpc"
  vpc_name          = "${data.aws_caller_identity.current.account_id}-vpc-main"
  vpc_cidr_block    = "10.0.1.0/24"
  subnet_cidr_block = "10.0.1.0/28"
}

module "vpc_main_flow_log" {
  source = "../../vpc-flow-log"
  vpc_id = module.vpc_main.vpc_id
}

module "ec2_main" {
  source    = "../../ec2"
  ami       = "ami-0e48a8a6b7dc1d30b"
  subnet_id = module.vpc_main.subnet_id
  key_name  = "ec2-key"
  public_key_path = "../ec2-key.pub"
}
