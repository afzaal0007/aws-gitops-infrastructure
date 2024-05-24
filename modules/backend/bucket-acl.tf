resource "aws_s3_bucket_acl" "terraform_state_bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.terraform_state_bucket]

  bucket = aws_s3_bucket.terraform_state_bucket.id
  acl    = "private"
}
