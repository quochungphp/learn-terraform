# Using ssh login into ec2
resource "aws_key_pair" "ec2login" {
  key_name   = "ec2login"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
  tags = {
    "Name" = "key-pair-login-ec2"
  }
}
