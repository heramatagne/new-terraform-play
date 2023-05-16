# define output

output "public_ip_address" {
  value = aws_instance.linux_ec2.public_ip
}

output "private_ip_address" {
  value = aws_instance.linux_ec2.private_ip
}

output "security_group_id" {
  value = aws_security_group.tf_ec2_sg.id
}