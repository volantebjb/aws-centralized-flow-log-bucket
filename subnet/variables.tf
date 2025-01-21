variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
}

variable "is_public" {
  description = "Should the subnet have a route to the internet?"
  type        = bool
}
