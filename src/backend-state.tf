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
  backend "local" {
    path = "terraform.tfstate"
  }
}
