variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string
}

# variable "key_name" {
#   description = "The name of the key pair"
#   type        = string
# }

# variable "public_key_path" {
#   description = "The path to the public key file"
#   type        = string
# }