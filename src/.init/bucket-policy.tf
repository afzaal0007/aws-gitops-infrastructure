resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  policy = data.aws_iam_policy_document.allow_read_only_access.json
}

data "aws_iam_policy_document" "allow_read_only_access" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["772149515781"]
    }

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
    ]

    resources = [
      aws_s3_bucket.terraform_state_bucket.arn,
      "${aws_s3_bucket.terraform_state_bucket.arn}/*",
    ]
  }
}
