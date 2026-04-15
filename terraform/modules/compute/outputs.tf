output "public_dns" {
  value = aws_instance.app.public_dns
}

output "instance_id" {
  value = aws_instance.app.id
}

output "public_ip" {
  value = var.allocate_eip ? aws_eip.app[0].public_ip : aws_instance.app.public_ip
}

output "eip_public_ip" {
  value = var.allocate_eip ? aws_eip.app[0].public_ip : null
}

output "security_group_id" {
  value = aws_security_group.ec2_sg.id
}
