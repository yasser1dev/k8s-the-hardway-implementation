locals {
  default_tags = {
    Name = "${var.ebs_volume_name}"
    managed = "terraform"
  }
  ebs_tags = merge(local.default_tags, var.tags)
}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.availability_zone
  size              = var.size
  type = var.ebs_type
  tags = local.ebs_tags
}


resource "aws_volume_attachment" "ebs_att" {
  depends_on  = [aws_ebs_volume.ebs_volume]
  device_name = var.device_name
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = var.instance_id
}
