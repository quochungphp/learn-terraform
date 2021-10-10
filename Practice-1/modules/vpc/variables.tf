variable "env" {}

variable "dedicated" {
    default = "dedicated"
}

variable "vpc_cidr" {
    description = "VPC"
    default = "10.0.0.0/16"
}
variable "subnet_public_cidr" {
    description = "VPC"
    default = "10.0.0.0/24"
}

variable "subnet_private_cidr" {
  description = "CIDR for the private subnet"
  default     = "10.0.2.0/24"
}
variable "vpc_id" {
    default = "dedicated"
}
