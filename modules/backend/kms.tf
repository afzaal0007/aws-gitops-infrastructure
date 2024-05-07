resource "aws_kms_key" "dynamodb_backend_key" {
  description             = "KMS key for DynamoDB backend encryption"
  deletion_window_in_days = 7

  # Choose symmetric key type for DynamoDB encryption
  customer_master_key_spec = "SYMMETRIC_DEFAULT"

  # Disable automatic key rotation to avoid exceeding free tier limits
  enable_key_rotation = false

  depends_on = [aws_s3_bucket.terraform_state_bucket]

}