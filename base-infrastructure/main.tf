#This config file contains code to  build a VPC infrastructure and deploy an EC2 instance into the public subnet using Terraform.

#terraform block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Define provider block
provider "aws" {
  region = var.aws_region
}

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
# variable "latest_amazon_linux_2_ami_id" {
# }


#Data source for AZs.
data "aws_availability_zones" "az" {
  state = "available"
}

#Define a data source to dynamically fetch the latest Amazon Linux 2 AMI for the EC2.
data "aws_ami" "linux_2" {
    most_recent = true
    owners = ["amazon"]

    filter {
      name   = "name"
      values = ["amzn2-ami-hvm-*-x86_64-ebs"]
    }

    filter {
      name   = "virtualization-type"
      values = ["hvm"]
    }     
}

#Create a VPC with 
resource "aws_vpc" "tf_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "tf_vpc"
  }
}

#Create public and private subnets.
resource "aws_subnet" "pub_subnet_1" {
    vpc_id = aws_vpc.tf_vpc.id
    cidr_block = var.public_subnet_cidrs[0]
    availability_zone = data.aws_availability_zones.az.names[0]
    tags = {
      Name = "pub_subnet_1"
    }
}
resource "aws_subnet" "pub_subnet_2" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.public_subnet_cidrs[1]
  availability_zone = data.aws_availability_zones.az.names[1]
  tags = {
    Name = "pub_subnet_2"
  }
}
resource "aws_subnet" "priv_subnet_1" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.private_subnet_cidrs[0]
  availability_zone = data.aws_availability_zones.az.names[0]

  tags = {
    Name = "priv_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.private_subnet_cidrs[1]
  availability_zone = data.aws_availability_zones.az.names[1]

  tags = {
    Name = "priv_subnet_2"
  }
}

#Create an IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = "tf_igw"
  }
}

#Create a public route table  that routes traffic to the internet gateway.
resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.tf_vpc.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }

  tags = {
    Name = "pub_rt"
  }
}

#Public subnet association to the the route table.
resource "aws_route_table_association" "pub_subnet_1_association" {
  route_table_id = aws_route_table.pub_rt.id
  subnet_id = aws_subnet.pub_subnet_1.id
}
resource "aws_route_table_association" "pub_subnet_2_association" {
  route_table_id = aws_route_table.pub_rt.id
  subnet_id = aws_subnet.pub_subnet_2.id
}

# Create an EC2 in pub_subnet_1.
resource "aws_instance" "linux_ec2" {
    ami = data.aws_ami.linux_2.image_id
    # availability_zone = 0
    instance_type = var.instance_type
    subnet_id = aws_subnet.pub_subnet_1.id
    tags = {
        Name = "linux2_ec2"
    }

}