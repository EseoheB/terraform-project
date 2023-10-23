# Creating EC2 instance in Public Subnet
resource "aws_instance" "web_server" {
    ami                    = "ami-0df435f331839b2d6"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  subnet_id              = aws_subnet.public-subnet-1.id
  tags = {
    Name = "Web-server"
  }
}