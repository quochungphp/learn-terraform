#WEB Public

resource "aws_instance" "main" {
  subnet_id  = var.public_subnet_id
  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  key_name = var.keypair_name
  tags = {
    Name = "${var.env}-WEB"
  }

  root_block_device  {
    volume_type = "gp2"
    volume_size = "50"
  }

  lifecycle  {
    ignore_changes = [ root_block_device ]
  }

  instance_type = var.instance_type
  ami = var.ami_id
  associate_public_ip_address = true
}

# eip
resource "aws_eip" "eip" {
  vpc   = true
  instance = aws_instance.main.id
  tags  ={
    name = "${var.env}-NAT-EIP"
  }
}

#Security Group
resource "aws_security_group" "web" {
    name = "WEB-SECURITY-GROUP"
    description = "WEB-SECURITY-GROUP"
    vpc_id = var.vpc_id
    tags = {
        Name = "${var.env}-WEB-SECURITY-GROUP"
    }
}

resource "aws_security_group_rule" "web_egress_all" {
    security_group_id = aws_security_group.web.id
    type = "egress"
    protocol = "-1"
    from_port = 0
    to_port = 65535
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "web_ingress_22" {
    security_group_id = aws_security_group.web.id
    type = "ingress"
    description = "SSH Remote"
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [
      var.step_server_ip_address,
    ]

}

resource "aws_security_group_rule" "web_ingress_80" {
    security_group_id = aws_security_group.web.id
    type = "ingress"
    description = "Web HTTP"
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = [
      var.step_server_ip_address,
    ]
}

resource "aws_security_group_rule" "web_ingress_443" {
    security_group_id = aws_security_group.web.id
    type = "ingress"
    description = "Web HTTPS"
    protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr_blocks = [
      var.step_server_ip_address,
    ]
}

resource "aws_security_group_rule" "web_ingress_3306" {
    security_group_id = aws_security_group.web.id
    type = "ingress"
    description = "Web HTTP"
    protocol = "tcp"
    from_port = 3306
    to_port = 3306
    cidr_blocks = [
        var.step_server_ip_address,
    ]
}
