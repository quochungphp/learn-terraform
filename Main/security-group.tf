
# data sources
# provide filter traffic based on an AWS region
data "aws_ip_ranges" "eu_ec2" {
  # allow region , can see in inbound rules
  regions  = ["eu-east-1", "eu-central-1"]
  services = ["ec2"]
}
# data source allows all traffic from amazon intances in Europe
resource "aws_security_group" "from_europe" {
  name = "from_europe"
  # allow inbound traffic
  ingress { # it's mean is "Incomming"
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = data.aws_ip_ranges.eu_ec2.cidr_blocks
  }
  # sync info in aws console security group > tags tab
  tags = {
    CreateDate = data.aws_ip_ranges.eu_ec2.create_date
    SyncToken  = data.aws_ip_ranges.eu_ec2.sync_token
    "Name" = "allow-all-traffic-europe"
  }
}
