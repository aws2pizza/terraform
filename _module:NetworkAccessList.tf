#########################################################
# MODULE: NetworkAccessList
#########################################################
locals {
  _checkNetworkAccessList = length([for i in var.NetworkAccessList : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.NetworkAccessList : i if i.tags[1] == var.main_id] : []
}

module "NetworkAccessList_JumpBox" {
  source            = "./modules/NetworkAccessList"
  vpc_id            = length(local.VirtualPrivateCloud) != 0 ? local.vpc_id : ""
  subnet_ids        = length(local.VirtualPrivateCloud) != 0 ? [for i in local.SubnetAll : i.id if i.tags._tag02_union == "JumpBox"] : []
  NetworkAccessList = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkNetworkAccessList : i if i.tags[2] == "JumpBox"] : []
}
module "NetworkAccessList_ApplicationLoadBalancer" {
  source            = "./modules/NetworkAccessList"
  vpc_id            = length(local.VirtualPrivateCloud) != 0 ? local.vpc_id : ""
  subnet_ids        = length(local.VirtualPrivateCloud) != 0 ? [for i in local.SubnetAll : i.id if i.tags._tag02_union == "ApplicationLoadBalancer"] : []
  NetworkAccessList = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkNetworkAccessList : i if i.tags[2] == "ApplicationLoadBalancer"] : []
}
module "NetworkAccessList_WebServer" {
  source            = "./modules/NetworkAccessList"
  vpc_id            = length(local.VirtualPrivateCloud) != 0 ? local.vpc_id : ""
  subnet_ids        = length(local.VirtualPrivateCloud) != 0 ? [for i in local.SubnetAll : i.id if i.tags._tag02_union == "WebServer"] : []
  NetworkAccessList = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkNetworkAccessList : i if i.tags[2] == "WebServer"] : []
}
module "NetworkAccessList_Database" {
  source            = "./modules/NetworkAccessList"
  vpc_id            = length(local.VirtualPrivateCloud) != 0 ? local.vpc_id : ""
  subnet_ids        = length(local.VirtualPrivateCloud) != 0 ? [for i in local.SubnetAll : i.id if i.tags._tag02_union == "Database"] : []
  NetworkAccessList = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkNetworkAccessList : i if i.tags[2] == "Database"] : []
}
