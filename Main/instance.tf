resource "aws_instance" "ec2-backend-api" {
  # defined instance resource
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  tags = {
    "Name" = "ec2-backend-api"
  }
  # the public SSH key
  key_name = aws_key_pair.ec2login.key_name

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # user data
  user_data = data.template_cloudinit_config.cloudinit-config.rendered

  # ssh by provisioner which needs to add current ip into netword security group
  provisioner "file" {
    source = "script.sh"
    # copy local file to ec2
    destination = "/tmp/script.sh"
  }

  # remote to ec2 for installing
  # Note: ssh-key have not contain password, otherwise script no have permission for executing
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh", # Remove the spurious CR characters.
      "sudo /tmp/script.sh",
    ]
  }
  # tracking after completed process
  provisioner "local-exec" {
    command = "echo The server is IP address is ${self.private_ip}"
  }

  # create ec2 user for access
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}
