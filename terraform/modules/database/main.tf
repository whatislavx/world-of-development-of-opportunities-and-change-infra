resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.name}-subnet-group"
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.name}-sg"
  description = "Security group for RDS instance ${var.name}"
  vpc_id      = var.vpc_id

  ingress {
    description     = "PostgreSQL from EC2"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.ec2_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-sg"
  }
}

resource "aws_db_instance" "this" {
  identifier = var.name

  engine         = "postgres"
  engine_version = var.engine_version
  instance_class = var.instance_class

  allocated_storage = var.storage
  storage_encrypted = true
  storage_type      = "gp3"

  db_name  = var.db_name
  username = var.username
  password = var.password

  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.this.name

  publicly_accessible = var.publicly_accessible

  skip_final_snapshot = var.skip_final_snapshot
  multi_az            = var.multi_az
  deletion_protection = var.deletion_protection

  backup_retention_period = var.backup_retention_period

  tags = {
    Name = var.name
  }
}
