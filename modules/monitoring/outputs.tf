output "sns_topic_arn" {
  description = "SNSトピックARN"
  value       = aws_sns_topic.alert.arn
}
