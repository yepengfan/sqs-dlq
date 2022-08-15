variable "queue_name" {
  type = string
}

variable "alarm_name" {
  type = string
}

variable "alarm_threshold" {
  type = string
}

variable "comparison_operator" {
  type = string
  default = "GreaterThanOrEqualToThreshold"
}

variable "evaluation_periods" {
  type = string
  default = "1"
}

variable "metric_name" {
  type = string
  default = "ApproximateNumberOfMessagesVisible"
}

variable "period" {
  type = string
  default = "300"
}

variable "statistic" {
  type = string
  default = "Average"
}

variable "alarm_description" {
  type = string
  default = "This metric monitors message dlq messages count"
}

variable "topic_name" {
  type = string
}

variable "dlq_name" {
  type = string
}

variable "max_receive_count" {
  type = number
  default = 3
}