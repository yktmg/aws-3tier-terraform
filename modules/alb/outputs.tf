output "alb_dns_name" {
  description = "ALBのDNS名"
  value       = aws_lb.main.dns_name
}

output "alb_security_group_id" {
  description = "ALBのセキュリティグループID"
  value       = aws_security_group.alb.id
}

output "target_group_arn" {
  description = "ターゲットグループARN"
  value       = aws_lb_target_group.main.arn
}

output "alb_arn_suffix" {
  description = "CloudWatch用ALB ARNサフィックス"
  value       = aws_lb.main.arn_suffix
}

output "target_group_arn_suffix" {
  description = "CloudWatch用ターゲットグループARNサフィックス"
  value       = aws_lb_target_group.main.arn_suffix
}
