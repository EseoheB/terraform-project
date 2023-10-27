# Creating EC2 instance in Public Subnet
resource "aws_instance" "web_server" {
  count = var.env == "prod" ? 4 : 2
  ami                    = "ami-0dbc3d7bc646e8516"
  instance_type          = var.env == "prod" ? "t2.medium" : "t2.micro"
  associate_public_ip_address = var.enable_public_ip
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  subnet_id              = aws_subnet.public-subnet-1.id
  tags = merge({Name = "${local.project_name}-${local.env}-instance-${count.index}"}, local.project_tags)
}
