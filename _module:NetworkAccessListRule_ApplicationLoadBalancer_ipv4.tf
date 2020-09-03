#########################################################
# MODULE: NetworkAccessListRule
#########################################################

########### ingress

# http
module "NetworkAccessListRule_ApplicationLoadBalancer_ipv4_ingress_http" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_ApplicationLoadBalancer.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv4.all : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.ingress.allow.http : []
}
# https
module "NetworkAccessListRule_ApplicationLoadBalancer_ipv4_ingress_https" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_ApplicationLoadBalancer.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv4.all : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.ingress.allow.https : []
}
# all
module "NetworkAccessListRule_ApplicationLoadBalancer_ipv4_ingress_all" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_ApplicationLoadBalancer.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? [module.VirtualPrivateCloud.output[0].cidr_block] : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.ingress.allow.all : []
}

########### egress

# ephemeral
module "NetworkAccessListRule_ApplicationLoadBalancer_ipv4_egress_ephemeral" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_ApplicationLoadBalancer.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv4.all : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.egress.allow.ephemeral : []
}
# all
module "NetworkAccessListRule_ApplicationLoadBalancer_ipv4_egress_all" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_ApplicationLoadBalancer.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? [module.VirtualPrivateCloud.output[0].cidr_block] : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.egress.allow.all : []
}
