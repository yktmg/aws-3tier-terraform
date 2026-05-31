output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "パブリックサブネットIDリスト"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "プライベートサブネットIDリスト"
  value       = aws_subnet.private[*].id
}

output "db_subnet_ids" {
  description = "DBサブネットIDリスト"
  value       = aws_subnet.db[*].id
}
