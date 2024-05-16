resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket        = "${var.env}-${var.project}-theitoffshore-iac-state"
  force_destroy = true

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name         = "${local.resource_name_prefix}-terraform-state-bucket"
    Environment  = var.project_info[0]
    Client       = var.project_info[2]
    ResourceType = "S3 Bucket"

    Developer = var.project_info[1]
  }

}









