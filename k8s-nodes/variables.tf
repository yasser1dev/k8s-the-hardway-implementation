variable aws_instance_name {
  type        = string
}

variable aws_instance_tags {
  type        = map(any)
  default     = {}
}

variable aws_instance_key_name {
  type        = string
  default     = ""
}

variable aws_instance_public_key {
  type        = string
  default     = ""
}

variable aws_instance_ami {
  type        = string
}

variable aws_instance_type {
  type        = string
}

variable aws_instance_profile_name {
  type        = string
  default     = ""
}

variable aws_instance_security_groups_ids {
  type        = list(string)
  default     = []
}

variable aws_instance_subnet_id {
  type        = string
}

variable private_ip {
   type        = string
}

variable user_data  {
  type        = string
  default     = ""
}

variable attach_elastic_ip {
  type        = bool
  default     = false
}










