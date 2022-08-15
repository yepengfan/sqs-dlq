output "sqs_queue_arn" {
  value = module.message_queue.sqs_queue_arn
}

output "sqs_queue_id" {
  value = module.message_queue.sqs_queue_id
}

output "sqs_queue_name" {
  value = module.message_queue.sqs_queue_name
}

output "sqs_dlq_arn" {
  value = module.message_dlq.sqs_queue_arn
}

output "sqs_dlq_id" {
  value = module.message_dlq.sqs_queue_id
}

output "sqs_dlq_name" {
  value = module.message_dlq.sqs_queue_name
}