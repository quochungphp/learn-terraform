resource "aws_db_subnet_group" "postgres-subnet" {
  name        = "postgres-subnet"
  description = "RDS subnet group"
  subnet_ids  = [aws_subnet.main-private-1.id, aws_subnet.main-private-2.id]
}

resource "aws_db_parameter_group" "postgres-parameters" {
  name        = "postgres-parameters"
  family      = "postgres12"
  description = "Postgres parameter group"

  parameter {
    name  = "autovacuum"
    value = 1
  }

  parameter {
      name  = "client_encoding"
      value = "utf8"
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage       = 20 # 100 GB of storage, gives us more IOPS than a lower number
  engine                  = "postgres"
  engine_version          = "12.8"
  instance_class          = "db.t2.micro" # use micro if you want to use the free tier
  identifier              = "postgres"
  name                    = "postgres"
  username                = "root"           # username
  password                = var.PG_PASSWORD # password
  db_subnet_group_name    = aws_db_subnet_group.postgres-subnet.name
  parameter_group_name    = aws_db_parameter_group.postgres-parameters.name
  multi_az                = true # set to true to have high availability: 2 instances synchronized with each other
  vpc_security_group_ids  = [aws_security_group.allow-ssh-postgres.id]
  storage_type            = "gp2"
  backup_retention_period = 30                                          # how long you’re going to keep your backups
  skip_final_snapshot     = true                                        # skip final snapshot when doing terraform destroy
  tags = {
    Name = "postgres-instance"
  }
  port                   = 5432
  storage_encrypted     = false
}
