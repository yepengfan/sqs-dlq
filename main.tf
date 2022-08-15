module "queue" {
  source = "./sqs"

  queue_name = var.queue_name
  dlq_name = var.dlq_name
  max_receive_count = var.max_receive_count
}

module "alarm_topic" {
  source = "./sns"

  topic_name = var.topic_name
}

module "queue_alarm" {
  source = "./cloudwatch"

  queue_name = module.queue.sqs_dlq_name
  topic_arn  = module.alarm_topic.topic_arn
  alarm_name = var.alarm_name
  alarm_threshold = var.alarm_threshold
  comparison_operator = var.comparison_operator
  evaluation_periods = var.evaluation_periods
  metric_name = var.metric_name
  period = var.period
  statistic = var.statistic
  alarm_description = var.alarm_description
}