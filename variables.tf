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