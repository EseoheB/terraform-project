# Creating EC2 instance in Public Subnet
resource "aws_instance" "web_server" {
    ami                    = var.ami_id
  instance_type          = var.instance_type
  associate_public_ip_address = var.enable_public_ip
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  subnet_id              = aws_subnet.public-subnet-1.id
  tags = {
    Name = "Web-server"
  }
}
