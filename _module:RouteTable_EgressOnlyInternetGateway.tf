########################################################
# MODULE: RouteTable_EgressOnlyInternetGateway
########################################################
locals {
  _checkRouteTable_EgressOnlyInternetGateway = length([for i in var.RouteTable_EgressOnlyInternetGateway : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.RouteTable_EgressOnlyInternetGateway : i if i.tags[1] == var.main_id] : []
}

module "RouteTable_EgressOnlyInternetGateway" {
  source                          = "./modules/RouteTable/EgressOnlyInternetGateway"
  vpc_id                          = length(local.VirtualPrivateCloud) != 0 ? local.vpc_id : ""
  egress_only_internet_gateway_id = length(local.VirtualPrivateCloud) != 0 ? local.egress_only_internet_gateway_id : ""
  RouteTable                      = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkRouteTable_EgressOnlyInternetGateway : i if i.tags[2] == "EgressOnlyInternetGateway"] : []
}
