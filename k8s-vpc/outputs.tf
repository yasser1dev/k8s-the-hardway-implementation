output "vpc_id" {
  value = aws_vpc.k8s_vpc.id
}

output "subnet_id" {
  value = aws_subnet.k8s_vpc_subnet.id
}


output "sg_id" {
  value = aws_security_group.sg.id
}