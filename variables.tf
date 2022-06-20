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

variable "aws_instance_ami" {
  type        = string
  default     = "ami-0905a1bd36fefbc75"
}

variable aws_instance_type {
  type        = string
  default     = "t3.micro"
}

variable aws_instance_key_name {
  type        = string
  default     = "kubernetes"
}

variable aws_instance_public_key {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/5xRclmdC08MGDnX9WkV0f6aPw3xB9XwN15bNTrCAXNyA4M1CqeVJv/QPBBW7LMuJgdcBceVxOR5u/xWLAvq5mZZmWlHxKFHex6zCc6yuIuSGqKUnwKUtuCWuOJX+9tH2J5rarbh+j1Lk4Tw4o+Z+dQXbBX8CQmAjXgP3Qo8Pw/jq157SioIVfWXO/rfQ6SdVZpgTkDZETNAi1/RMsgzC/TGCv0JLESP9Z8mYvRVKs8Mp1Dx3bEF2/G6tEjgFQWwsAOLrXcAg27YfzVAD+5FSBEDjoSt3YUiVrDM2yFiQJc0pKt847d8kREmOz+MT5ffV3tV/Yy3lNHbysUEnTIpXzU+w2lFrkb2yTBgfabeXVErs+q7y8pISXE6BPW96D09+gbZTR0eHixU2UqMgfUq9NCCt7btUzpXd9Q+9VEcgIAV7zGrZv0eL1LUrVhMWXIhcoKyjF/KCVcz6bWrevkhbauirjC5u2M2khQlpf4XMVtHk/i0snuFD692cilLQLU0= home@Yassers-MacBook-Pro.local"
}

variable "device_name" {
   type = string
   default =   "/dev/sdf"
}

variable "availability_zone" {
   type = string
   default = "eu-west-1a"
}

variable "size" {
   type = string
   default = "50"
}

variable "ebs_type" {
   type = string
   default = "gp2"
}

variable "tags" {
  type = map(any)
  default = {
    "platform" : "kubernetes"
  }
}






