variable "name_prefix" {
  description = "リソース命名に使用するプレフィックス"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "db_subnet_ids" {
  description = "DBサブネットIDリスト"
  type        = list(string)
}

variable "ec2_security_group_id" {
  description = "EC2のセキュリティグループID"
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
