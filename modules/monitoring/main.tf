# SNSトピック
resource "aws_sns_topic" "alert" {
  name = "${var.name_prefix}-alert"

  tags = {
    Name = "${var.name_prefix}-alert"
  }
}

# SNSサブスクリプション（メール通知）
resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alert.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

# -----------------------------------------------
# ALBアラーム
# -----------------------------------------------

# ALB 5xxエラー率
resource "aws_cloudwatch_metric_alarm" "alb_5xx" {
  alarm_name          = "${var.name_prefix}-alb-5xx"
  alarm_description   = "ALB 5xxエラー率が高騰"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "HTTPCode_ELB_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Sum"
  threshold           = 10
  treat_missing_data  = "notBreaching"

  dimensions = {
    LoadBalancer = var.alb_arn_suffix
  }

  alarm_actions = [aws_sns_topic.alert.arn]
  ok_actions    = [aws_sns_topic.alert.arn]

  tags = {
    Name = "${var.name_prefix}-alb-5xx"
  }
}

# ALB 4xxエラー率
resource "aws_cloudwatch_metric_alarm" "alb_4xx" {
  alarm_name          = "${var.name_prefix}-alb-4xx"
  alarm_description   = "ALB 4xxエラー率が高騰"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "HTTPCode_ELB_4XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Sum"
  threshold           = 50
  treat_missing_data  = "notBreaching"

  dimensions = {
    LoadBalancer = var.alb_arn_suffix
  }

  alarm_actions = [aws_sns_topic.alert.arn]
  ok_actions    = [aws_sns_topic.alert.arn]

  tags = {
    Name = "${var.name_prefix}-alb-4xx"
  }
}

# ALBターゲット異常ホスト数
resource "aws_cloudwatch_metric_alarm" "alb_unhealthy_hosts" {
  alarm_name          = "${var.name_prefix}-alb-unhealthy-hosts"
  alarm_description   = "ALBの異常ホストが検出された"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Maximum"
  threshold           = 0
  treat_missing_data  = "notBreaching"

  dimensions = {
    LoadBalancer = var.alb_arn_suffix
    TargetGroup  = var.target_group_arn_suffix
  }

  alarm_actions = [aws_sns_topic.alert.arn]
  ok_actions    = [aws_sns_topic.alert.arn]

  tags = {
    Name = "${var.name_prefix}-alb-unhealthy-hosts"
  }
}

# -----------------------------------------------
# EC2アラーム（Auto Scalingグループ単位）
# -----------------------------------------------

# EC2 CPU使用率
resource "aws_cloudwatch_metric_alarm" "ec2_cpu" {
  alarm_name          = "${var.name_prefix}-ec2-cpu"
  alarm_description   = "EC2 CPU使用率が高騰"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  treat_missing_data  = "notBreaching"

  dimensions = {
    AutoScalingGroupName = var.ec2_instance_ids
  }

  alarm_actions = [aws_sns_topic.alert.arn]
  ok_actions    = [aws_sns_topic.alert.arn]

  tags = {
    Name = "${var.name_prefix}-ec2-cpu"
  }
}

# -----------------------------------------------
# RDSアラーム
# -----------------------------------------------

# RDS CPU使用率
resource "aws_cloudwatch_metric_alarm" "rds_cpu" {
  alarm_name          = "${var.name_prefix}-rds-cpu"
  alarm_description   = "RDS CPU使用率が高騰"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  treat_missing_data  = "notBreaching"

  dimensions = {
    DBInstanceIdentifier = var.rds_identifier
  }

  alarm_actions = [aws_sns_topic.alert.arn]
  ok_actions    = [aws_sns_topic.alert.arn]

  tags = {
    Name = "${var.name_prefix}-rds-cpu"
  }
}

# RDS DB接続数
resource "aws_cloudwatch_metric_alarm" "rds_connections" {
  alarm_name          = "${var.name_prefix}-rds-connections"
  alarm_description   = "RDS接続数が上限に近づいている"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  treat_missing_data  = "notBreaching"

  dimensions = {
    DBInstanceIdentifier = var.rds_identifier
  }

  alarm_actions = [aws_sns_topic.alert.arn]
  ok_actions    = [aws_sns_topic.alert.arn]

  tags = {
    Name = "${var.name_prefix}-rds-connections"
  }
}

# RDSフリーストレージ
resource "aws_cloudwatch_metric_alarm" "rds_storage" {
  alarm_name          = "${var.name_prefix}-rds-storage"
  alarm_description   = "RDSの空きストレージが残り少ない"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 5368709120 # 5GB（バイト単位）
  treat_missing_data  = "notBreaching"

  dimensions = {
    DBInstanceIdentifier = var.rds_identifier
  }

  alarm_actions = [aws_sns_topic.alert.arn]
  ok_actions    = [aws_sns_topic.alert.arn]

  tags = {
    Name = "${var.name_prefix}-rds-storage"
  }
}
