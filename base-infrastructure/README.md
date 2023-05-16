# Base Infrastructure

This project contains Terraform configuration files set a base (networking) infrastructures on AWS.

# Getting Started

- Initialize the project by running terraform init.
- Review the configuration files to ensure they match your requirements.
- Preview the changes by running terraform plan.
- Apply the changes by running terraform apply.

# Resources

 Architecture Diagram
 
 https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=ad.png#R7Vpbb6M4FP41eWyEbSDJY5Mme1Fnt9qutDNPkQMOeIdgZEwu%2B%2BvXBnM1STvTZJpRI1UR52B84Hz%2BvnNMGaDZZv8Lx0n4ifkkGkDL3w%2FQwwDCiWPLX%2BU4FA7HdgpHwKlfuEDteKb%2FEe20tDejPklbAwVjkaBJ2%2BmxOCaeaPkw52zXHrZmUTtqggNiOJ49HJnef6gvwsI7dqza%2FyuhQVhGBpY%2Bs8HlYO1IQ%2ByzXcOF5gM044yJ4mizn5FI5a7MS3Hd4sjZ6sY4icVrLjjEM3qffXZ%2B%2F%2BPTn8FkPdmHX%2FZ3sJhli6NMP3CSrZZptoqJWOoQqTiU2UgYjUWeUWcq%2F2TAmTVw5JmZsobQ6Ti69qjtAKal5mg7uvao7QDd6UEnPujeYMNhWK3prU58q3GD8g9NWSYiGpNZtfYs6Qw49qnEZMYixqUvZrHM3jQUm0haQB7uQirIc4I9ldWdpI30rVks9OoHsLR14tWscn0LLGNxPUeOBOHzLSkAKcZEEU5Suqqu4sTLeEq35C%2BSFpMrr1yJiTre7APF2SHepfYw4CxL8tv%2FTcbqPbtM1XRUHJb14GfB2ddq4twoH3wAEbTHY2Crx6FR1PDPJws0d6V%2FS7igkm33EQ1UUMHUtFhbEVkLNa1MFY2Dx9x6QJZOT18cH6ch8fXt6LUtQ5D9UdKAiopSwgjbEMEPckh5wVjLlZYv4Go272oxAEj7wqYQlE6sBSio5q45Kg80Tb%2BBsgAZnBXrJfGgwdbe5dnKUJn%2BR7wi0RNLqaA59ismBNu8iI9H1BpsL%2B6exYWG6u6MRbBwxg6yjzPmVfAdV7WjmNptSEuzgajdA6h9KTxNOLP0bkdScQexAWkzhTpNBumAPZpP75tQg6NIdmWmw6tqqj7JaoB%2BDqaNrDbT7B6muT3AoIsxbWwWR063t%2Bp4q47nqY4Vu7rV0V3Axfh81dEUhAtVRwTfvzpODFoSX3b02mRchCxgMY7mtXcq8Yr9KjH1mEemEp6vqH%2BJEAe9BHEmWJ%2F%2BqUCnMyk3L5gH5FTtAkdSzkmEhVyr7R1OT%2Fr0pU%2BKAjVUaNyRV9BBIGUZ94i%2BqgbhnnN8aAzTGnc0jm33x6kxLWasEa6e8ftBnxwvoasPVEJt6%2BpKKACnNphmy3orobcS%2BqE2mDa4vg1mz0uhRt97I%2B2NtB%2B87%2B2S9gr63uot85X2vUV7eUp17Iv0vXDS6YncDgJFQ%2F7mvhe5HR1v970v39e3jnd%2FQF8NbKMSGKvsel4y5tKnKlSABdmpXFzkjeNpaUBOGyfHVIY%2BYUDwUsV89B66IJPFD5%2FV9bJQavNL89zDXk9eWIem9UQ4lQ%2BfFzXrzCKjSfryLvytavQ20JyfiXdytQiyFDhvMHop516YcnDYEV%2FLZB10TNbBi1Xj3v%2FRbBPPgDH9SoQXlkz7cZ3jd3d76iF6errxaAImbgd%2FfatnaueqEGd%2FjQnbmj0yV48DekTbvlw3516Tatc6%2FT6qDX8O1YavUG26yb83meI0KRi%2BpnsF2TRppE%2FGoklKGhltomToc%2FVhiVEBNKf%2BzvFH0qHDP9BNIB8xoiv5iz2VmqVP5bZQMJWHRdVJeRHL%2FGG6Dc5DNOh2mtie5gjk%2B%2FUzKLU0649rio64%2FkIJzf8H

This project creates the following AWS resources:

- VPC with the name tf-vpc and the CIDR block 10.0.0.0/16 in us-west-2 Region.
- Two public subnets with CIDR block of 10.0.1.0/24 and 10.0.2.0/24.
- Two private subnets with CIDR block of 10.0.3.0/24 and 10.0.4.0/24.
- An internet gateway attached to the VPC to allow for internet access.
- A route table for the public subnets that routes traffic to the internet gateway.
- An EC2 instance deployed into the us-west-2a public subnet.
A Data source to dynamically fetch the latest Amazon Linux 2.

