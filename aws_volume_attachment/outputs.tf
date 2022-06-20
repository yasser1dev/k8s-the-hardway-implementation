output "volume_id" {
  description = "ID Of attached volume"
  value       = aws_ebs_volume.ebs_volume.id
}