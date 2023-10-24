# Defining CIDR Block for VPC
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
# Defining CIDR Block for 1st Subnet
variable "public-subnet-1_cidr" {
  default = "10.0.1.0/24"
}
# Defining CIDR Block for 2nd Subnet
variable "public-subnet-2_cidr" {
  default = "10.0.2.0/24"
}
# Defining CIDR Block for 3rd Subnet
variable "private-subnet-1_cidr" {
  default = "10.0.3.0/24"
}
# Defining CIDR Block for 4th Subnet
variable "private-subnet-2_cidr" {
  default = "10.0.4.0/24"
}

# Defining AMI ID
variable "ami_id" {
  default = "ami-0df435f331839b2d6"
  type = string
}

# Defining Instance type
variable "instance_type" {
  default = "t2.micro"
  type = string
}

# Defining Public IP address
variable "enable_public_ip" {
  default = true
  type = bool
}
