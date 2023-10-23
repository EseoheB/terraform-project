resource "aws_vpc" "web_server_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Webserver VPC"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.web_server_vpc.id
  cidr_block             = var.public-subnet-1_cidr
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.web_server_vpc.id
  cidr_block             = var.public-subnet-2_cidr
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet-2"
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.web_server_vpc.id
  cidr_block             = var.private-subnet-1_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private-subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id     = aws_vpc.web_server_vpc.id
  cidr_block             = var.private-subnet-2_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private-subnet-2"
  }
}

# Creating Internet Gateway 
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.web_server_vpc.id

    tags = {
    Name = "IGW"
  }
}

# Creating a Route Table for a Public Subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.web_server_vpc.id

  tags = {
    Name = "Public Route Table"
  }
}

# Defining a Default Route to the Internet Gateway in the Public Route Table
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.IGW.id
}

# Associating Public Subnets 1 with the Public Route Table
resource "aws_route_table_association" "rt_associate_public_1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public_route_table.id
}

# Associating Public Subnets 2 with the Public Route Table
resource "aws_route_table_association" "rt_associate_public_2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public_route_table.id
}

# Creating EIP
resource "aws_eip" "elastic_ip" {

    tags = {
    Name = "EIP"
  }
}

# Creating NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public-subnet-1.id

    tags = {
    Name = "NAT-GW"
  }
}

# Creating a Route Table for a Private Subnet
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.web_server_vpc.id

  tags = {
    Name = "Private Route Table"
  }
}

# Defining a Route to the NatGatway in the Private Route Table
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gw.id
}

# Associating Private Subnets 1 with the Private Route Table
resource "aws_route_table_association" "rt_associate_private_1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private_route_table.id
}

# Associating Private Subnets 2 with the Private Route Table
resource "aws_route_table_association" "rt_associate_private_2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private_route_table.id
}
