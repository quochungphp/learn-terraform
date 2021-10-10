terraform {
  backend "s3" {
    bucket  = "terraform-backend-template"
    key     = "dev/terraform.tfstate"
    region  = "us-east-1"
    profile = ""
  }
}
