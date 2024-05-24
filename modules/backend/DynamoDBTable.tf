resource "aws_dynamodb_table" "terraform-state-lock" {
  name           = "${var.env}-${var.project}-iac-state"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  depends_on = [aws_kms_key.dynamodb_backend_key]
}


