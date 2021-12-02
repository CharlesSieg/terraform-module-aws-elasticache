#
# CloudWatch alarms
#

resource "aws_cloudwatch_metric_alarm" "cache_cpu" {
  alarm_actions       = var.alarm_actions
  alarm_description   = "Redis cluster CPU utilization"
  alarm_name          = "${var.environment}-cache-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  depends_on          = [aws_elasticache_cluster.main]
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ElastiCache"
  ok_actions          = var.ok_actions
  period              = 300
  statistic           = "Average"
  threshold           = var.alarm_cpu_threshold_percent

  dimensions = {
    CacheClusterId = var.cluster_id
  }
}

resource "aws_cloudwatch_metric_alarm" "cache_memory" {
  alarm_actions       = var.alarm_actions
  alarm_description   = "Average memory usage over last 5 minutes higher than ${var.alarm_memory_threshold_percentage}"
  alarm_name          = "${var.environment}-cache-memory-usage"
  comparison_operator = "GreaterThanThreshold"
  depends_on          = [aws_elasticache_cluster.main]
  evaluation_periods  = 1
  metric_name         = "DatabaseMemoryUsagePercentage"
  namespace           = "AWS/ElastiCache"
  ok_actions          = var.ok_actions
  period              = 300
  statistic           = "Average"
  threshold           = var.alarm_memory_threshold_percentage

  dimensions = {
    CacheClusterId = var.cluster_id
  }
}
