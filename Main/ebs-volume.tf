# Amazon EBS volume is a durable, block-level storage device that you can attach to your instances
# https://aws.amazon.com/ec2/instance-types/
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-1a"
  size              = 20 # stoage
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}
# Attach configure into instance
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name  = var.INSTANCE_DEVICE_NAME
  volume_id    = aws_ebs_volume.ebs-volume-1.id
  instance_id  = aws_instance.ec2-backend-api.id
  skip_destroy = true # skip destroy to avoid issues with terraform destroy
}
