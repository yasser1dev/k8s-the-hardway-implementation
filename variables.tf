variable "aws_region" {
  default = "eu-west-1"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "security_group_rules" {
  default = [
    {
        "from_port": 22,
        "to_port": 22,
        "protocol": "tcp",
        "cidr_blocks": ["0.0.0.0/0"],
    },
    {
        "from_port": 443,
        "to_port": 443,
        "protocol": "tcp",
        "cidr_blocks": ["0.0.0.0/0"],
    },
    {
        "from_port": 6443,
        "to_port": 6443,
        "protocol": "tcp",
        "cidr_blocks": ["0.0.0.0/0"],
    },
    {
        "from_port": 0,
        "to_port": 0,
        "protocol": -1,
        "cidr_blocks": ["10.0.0.0/16"],
    },
    {
        "from_port": 0,
        "to_port": 0,
        "protocol": -1,
        "cidr_blocks": ["10.200.0.0/16"],
    },
    {
        "from_port": -1,
        "to_port": -1,
        "protocol": "icmp",
        "cidr_blocks": ["0.0.0.0/0"],
    },
    
  ]
}

