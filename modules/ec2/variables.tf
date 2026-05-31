variable "name_prefix" {
  description = "リソース命名に使用するプレフィックス"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "EC2を配置するプライベートサブネットIDリスト"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "ALBのセキュリティグループID"
  type        = string
}

variable "target_group_arn" {
  description = "ALBターゲットグループARN"
  type        = string
}

variable "instance_type" {
  description = "EC2インスタンスタイプ"
  type        = string
}

variable "ami_id" {
  description = "EC2 AMI ID"
  type        = string
}
