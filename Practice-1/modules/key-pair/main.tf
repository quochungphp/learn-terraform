resource "aws_key_pair" "key" {
    key_name = "AWS-KEY-PAIR-SSH-${var.env}"
    public_key = var.publickey
}
