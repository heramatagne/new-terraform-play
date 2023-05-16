# Terraform Code Refactoring

This project contains refactor Terraform configuration files set a base (networking) infrastructures on AWS.

# Getting Started

- Initialize the project by running terraform init.
- Review the configuration files to ensure they match your requirements.
- Preview the changes by running terraform plan.
<img width="1209" alt="Screen Shot 2023-05-16 at 3 06 25 PM" src="https://github.com/heramatagne/new-terraform-play/assets/85662021/5333a76a-d409-4856-a0d3-952736e29beb">

<img width="857" alt="Screen Shot 2023-05-16 at 3 07 38 PM" src="https://github.com/heramatagne/new-terraform-play/assets/85662021/738aaa57-d11f-4289-8ec1-0db4926e6e23">

- Apply the changes by running terraform apply.
<img width="1010" alt="Screen Shot 2023-05-16 at 3 09 29 PM" src="https://github.com/heramatagne/new-terraform-play/assets/85662021/d9704bcc-562d-490c-810c-52d4fc3544aa">

<img width="569" alt="Screen Shot 2023-05-16 at 3 58 43 PM" src="https://github.com/heramatagne/new-terraform-play/assets/85662021/3d4f9220-583f-42f1-832c-44f9747e7e47">

# Resources

 Architecture Diagram
 
 <img width="723" alt="Screen Shot 2023-05-16 at 12 37 34 PM" src="https://github.com/heramatagne/new-terraform-play/assets/85662021/a6e1b3ea-5dd3-49ea-90f3-57438c2abc61">

This project creates the following AWS resources:

- VPC with the name tf-vpc and the CIDR block 10.0.0.0/16 in us-west-2 Region.
- Two public subnets with CIDR block of 10.0.1.0/24 and 10.0.2.0/24.
- Two private subnets with CIDR block of 10.0.3.0/24 and 10.0.4.0/24.
- An internet gateway attached to the VPC to allow for internet access.
- A route table for the public subnets that routes traffic to the internet gateway.
- A Security Group
- An EC2 instance deployed into the us-west-2a public subnet.
A Data source to dynamically fetch the latest Amazon Linux 2.

