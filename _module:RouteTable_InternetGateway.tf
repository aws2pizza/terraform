#########################################################
# MODULE: RouteTable_InternetGateway
#########################################################
locals {
  _checkRouteTable_InternetGateway = length([for i in var.RouteTable_InternetGateway : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.RouteTable_InternetGateway : i if i.tags[1] == var.main_id] : []
}

module "RouteTable_InternetGateway" {
  source              = "./modules/RouteTable/InternetGateway"
  vpc_id              = length(local.VirtualPrivateCloud) != 0 ? local.vpc_id : ""
  internet_gateway_id = length(local.VirtualPrivateCloud) != 0 ? local.internet_gateway_id : ""
  RouteTable          = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkRouteTable_InternetGateway : i if i.tags[2] == "InternetGateway"] : []
}
