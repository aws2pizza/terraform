#########################################################
# PROVIDER: AmazonWebServices
#########################################################
provider "aws" {
  region  = var.region
  profile = var.profile
}
