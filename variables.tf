variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}
 variable "region" {}
 variable "key_name" {}
  variable "webserver_instance_type" {}
  variable "appserver_instance_type" {}
  variable "dbserver_instance_type" {}

variable "web_ami" {
  default = ""
}

variable "app_ami" {
  default = ""
}


variable "db_ami" {
  default = ""
}


variable "public_subnet_id" {
  default = ""
}

variable "private_subnet_id" {
  default = ""
}

variable "db_subnet_id" {
  default = ""
}

variable "db_security_group_ids" {
  default = ""
}

variable "web_security_group_ids" {
  default = ""
}

variable "app_security_group_ids" {
  default = ""
}
variable "env_name" {
  default = ""
}
