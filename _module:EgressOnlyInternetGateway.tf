#########################################################
# MODULE: EgressOnlyInternetGateway
#########################################################
locals {
  _checkEgressOnlyInternetGateway = length([for i in var.EgressOnlyInternetGateway : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.EgressOnlyInternetGateway : i if i.tags[1] == var.main_id] : []
}

module "EgressOnlyInternetGateway" {
  source                    = "./modules/EgressOnlyInternetGateway"
  vpc_id                    = length(local.VirtualPrivateCloud) != 0 ? local.vpc_id : ""
  EgressOnlyInternetGateway = length(local.VirtualPrivateCloud) != 0 ? local._checkEgressOnlyInternetGateway : []
}

locals {
  egress_only_internet_gateway_id = length(module.EgressOnlyInternetGateway.output) != 0 ? module.EgressOnlyInternetGateway.output[0].id : ""
}
