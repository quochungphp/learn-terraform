output "aws_ec2_private_ip" {
  value = aws_instance.ec2-backend-api.private_ip
}

output "aws_ec2_public_ip" {
  value = aws_instance.ec2-backend-api.public_ip
}
# Print rds enpoint
output "rds" {
  value = aws_db_instance.postgres.endpoint
}
