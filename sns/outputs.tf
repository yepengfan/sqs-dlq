output "topic_name" {
  value = aws_sns_topic.topic.display_name
}

output "topic_arn" {
  value = aws_sns_topic.topic.arn
}
