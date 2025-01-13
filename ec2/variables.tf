variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-0a8f40a451672ea1d"
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string
  default     = ""
}