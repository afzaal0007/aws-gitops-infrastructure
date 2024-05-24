module "backend" {
  source     = "../modules/backend"
  project    = local.project
  env        = local.env
  aws_region = local.region[local.environment]
  # developer = local.developer
  # client    = local.client

  project_info = [
    local.env,
    local.developer,
    local.client,
  ]

}


