resource "aws_db_subnet_group" "medusa_db_subnet" {
  name       = "medusa-db-subnet"
  subnet_ids = aws_subnet.public[*].id

  tags = {
    Name = "Medusa DB subnet group"
  }
}

resource "aws_security_group" "rds_sg" {
  name   = "rds-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "medusa_postgres" {
  identifier             = "medusa-postgres-db"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "14"
  instance_class         = "db.t3.micro"
  username               = "postgres"
  password               = "medusapass123"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.medusa_db_subnet.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible    = true
}

