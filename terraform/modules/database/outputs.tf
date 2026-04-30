output "db_instance_id" {
  value       = aws_db_instance.this.id
  description = "The RDS instance identifier"
}

output "db_instance_arn" {
  value       = aws_db_instance.this.arn
  description = "The ARN of the RDS instance"
}

output "db_instance_endpoint" {
  value       = aws_db_instance.this.endpoint
  description = "The connection endpoint (hostname:port)"
}

output "db_instance_address" {
  value       = aws_db_instance.this.address
  description = "The hostname of the RDS instance"
}

output "db_instance_port" {
  value       = aws_db_instance.this.port
  description = "The database port"
}

output "postgres_db" {
  value       = aws_db_instance.this.db_name
  description = "The database name"
}

output "postgres_user" {
  value       = aws_db_instance.this.username
  description = "The master username"
}

output "security_group_id" {
  value       = aws_security_group.rds.id
  description = "The security group ID for the RDS instance"
}

output "db_subnet_group_name" {
  value       = aws_db_subnet_group.this.name
  description = "The name of the DB subnet group"
}
