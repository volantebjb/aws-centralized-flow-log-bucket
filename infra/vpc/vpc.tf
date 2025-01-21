module "vpc" {
  source     = "../../vpc"
  vpc_name   = var.srv_name
  cidr_block = var.cidr_block
}

module "subnets" {
  source            = "../../subnet"
  for_each          = local.subnets
  vpc_id            = module.vpc.vpc_id
  subnet_name       = each.key
  availability_zone = each.value.availability_zone
  cidr_block        = each.value.cidr_block
  is_public         = each.value.is_public
}
