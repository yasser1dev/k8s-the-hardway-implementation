variable "cidr_block" {
  type = string
}

variable "subnet_cidr_block" {
  type = string
}

variable "K8s_sg_rules" {
  type    = list(any)
  default = []
}

variable "sg_name" {
  default = "kubernetes"
}

