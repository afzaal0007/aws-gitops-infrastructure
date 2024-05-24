# terraform {
#   backend "s3" {
#     bucket         = "s3-terraform-backend008"
#     key            = "state/terraform.tfstate"
#     region         = "ap-south-1"
#     dynamodb_table = "terraform-state"
#   }
# }

#  backend "s3" {
#     region = "us-east-1"
#     bucket = "banana"
#     key = "banana/terraform.tfstate"
#     profile = "my-profile"
#   }

terraform {
  # backend "local" {
  #   path = "terraform.tfstate"
  # }
}

# Dev Backend-S3

# terraform {
#   backend "s3" {
#     bucket         = "dev-muller-theitoffshore-iac-state"
#     key            = "state/terraform.tfstate"
#     region         = "ap-south-1"
#     dynamodb_table = "dev-muller-iac-state"
#     profile        = "default"
#     kms_key_id     = "352cc6d2-ac9c-4c33-b3d2-7539ce78e3e9"
#     encrypt        = true
#   }
# }

# UAT  Backend-S3

# terraform {
#   backend "s3" {
#     bucket         = "uat-muller-theitoffshore-iac-state"
#     key            = "state/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "uat-muller-iac-state"
#     encrypt        = true
#     profile        = "default"
#     kms_key_id     = "d5ae4574-ff00-49ac-ba31-d98f82dab855"
#   }
# }



# PROD  Backend-S3

# terraform {
#   backend "s3" {
#     bucket         = "prod-muller-theitoffshore-iac-state"
#     key            = "state/terraform.tfstate"
#     region         = "us-west-1"
#     dynamodb_table = "prod-muller-iac-state"
#     encrypt        = true
#     profile        = "default"
#     kms_key_id     = "d992c8fb-e4e3-4c1d-8786-97f44ef2e901"
#   }
# }


# terraform {
#   backend - {
#     if selected_workspace == "dev" {
#       # Backend configuration for dev workspace
#       bucket = "my-terraform-state-bucket"
#       key    = "dev/terraform.tfstate"
#     } else if selected_workspace == "prod" {
#       # Backend configuration for prod workspace
#       bucket = "my-terraform-state-bucket"
#       key    = "prod/terraform.tfstate"
#     } else {
#       # Handle other workspaces (optional)
#     }
#   }
# }

provider "aws" {
  # region = "ap-south-1"
  region = local.region[terraform.workspace]
}