# backend block can not ref variables
# need run `terraform init` before apply
terraform {
  backend "s3" {
    bucket = "terraform-backend-template"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}
