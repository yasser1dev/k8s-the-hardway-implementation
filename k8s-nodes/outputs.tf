output "instance_id" {
  description = "ID Of instance"
  value       = aws_instance.aws_instance.id
}

output "instance_private_ip" {
  description = "Private ip address of instance"
  value       = aws_instance.aws_instance.private_ip
}

output "instance_public_ip" {
  description = "Instance public ip address"
  value = aws_instance.aws_instance.public_ip
}

output "availability_zone" {
  description = "availability_zone"
  value       = aws_instance.aws_instance.availability_zone
}