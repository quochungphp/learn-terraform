provider "aws" {
    region     = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}
# Put file  to s3, and neet full access to s3
# Too learn s3 policy
terraform {
  backend "s3" {
    bucket  = "terraform-backend-s3-dev"
    key     = "v1/terraform.tfstate"
    region  = "us-east-1"
    profile = ""
  }
}
