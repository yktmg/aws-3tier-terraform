variable "name_prefix" {
  description = "リソース命名に使用するプレフィックス"
  type        = string
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
