# terraform {
#   required_providers {
#     argocd = {
#       source  = "oboukili/argocd"
#       version = "5.1.0"
#     }
#   }
# }

# provider "helm" {
#   kubernetes {
#     host                   = module.eks.endpoint
#     cluster_ca_certificate = base64decode(module.eks.certificate_authority[0].data)
#     token                  = data.aws_eks_cluster_auth.medlify.token
#   }
# }

# provider "kubernetes" {
#   host                   = module.eks.endpoint
#   cluster_ca_certificate = base64decode(module.eks.certificate_authority[0].data)
#   token                  = data.aws_eks_cluster_auth.medlify.token
# }

# provider "argocd" {
#   server_addr = "argocd.medlify.com:443"
#   username    = local.argocd-creds.username
#   password    = local.argocd-creds.password
#   insecure    = false
# }
