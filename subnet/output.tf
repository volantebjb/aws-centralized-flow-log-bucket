output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.subnet.id
}

output "is_public" {
  description = "Whether the subnet is public or private"
  value       = aws_subnet.subnet.map_public_ip_on_launch
  
}