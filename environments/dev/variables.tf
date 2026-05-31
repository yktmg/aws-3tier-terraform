variable "aws_region" {
  description = "AWSリージョン"
  type        = string
  default     = "ap-northeast-1"
}

variable "project" {
  description = "プロジェクト名（リソース命名に使用）"
  type        = string
  default     = "3tier"
}

variable "env" {
  description = "環境名"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "VPC CIDRブロック"
  type        = string
}

variable "availability_zones" {
  description = "使用するAZリスト"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "パブリックサブネットのCIDRリスト"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "プライベートサブネットのCIDRリスト"
  type        = list(string)
}

variable "db_subnet_cidrs" {
  description = "DBサブネットのCIDRリスト"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2インスタンスタイプ"
  type        = string
}

variable "ami_id" {
  description = "EC2 AMI ID"
  type        = string
}

variable "db_instance_class" {
  description = "RDSインスタンスクラス"
  type        = string
}

variable "db_name" {
  description = "データベース名"
  type        = string
}

variable "db_username" {
  description = "DBマスターユーザー名"
  type        = string
}

variable "db_password" {
  description = "DBマスターパスワード"
  type        = string
  sensitive   = true
}

variable "alert_email" {
  description = "SNSアラート通知先メールアドレス"
  type        = string
}
