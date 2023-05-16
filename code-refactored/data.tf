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
