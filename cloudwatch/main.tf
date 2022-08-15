resource "aws_cloudwatch_metric_alarm" "dlq_alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = "AWS/SQS"
  period              = var.period
  statistic           = var.statistic
  threshold           = var.alarm_threshold
  alarm_description   = var.alarm_description
  dimensions = {
    "QueueName" = var.queue_name,
  }
  actions_enabled = true
  alarm_actions = [
    var.topic_arn
  ]
  insufficient_data_actions = []
}