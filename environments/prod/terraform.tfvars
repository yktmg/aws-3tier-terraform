aws_region = "ap-northeast-1"
project    = "3tier"
env        = "prod"

# VPC（devの10.0.x.xと重複しない帯域）
vpc_cidr             = "10.1.0.0/16"
availability_zones   = ["ap-northeast-1a", "ap-northeast-1c"]
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs = ["10.1.11.0/24", "10.1.12.0/24"]
db_subnet_cidrs      = ["10.1.21.0/24", "10.1.22.0/24"]

# EC2
instance_type = "t3.small"
ami_id        = "ami-0c3fd0f5d33134a76"

# RDS
db_instance_class = "db.t3.small"
db_name           = "appdb"
db_username       = "admin"
db_password       = "CHANGE_ME_BEFORE_APPLY"

# Monitoring
alert_email = "your-email@example.com"
