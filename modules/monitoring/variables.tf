variable "name_prefix" {
  description = "リソース命名に使用するプレフィックス"
  type        = string
}

variable "alert_email" {
  description = "SNSアラート通知先メールアドレス"
  type        = string
}

variable "alb_arn_suffix" {
  description = "ALBのARNサフィックス（CloudWatch用）"
  type        = string
}

variable "target_group_arn_suffix" {
  description = "ターゲットグループのARNサフィックス（CloudWatch用）"
  type        = string
}

variable "ec2_instance_ids" {
  description = "監視対象EC2のAuto ScalingグループID"
  type        = string
}

variable "rds_identifier" {
  description = "監視対象RDSの識別子"
  type        = string
}
