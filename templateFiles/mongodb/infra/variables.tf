variable "project" {
  type = string
}

variable "name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_block" {
  type = number
}

variable "ec2_instance_type" {
  type = string
}

variable "storage" {
  type = number
}

variable "ssh_public_key_path" {
  type = string
}
