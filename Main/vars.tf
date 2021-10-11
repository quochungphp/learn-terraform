variable "AWS_REGION" {
  default = "us-east-1"
}

variable "zones" {
  default = ""
}

variable "dev" {
  default = "dev"
}

variable "prod" {
  default = "prod"
}

variable "staging" {
  default = "staging"
}

# ref value from terraform.tfvars
variable "AWS_ACCESS_KEY" {}

# ref value from terraform.tfvars
variable "AWS_SECRET_KEY" {}



variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-03c53cb2507dda8ae"
    us-east-2 = "ami-0d19dedca87835a9b"
  }
}
# Using for ssh
variable "PATH_TO_PRIVATE_KEY" {
  default = "ec2login"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "ec2login.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdb"
}

variable "PG_PASSWORD" {}
