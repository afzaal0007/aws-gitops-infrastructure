module "vpc" {
  source = "../modules/vpc"

  vpc_cidr_block  = local.vpc-cidr
  domain_name     = local.vpc-domain
  public_subnets  = local.public-subnets
  private_subnets = local.private-subnets

  project_info = [
    local.env,
    local.developer,
    local.client,
  ]
}

# Set entire regions ebs to encrypted by default
resource "aws_ebs_encryption_by_default" "default_encryption" {
  count   = local.env == "prod" ? 1 : 0
  enabled = true
}

# resource "aws_vpc_endpoint" "guardduty" {
#   count               = local.env == "prod" ? 1 : 0
#   vpc_id              = module.vpc.vpc_id
#   service_name        = "com.amazonaws.${data.aws_region.current.id}.guardduty-data"
#   vpc_endpoint_type   = "Interface"
#   private_dns_enabled = true
#   security_group_ids  = [module.eks.worker_node_sg]
#   subnet_ids          = module.vpc.private_subnet_ids
# }