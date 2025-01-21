variable "srv_name" {
  description = "The name of the service"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "az_num" {
  description = "Number of availability zones to use"
  type        = number
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    availability_zone = string
    cidr_block        = string
    is_public         = bool
  }))
}
