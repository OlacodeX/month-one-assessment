variable "region" {
  description = "AWS region"
  type        = string
}

variable "key_name" {
  description = "SSH key pair"
  type        = string
}

variable "my_ip" {
  description = "Your IP for SSH"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "public_subnet_1_cidr" { type = string }
variable "public_subnet_2_cidr" { type = string }
variable "private_subnet_1_cidr" { type = string }
variable "private_subnet_2_cidr" { type = string }

variable "bastion_instance_type" { type = string }
variable "web_instance_type" { type = string }
variable "db_instance_type" { type = string }