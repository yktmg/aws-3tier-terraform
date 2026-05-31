output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "alb_dns_name" {
  description = "ALBのDNS名（動作確認用）"
  value       = module.alb.alb_dns_name
}

output "rds_endpoint" {
  description = "RDSエンドポイント"
  value       = module.rds.db_endpoint
  sensitive   = true
}

output "ec2_instance_ids" {
  description = "EC2インスタンスIDリスト"
  value       = module.ec2.instance_ids
}
