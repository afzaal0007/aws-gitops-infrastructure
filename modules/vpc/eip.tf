# resource "aws_eip" "main" {

#   lifecycle {
#     prevent_destroy = false
#   }

#   tags = {
#     Name         = "${local.resource_name_prefix}-eip"
#     Environment  = var.project_info[0]
#     Client       = var.project_info[2]
#     ResourceType = "EIP"
#     Developer    = var.project_info[1]
#   }

# }