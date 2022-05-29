module "k8s_vpc_config" {
  source = "./k8s-vpc"
  cidr_block = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  K8s_sg_rules = var.security_group_rules
}