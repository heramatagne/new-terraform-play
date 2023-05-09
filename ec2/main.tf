#terraform block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
} 

# Define the provider
provider "aws" {
  region = "us-west-2"
}

# Create a t3 micro ec2 in the default vpc.
resource "aws_instance" "my-ec2" {
  ami           = "ami-0dc2d3e4c0f9ebd18"
  instance_type = "t3.micro"
  tags = {
    Name = "my-ec2"
  }
}
