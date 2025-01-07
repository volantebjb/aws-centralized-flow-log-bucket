resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = var.vpc_name
    }
}

# resource "aws_vpc" "vpc_other_region" {
#   provider             = aws.us-east-1
#   cidr_block           = var.vpc_cidr_block
#   enable_dns_support   = true
#   enable_dns_hostnames = true
#   tags = {
#     Name = var.vpc_name_other_region
#   }
# }