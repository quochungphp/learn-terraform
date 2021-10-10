#Note: all incomming should be allow and config through aws security group

resource "aws_security_group" "allow-ssh" {
  vpc_id      = aws_vpc.main.id # This VPC ID allows ssh
  name        = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"

  # Outgoing
  egress {
    from_port   = 0    # 0 => allow from begin all ips
    to_port     = 0    # 0 => allow to begin all ips
    protocol    = "-1" # -1 => allow all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Incomming
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-ssh"
  }
}
