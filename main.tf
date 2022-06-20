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

module "k8s-nodes-cp1"{
  source = "./k8s-nodes"
  aws_instance_name = "controller-1"
  aws_instance_ami = var.aws_instance_ami 
  aws_instance_type    =  var.aws_instance_type
  aws_instance_security_groups_ids  = ["${module.k8s_vpc_config.sg_id}"] 
  aws_instance_subnet_id  = "${module.k8s_vpc_config.subnet_id}"
  private_ip = "10.0.1.11"
  user_data = "name=controller-1"
  aws_instance_key_name = var.aws_instance_key_name
  aws_instance_public_key  = var.aws_instance_public_key
  aws_instance_tags = {
    "Name" : "controller-1"
  } 
}

module "ebs-volume" {
  source = "./aws_volume_attachment"
  instance_id = "${module.k8s-nodes-cp1.instance_id}"
  availability_zone = var.availability_zone
  device_name = var.device_name
  size = var.size
  ebs_volume_name = "ebs-cp-1"
  ebs_type = var.ebs_type
  tags = var.tags
}