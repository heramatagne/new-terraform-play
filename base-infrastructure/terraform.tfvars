# Set variable values
aws_region = "us-west-2"
vpc_cidr = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
instance_ami = "data.aws_ami.linux_2.image_id"
instance_type = "t2.micro"