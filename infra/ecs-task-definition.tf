resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_exec_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_task_definition" "medusa_task" {
  family                   = "medusa-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "medusa"
      image     = "yogismash/medusa:latest"
      essential = true
      portMappings = [
        {
          containerPort = 9000
          hostPort      = 9000
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/medusa"
          awslogs-region        = "ap-south-1"
          awslogs-stream-prefix = "ecs"
        }
      }
      environment = [
        {
          name = "DATABASE_URL"
          # value = "postgres://postgres:medusapass123@medusa-postgres-db.c5ye68gcoyiv.ap-south-1.rds.amazonaws.com:5432/medusadb"
          value = "postgres://postgres:medusapass123@medusa-postgres-db.c5ye68gcoyiv.ap-south-1.rds.amazonaws.com:5432/medusadb"

        }
      ]
    }
  ])

}
