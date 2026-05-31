output "ec2_security_group_id" {
  description = "EC2のセキュリティグループID"
  value       = aws_security_group.ec2.id
}

output "instance_ids" {
  description = "EC2インスタンスIDリスト"
  value       = aws_autoscaling_group.main.id
}
