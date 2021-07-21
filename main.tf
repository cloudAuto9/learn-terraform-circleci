provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

  backend "s3" {
    bucket = "circle-ci-backend-20210721111750722900000001"
    key    = "terraform/ap4/terraform.tfstate"
    region = "us-east-1"
}

 module "web-server" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.19.0"
  name                   = "${var.env_name}-web-server"
  instance_count         = 1
  ami                    = var.web_ami
  instance_type          = var.webserver_instance_type
  key_name               = var.key_name
  monitoring             = false
  associate_public_ip_address = true
  vpc_security_group_ids = [var.web_security_group_ids]
  subnet_id              = var.public_subnet_id
  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 30
    },
  ]
 tags = {
    Env = var.env_name
  }
}
####################
 module "app-server" {
    source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.19.0"
  name                   = "${var.env_name}-app-server"
  instance_count         = 1
  ami                    = var.app_ami
  instance_type          = var.appserver_instance_type
  key_name               = var.key_name
  monitoring             = false
  vpc_security_group_ids = [var.app_security_group_ids]
  subnet_id              = var.private_subnet_id
  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 30
    },
  ]
  tags = {
    Env = var.env_name
  }
}

module "db-server" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.19.0"
  name                   = "${var.env_name}-db-server"
  instance_count         = 1
  ami                    = var.db_ami
  instance_type          = var.dbserver_instance_type
  key_name               = var.key_name
  monitoring             = false
  vpc_security_group_ids = [var.db_security_group_ids]
  subnet_id              = var.db_subnet_id
  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 30
    },
  ]
 tags = {
    Env = var.env_name
  }
}
