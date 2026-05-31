# aws-3tier-terraform

AWS上に3層アーキテクチャ（VPC + ALB + EC2 + RDS）をTerraformで構築するポートフォリオです。

## Architecture

- **Network**: VPC / Public・Private・DB Subnet / IGW / NAT Gateway
- **Web tier**: Application Load Balancer
- **App tier**: EC2 (Auto Scaling)
- **DB tier**: RDS MySQL (Multi-AZ)
- **Monitoring**: CloudWatch Alarms + SNS通知

## Structure

    environments/
      dev/   # 開発環境
      prod/  # 本番環境
    modules/
      vpc/
      alb/
      ec2/
      rds/
      monitoring/

## Usage

    cd environments/dev
    terraform init
    terraform plan
    terraform apply
