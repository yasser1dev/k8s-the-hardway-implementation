variable "device_name" {
   type = string
   default =   "/dev/sdf"
}


variable "instance_id" {
   type = string
}

variable "availability_zone" {
   type = string
}

variable "size" {
   type = string
}

variable "ebs_volume_name" {
   type = string
}

variable "ebs_type" {
   type = string
   default = "gp2"
}

variable "tags" {
  type = map(any)
  default = {}
}
