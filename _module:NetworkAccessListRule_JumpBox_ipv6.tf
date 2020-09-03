#########################################################
# MODULE: NetworkAccessListRule
#########################################################

########### ingress

# ephemeral
module "NetworkAccessListRule_JumpBox_ipv6_ingress_ephemeral" {
  source                = "./modules/NetworkAccessListRule/ipv6"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_JumpBox.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv6.all : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.ingress.allow.ephemeral : []
}

########### egress

# http
module "NetworkAccessListRule_JumpBox_ipv6_egress_http" {
  source                = "./modules/NetworkAccessListRule/ipv6"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_JumpBox.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv6.all : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.egress.allow.http : []
}
# https
module "NetworkAccessListRule_JumpBox_ipv6_egress_https" {
  source                = "./modules/NetworkAccessListRule/ipv6"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_JumpBox.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv6.all : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.egress.allow.https : []
}
# ephemeral
module "NetworkAccessListRule_JumpBox_ipv6_egress_ephemeral" {
  source                = "./modules/NetworkAccessListRule/ipv6"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_JumpBox.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv6.all : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.egress.allow.ephemeral : []
}
