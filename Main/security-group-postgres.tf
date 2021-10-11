
# Allow access to RDS by ssh
resource "aws_security_group" "allow-ssh-postgres" {
  vpc_id      = aws_vpc.main.id
  name        = "allow-ssh-postgres"
  description = "allow-ssh-postgres"
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.allow-ssh.id] # allowing access from our instance, ref to ssh
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }
  tags = {
    Name = "allow-ssh-postgres"
  }
}
