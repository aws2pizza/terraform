#########################################################
# MODULE: RouteTableAssociation
#########################################################
locals {
  SubnetIds_JumpBox                 = local.CountAvailabilityZones != 0 ? [for i in local.SubnetAll : i.id if i.tags._tag02_union == "JumpBox"] : []
  SubnetIds_ApplicationLoadBalancer = local.CountAvailabilityZones != 0 ? [for i in local.SubnetAll : i.id if i.tags._tag02_union == "ApplicationLoadBalancer"] : []
  SubnetIds_WebServer               = local.CountAvailabilityZones != 0 ? [for i in local.SubnetAll : i.id if i.tags._tag02_union == "WebServer"] : []
  SubnetIds_Database                = local.CountAvailabilityZones != 0 ? [for i in local.SubnetAll : i.id if i.tags._tag02_union == "Database"] : []
}

module "RouteTableAssociation_InternetGateway_JumpBox" {
  source         = "./modules/RouteTableAssociation"
  subnet_ids     = length(local.VirtualPrivateCloud) != 0 ? local.SubnetIds_JumpBox : []
  route_table_id = length(local.VirtualPrivateCloud) != 0 ? module.RouteTable_InternetGateway.output[0].id : ""
}
module "RouteTableAssociation_InternetGateway_ApplicationLoadBalancer" {
  source         = "./modules/RouteTableAssociation"
  subnet_ids     = length(local.VirtualPrivateCloud) != 0 ? local.SubnetIds_ApplicationLoadBalancer : []
  route_table_id = length(local.VirtualPrivateCloud) != 0 ? module.RouteTable_InternetGateway.output[0].id : ""
}
module "RouteTableAssociation_EgressOnlyInternetGateway_WebServer" {
  source         = "./modules/RouteTableAssociation"
  subnet_ids     = length(local.VirtualPrivateCloud) != 0 ? local.SubnetIds_WebServer : []
  route_table_id = length(local.VirtualPrivateCloud) != 0 ? module.RouteTable_EgressOnlyInternetGateway.output[0].id : ""
}
