
# Define variables
variable "aws_region" {
  description = "AWS region where the resources will be create in."
}
variable "vpc_cidr" {
  description = "VPC CIDR block."
}
variable "public_subnet_cidrs" {
  description = "Public subnets' CIDR blocks."
  type        = list(string)
}
variable "private_subnet_cidrs" {
  description = "Private subnets CIDR blocks."
  type        = list(string)
}
variable "instance_ami" {
  description = " ID of the Amazon Machine Image (AMI) to use for the EC2 instance."
  type        = string 
}
variable "instance_type" {
    description = "The instance type to use for the EC2 instance."
    type = string 
}
variable "key_name" {
  description = "Key name"
  type = string
}
variable "ec2_name" {
  type = string
}
variable "ec2_sg" {
 type =  string
}

variable "aws_vpc" {
  type = string
}