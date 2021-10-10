variable "env" {}
variable "vpc_id" {}
variable "public_subnet_id" {}
variable "ami_id" {}
variable "instance_type" {}
variable "keypair_name" {}
variable "step_server_ip_address" {}

variable "instance_id" {
    default = "dedicated"
}
