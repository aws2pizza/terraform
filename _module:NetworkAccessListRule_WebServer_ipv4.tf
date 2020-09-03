#########################################################
# MODULE: NetworkAccessListRule
#########################################################

########### ingress

# http
module "NetworkAccessListRule_WebServer_ipv4_ingress_http" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_WebServer.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv4.all : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.ingress.allow.http : []
}
# all
module "NetworkAccessListRule_WebServer_ipv4_ingress_all" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_WebServer.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? [module.VirtualPrivateCloud.output[0].cidr_block] : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.ingress.allow.all : []
}

########### egress

# all
module "NetworkAccessListRule_WebServer_ipv4_egress_all" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_WebServer.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? [module.VirtualPrivateCloud.output[0].cidr_block] : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.egress.allow.all : []
}
