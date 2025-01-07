module "vpc_secondary" {
  source         = "../vpc"
  vpc_name       = "${data.aws_caller_identity.current.account_id}-vpc-secondary"
  vpc_cidr_block = "10.0.1.0/24"

}

module "vpc_secondary_flow_log" {
  source = "../vpc-flow-log"
  vpc_id = module.vpc_secondary.vpc_id
}
