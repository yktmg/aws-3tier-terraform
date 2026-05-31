variable "name_prefix" {
  description = "リソース命名に使用するプレフィックス"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "ALBを配置するパブリックサブネットIDリスト"
  type        = list(string)
}
