locals {
  environment = var.project_info[0]
  client      = var.project_info[2]
}

resource "aws_flow_log" "this" {
  count           = local.environment == "prod" ? 1 : 0
  iam_role_arn    = aws_iam_role.this[0].arn
  log_destination = aws_cloudwatch_log_group.this[0].arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.main.id
}


resource "aws_cloudwatch_log_group" "this" {
  count = local.environment == "prod" ? 1 : 0
  name  = "${local.resource_name_prefix}-${local.client}-vpc-flow-logs"
}


# Resource defines an IAM policy document that allows the VPC flow logs service to assume the role created by the aws_iam_role resource.

# The resource creates an IAM policy document that allows the VPC flow logs service to send logs to CloudWatch.

data "aws_iam_policy_document" "assume_role" {
  count = local.environment == "prod" ? 1 : 0
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# Resource creates an IAM role that allows the VPC flow logs service to send logs to CloudWatch.



resource "aws_iam_role" "this" {
  count              = local.environment == "prod" ? 1 : 0
  name               = "${local.resource_name_prefix}-${local.client}-vpc-flow-logs"
  assume_role_policy = data.aws_iam_policy_document.assume_role[0].json
}


# The resource creates an IAM role policy attachment that attaches the IAM policy document to the IAM role.

# The aws_iam_role_policy resource attaches the policy document defined by the data "aws_iam_policy_document" "this" resource to the role created by XXX aws_iam_role resource.

data "aws_iam_policy_document" "this" {
  count = local.environment == "prod" ? 1 : 0
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}

# Resource creates an IAM role policy attachment that attaches the IAM policy document to the IAM role.

# The aws_iam_role_policy resource attaches the policy document defined by the data "aws_iam_policy_document" "this" resource to the role created by the aws_iam_role resource.

resource "aws_iam_role_policy" "this" {
  count  = local.environment == "prod" ? 1 : 0
  name   = "${local.resource_name_prefix}-${local.client}-vpc-flow-logs"
  role   = aws_iam_role.this[0].id
  policy = data.aws_iam_policy_document.this[0].json
}