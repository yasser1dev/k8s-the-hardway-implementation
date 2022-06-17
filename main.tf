module "k8s_vpc_config" {
  source = "./k8s-vpc"
  cidr_block = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  K8s_sg_rules = var.security_group_rules
}

module "k8s_nlb_config" {
  source = "./k8S-nlb"
  subnet_id = module.k8s_vpc_config.subnet_id
  vpc_id = module.k8s_vpc_config.vpc_id
  target_ips = ["10.0.1.10","10.0.1.11","10.0.1.12"]
}