variable "implementation_name" { }
variable "public_key" { }
variable "region" { }
variable "app_instance_type" {
  default = "t2.medium"
}

variable "auth_instance_type" {
  default = "t2.medium"
}

variable "db_instance_type" {
  default = "t2.medium"
}

variable "sunbird_environment" {  }