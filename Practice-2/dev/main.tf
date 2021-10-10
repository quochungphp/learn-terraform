

#VPC
module "vpc" {
  source      = "../_modules/vpc"
}

module "backend" {
  source      = "backend"
}

resource "aws_instance" "ec2" {

}
