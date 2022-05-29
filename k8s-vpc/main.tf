resource "aws_vpc" "k8s_vpc" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "kubernetes-vpc"
    "Managed" = "terraform"
  }
}

resource "aws_subnet" "k8s_vpc_subnet" {
  cidr_block = var.subnet_cidr_block
  vpc_id = aws_vpc.k8s_vpc.id
  tags = {
    Name = "kubernetes"
    Managed = "terraform"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.k8s_vpc.id
  tags = {
    Name = "kubernetes"
    Managed = "terraform"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.k8s_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "kubernetes"
    Managed = "terraform"
  }
}

resource "aws_route_table_association" "rt_association" {
  subnet_id      = aws_subnet.k8s_vpc_subnet.id
  route_table_id = aws_route_table.route_table.id
}


resource "aws_security_group" "sg" {
  name = var.sg_name
  description = var.sg_name
  vpc_id = aws_vpc.k8s_vpc.id

  dynamic "ingress" {
    for_each = var.K8s_sg_rules
    content {
      protocol = ingress.value["protocol"]
      from_port = ingress.value["from_port"]
      to_port = ingress.value["to_port"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "kubernetes"
    Managed = "terraform"
    }
}

