#########################################################
# MODULE: InternetGateway
#########################################################
locals {
  _checkInternetGateway = length([for i in var.InternetGateway : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.InternetGateway : i if i.tags[1] == var.main_id] : []
}

module "InternetGateway" {
  source          = "./modules/InternetGateway"
  vpc_id          = length(local.VirtualPrivateCloud) != 0 ? local.vpc_id : ""
  InternetGateway = length(local.VirtualPrivateCloud) != 0 ? local._checkInternetGateway : []
}

locals {
  internet_gateway_id = length(module.InternetGateway.output) != 0 ? module.InternetGateway.output[0].id : ""
}
