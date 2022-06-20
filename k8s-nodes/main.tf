locals {
  default_tag = {
    Name = "${var.aws_instance_name}"
    managed = "terraform" 
  }
  ec2_tags = merge(local.default_tag, var.aws_instance_tags)
}

resource "aws_key_pair" "deployer" {
  count = var.aws_instance_key_name != "" ? 1 : 0
  key_name   = var.aws_instance_key_name
  public_key = var.aws_instance_public_key
}


resource "aws_instance" "aws_instance" {
  tags = local.ec2_tags
  ami                    = var.aws_instance_ami 
  instance_type          = var.aws_instance_type
  iam_instance_profile   = var.aws_instance_profile_name 
  vpc_security_group_ids = var.aws_instance_security_groups_ids
  subnet_id              = var.aws_instance_subnet_id
  associate_public_ip_address = true
  private_ip             = var.private_ip
  key_name               = var.aws_instance_key_name 
  user_data              = var.user_data   
  source_dest_check = false
}

resource "aws_eip" "aws_instancd_eip" {
  count = var.attach_elastic_ip ? 1 : 0
  instance = aws_instance.aws_instance.id
  vpc      = true
}








