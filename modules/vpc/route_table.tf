// rt-public Subnet
resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.public_route_table_cidr_block
    gateway_id = aws_internet_gateway.main.id
  }

  lifecycle {
    prevent_destroy = false
    ignore_changes  = [route]
  }

  tags = {
    Name         = "${local.resource_name_prefix}-public-rt"
    Environment  = var.project_info[0]
    Client       = var.project_info[2]
    ResourceType = "RT"
    Developer    = var.project_info[1]
  }

}

resource "aws_route_table_association" "rt-public-asso" {
  for_each       = var.public_subnets
  route_table_id = aws_route_table.rt-public.id
  subnet_id      = aws_subnet.public[each.key].id
}

resource "aws_route" "igw" {
  route_table_id         = aws_route_table.rt-public.id
  destination_cidr_block = var.public_route_table_cidr_block
  gateway_id             = aws_internet_gateway.main.id
}

// rt-private Subnet

resource "aws_route_table" "rt-private" {
  vpc_id = aws_vpc.main.id

  lifecycle {
    prevent_destroy = false
    ignore_changes  = [route]
  }

  tags = {
    Name         = "${local.resource_name_prefix}-private-rt"
    Environment  = var.project_info[0]
    Client       = var.project_info[2]
    ResourceType = "RT"
    Developer    = var.project_info[1]
  }

}

resource "aws_route_table_association" "rt-private-asso" {
  for_each       = var.private_subnets
  route_table_id = aws_route_table.rt-private.id
  subnet_id      = aws_subnet.private[each.key].id
}


# route to nat gateway
# resource "aws_route" "nat_gw" {
#   route_table_id         = aws_route_table.rt-private.id
#   destination_cidr_block = var.private_route_table_cidr_block
#   nat_gateway_id         = aws_nat_gateway.main.id
# }
