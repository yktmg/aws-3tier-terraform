output "db_endpoint" {
  description = "RDSエンドポイント"
  value       = aws_db_instance.main.endpoint
  sensitive   = true
}

output "db_identifier" {
  description = "RDS識別子（CloudWatch用）"
  value       = aws_db_instance.main.identifier
}
