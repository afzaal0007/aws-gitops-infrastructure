resource "aws_vpc" "main" {

  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name         = "${local.resource_name_prefix}-vpc"
    Environment  = var.project_info[0]
    Client       = var.project_info[2]
    ResourceType = "VPC"
    Developer    = var.project_info[1]
  }

}

