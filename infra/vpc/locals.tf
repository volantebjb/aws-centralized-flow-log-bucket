locals {
  az_names        = slice(data.aws_availability_zones.available.names, 0, var.az_num)
  public_subnets  = formatlist("%s-subnet-public-%s", var.srv_name, local.az_names)
  private_subnets = formatlist("%s-subnet-private-%s", var.srv_name, local.az_names)
  total_subnets   = concat(local.public_subnets, local.private_subnets)
  subnets = {
    for subnet in local.total_subnets : subnet => {
      availability_zone = element(local.az_names, index(local.total_subnets, subnet))
      cidr_block        = cidrsubnet(var.cidr_block, 8, index(local.total_subnets, subnet))
      is_public         = contains(local.public_subnets, subnet)
    }
  }
}
