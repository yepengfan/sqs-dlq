resource "aws_kms_key" "this" {}
data "aws_caller_identity" "current" {}

module "message_queue" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "3.3.0"

  kms_master_key_id = aws_kms_key.this.id
  name              = "${var.queue_name}"

  redrive_policy = jsonencode({
    deadLetterTargetArn = module.message_dlq.sqs_queue_arn
    maxReceiveCount     = var.max_receive_count
  })
}

module "message_dlq" {
  source = "terraform-aws-modules/sqs/aws"
  version = "3.3.0"

  kms_master_key_id = aws_kms_key.this.id
  name = "${var.dlq_name}"
}

resource "aws_sqs_queue_policy" "message_queue_policy" {
  queue_url = module.message_queue.sqs_queue_id

  policy = <<EOF
  {
    "Version": "2008-10-17",
    "Id": " policy",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        "Action": [
          "SQS:SendMessage",
          "SQS:ReceiveMessage"
        ],
        "Resource": "${module.message_queue.sqs_queue_arn}"
      }
    ]
  }
  EOF
}