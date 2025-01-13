resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = aws_key_pair.ec2_key_pair.key_name
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}