resource "aws_internet_gateway" "main" {

  vpc_id = aws_vpc.main.id

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name         = "${local.resource_name_prefix}-igw"
    Environment  = var.project_info[0]
    Client       = var.project_info[2]
    ResourceType = "IGW"
    Developer    = var.project_info[1]
  }

}