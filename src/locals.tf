locals {

  env = terraform.workspace

  client          = "HealthCare"
  developer       = "Afzaal"
  deployment-repo = "https://github.com/afzaal0007/aws-gitops-infrastructure.git"

  region = {
    dev  = "ap-south-1"
    uat  = "us-east-1"
    prod = "us-east-1"
  }


  environments = {
    "dev"     = "dev"
    "uat"     = "uat"
    "prod"    = "prod"
    "default" = "dev"
  }


  environment = local.environments[terraform.workspace]



  vpc_domains = {
    dev     = "dev.${local.client}.theitoffshore.com"
    uat     = "uat.${local.client}.theitoffshore.com"
    prod    = "prod.${local.client}.theitoffshore.com"
    default = "dev.HealthCare.theitoffshore.com"
  }

  vpc-domain = lookup(local.vpc_domains, local.env, "default")



  theitoffshore_domains = {
    dev     = "develop.himalayas.theitoffshore.com"
    uat     = "uat.himalayas.theitoffshore.com"
    prod    = "prod.himalayas.theitoffshore.com"
    default = "develop.himalayas.theitoffshore.com"
  }
  theitoffshore-domain = lookup(local.theitoffshore_domains, local.env, "default")

  himalayas_domains = {
    dev     = "develop.himalayas.theitoffshore.com"
    uat     = "uat.himalayas.theitoffshore.com"
    prod    = "himalayas.com"
    default = "develop.himalayas.theitoffshore.com"
  }
  himalayas-domain = lookup(local.himalayas_domains, local.env, "default")

  vpc_cidr_blocks = {
    dev     = "10.20.0.0/20"
    uat     = "10.20.32.0/20"
    prod    = "10.20.48.0/20"
    default = "10.20.0.0/20"
  }
  vpc-cidr = lookup(local.vpc_cidr_blocks, local.env, "default")

  public_subnets = {
    dev = {
      "10.20.0.0/24" = { az = "a" }
      "10.20.1.0/24" = { az = "b" }
      "10.20.2.0/24" = { az = "c" }
    }
    uat = {
      "10.20.32.0/24" = { az = "a" }
      "10.20.33.0/24" = { az = "b" }
      "10.20.34.0/24" = { az = "c" }
    }
    prod = {
      "10.20.48.0/24" = { az = "a" }
      "10.20.49.0/24" = { az = "b" }
      "10.20.50.0/24" = { az = "c" }
    }

    default = {
      "10.20.0.0/24" = { az = "a" }
      "10.20.1.0/24" = { az = "b" }
      "10.20.2.0/24" = { az = "c" }
    }
  }
  public-subnets = lookup(local.public_subnets, local.env, "default")

  private_subnets = {
    dev = {
      "10.20.8.0/24"  = { az = "a" }
      "10.20.9.0/24"  = { az = "b" }
      "10.20.10.0/24" = { az = "c" }
    }
    uat = {
      "10.20.40.0/24" = { az = "a" }
      "10.20.41.0/24" = { az = "b" }
      "10.20.42.0/24" = { az = "c" }
    }
    prod = {
      "10.20.55.0/24" = { az = "a" }
      "10.20.56.0/24" = { az = "b" }
      "10.20.57.0/24" = { az = "c" }
    }
    default = {
      "10.20.8.0/24"  = { az = "a" }
      "10.20.9.0/24"  = { az = "b" }
      "10.20.10.0/24" = { az = "c" }
    }
  }
  private-subnets = lookup(local.private_subnets, local.env, "default")


  # AWS Secrets Manager Local  Variables

  # argocd-creds = jsondecode(data.aws_secretsmanager_secret_version.argocd-creds.secret_string)
  # gh-creds     = jsondecode(data.aws_secretsmanager_secret_version.gh-creds.secret_string)



  # # EKS Local Variables

  # eks_versions = {
  #   dev  = "1.25"
  #   uat  = "1.25"
  #   prod = "1.25"
  # }
  # eks-version = local.eks_versions[local.env]

  # eks_cluster_max_size = {
  #   dev  = 2
  #   uat  = 2
  #   prod = 2
  # }
  # eks-cluster-max-size = local.eks_cluster_max_size[local.env]

  # eks_cluster_min_size = {
  #   dev  = 2
  #   uat  = 2
  #   prod = 2
  # }
  # eks-cluster-min-size = local.eks_cluster_min_size[local.env]

  # spot_allocation_strategies = {
  #   dev  = "lowest-price"
  #   uat  = "lowest-price"
  #   prod = "lowest-price"
  # }
  # spot-allocation-strategy = local.spot_allocation_strategies[local.env]

  # on_demand_percentage = {
  #   dev  = 100
  #   uat  = 100
  #   prod = 100
  # }
  # on-demand-percentage = local.on_demand_percentage[local.env]

  # worker_instance_types = {
  #   dev = [
  #     { name = "t2.medium", weight = "1" },
  #     { name = "t2.medium", weight = "1" },
  #   ]
  #   uat = [
  #     { name = "t2.medium", weight = "1" },
  #     { name = "t2.medium", weight = "1" },
  #   ]
  #   prod = [
  #     { name = "t2.medium", weight = "1" },
  #     { name = "t2.medium", weight = "1" },
  #   ]
  # }
  # worker-instance-types = local.worker_instance_types[local.env]

  # worker_keypairs = {
  #   dev  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCbm3jg5eipXgqGmdoKB1neKrlweYE76j//lVG0H1vSmqRMVpAlt5eOFPY7zqUVPreD6NtKZY7hs7tVD99+LrbGX2kRK2VuTjO2Boc+K70jWsKBEMzLAkI09p2fD66qZ1ENswwOxelE+t5ASzTeY59oMKq9nBfNlZYW+SxsY7/XG7Pjrtn3b8Kr034ty4PgMNwABunuHrRzbovYBOXYnP0CBZbe680UBNzl/IEtW2SDRLDkM9p7vdX+dFMjhkt876ev98FQb02qFS1ASYTc6o+oqlQqxjkt+a3Uyo0rYU1r3cbetBD1rLl7d/euZgSUNVMCyRX35G5a5DlvMn8ZDVNtzKUq8O5qL1Xp4mmd+5867sAmzGXd1HPIdm19TDXjCpsMT0zaawXRJoTk3dSL0DPbnP+BfdrQWFIt2ecVCLvfZVlc+lduZUsJfrASHHlk0IGXwBXAGjpc7Qf3ZNZRrfZz2ctsXPr//28kMC7FI4/r1hvknqHftjll7ZVasyocpe0="
  #   uat  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8QcJ99th80j8CBh+9/Lihw6JKUFJDXKPPCv7/AqacQfbenmEvczMv5PTZswf93Rk6ECmL6CpoVVpcO7xO2fO3G+2t0w3xvxi/rvk/bJwYqayeieku5sI4Mtmq4rN6beAtiLZFnmBmPzcxCpus9qEEgTRSoBYPjfICGjKjTcGaGZsy8gs8n+U1JNrk5zjX3x6dvDBLGSjuJVxTDFS9JgB2kd63fwWRpwWDRIJVW1NpgdqVkG+4pDNdXOeAEe2iEzh/ibxd9qzrxvoBhLUlrLwesDjJKeyNKa6SK/WQGxpjCDRDTr8ni9DTcr0Gh5uw6KGDlT8rbrd1koKnKsNOmFV8KXbPadO/+hZ9hm1cyH/Zob4MaeGGDAcl+3zv9JZ1xLe0xuRmzlmV9Y5Ta2ItNphQeCfri1qDQ16gcDFDYQo6lZ+Kx5UyqwE+k5fAm/1lXAL7j9RbQs3V+g1plLAyKiOgAX/6pm84KKAQpyRg6p4/mAFEGk2hCUFl5eyoMR+Q89k="
  #   prod = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/4PMDnLZQRhJPamzZtCt9oErRki8fIy57mCLMyJLJoNS4k2dhdjwDSdnmWvLtzBEuL1vK8wVxN7fQxWFuBGwWdIpOIUEMjkZgxSWh091iJwVT/mTwX+finSS0QV8yOomWqXABz+ReKoH/jpHTEk9zNtbsIEmu2kh15qsUdQ6vZLEG4p/fQa36zrhnd5fBgDbh3ekckAeQQh8IdWL0XJCTKbUSDvXUk5TRYl5DZHWLYoqwmZWqdLpux3zKxPpHYtMkWsdw1JKwxsUU5vbwKQLb+H2G9x0aEHnzCAdWMdEUeThOeQihkjWKtk8ibaOdlB1a3gHi1LSkyp/tylQzMizM+/Vp4oXJe8WtlplJqfycMrg/EjgVO9hY/rG7egLWUxZYXj+ZyMUqYMimOZ/3kb/Mmvxu+no7OrbXMwlTuQvWTWM3YJe9yw/n2W35nfwnHyZSwgQKYSKb9IuXK7X5bB9ZqD8BHIOie4WE9b7NeXMKCNLKpfu07lln91oRMc4T8iM="
  # }


  #   worker-keypair = local.worker_keypairs[local.env]

  #   eks_worker_node_userdata = {
  #     dev  = <<USERDATA
  # #!/bin/bash
  # set -o xtrace
  # /etc/eks/bootstrap.sh --apiserver-endpoint '${module.eks.endpoint}' --b64-cluster-ca '${module.eks.certificate_authority[0].data}' '${module.eks.cluster_name}'
  # USERDATA
  #     uat  = <<USERDATA
  # #!/bin/bash
  # set -o xtrace
  # /etc/eks/bootstrap.sh --apiserver-endpoint '${module.eks.endpoint}' --b64-cluster-ca '${module.eks.certificate_authority[0].data}' '${module.eks.cluster_name}'
  # USERDATA
  #     prod = <<USERDATA
  # #!/bin/bash
  # set -o xtrace
  # /etc/eks/bootstrap.sh --apiserver-endpoint '${module.eks.endpoint}' --b64-cluster-ca '${module.eks.certificate_authority[0].data}' '${module.eks.cluster_name}'
  # USERDATA
  #   }


  # eks-worker-node-userdata = local.eks_worker_node_userdata[local.env]

  # rds_instance_types = {
  #   dev  = "db.t2.micro"
  #   uat  = "db.t2.micro"
  #   prod = "db.t2.micro"
  # }
  # rds-instance-type = local.rds_instance_types[local.env]

  # rds_instances_count = {
  #   dev  = "1"
  #   uat  = "1"
  #   prod = "1"
  # }
  # rds-cluster-size = local.rds_instances_count[local.env]

  # msk_disk_size = {
  #   dev  = 5
  #   uat  = 5
  #   prod = 5
  # }
  # msk-disk-size = local.msk_disk_size[local.env]

  # msk_broker_types = {
  #   dev  = "kafka.t3.small"
  #   uat  = "kafka.t3.small"
  #   prod = "kafka.t3.small"
  # }
  # msk-instance-type = local.msk_instance_types[local.env]

  # redis_instance_types = {
  #   dev  = "cache.t3.small"
  #   uat  = "cache.t3.small"
  #   prod = "cache.t3.small"
  # }
  # redis-instance-type = local.redis_instance_types[local.env]

  # AWS OpenSearch Cluster locals
  #   svc-opensearch-engine-version = "2.7"

  #   svc-opensearch-volume-throughput = 250
  #   svc-opensearch-volume-size       = 30

  #   svc-opensearch-data-instance-type    = "t3.medium.search"
  #   svc-opensearch-instance-count        = 3
  #   svc-opensearch-master-instance-type  = "t3.medium.search"
  #   svc-opensearch-master-instance-count = 3

  #   svc-jnj-web-host-himalayas-proxy-count = 1
}
