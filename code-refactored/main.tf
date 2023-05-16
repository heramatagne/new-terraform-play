#This config file contains code to  build a VPC infrastructure and deploy an EC2 instance into the public subnet using Terraform.

#Create a VPC with 
resource "aws_vpc" "tf_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.aws_vpc
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

#Create a sg for EC2 instance.
resource "aws_security_group" "tf_ec2_sg" {
  name        = "ec2_sg"
  description = "Allow inbound traffic"

    ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.ec2_sg
  }
  vpc_id = aws_vpc.tf_vpc.id
} 

# Create an EC2 in pub_subnet_1.
resource "aws_instance" "linux_ec2" {
    ami = data.aws_ami.linux_2.image_id
    # availability_zone = 0
    instance_type = var.instance_type
    subnet_id = aws_subnet.pub_subnet_1.id
    tags = {
        Name = var.ec2_name
    }
    security_groups = [aws_security_group.tf_ec2_sg.id]
    key_name = var.key_name
    associate_public_ip_address = true

}