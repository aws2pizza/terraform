#########################################################
# MODULE: NetworkAccessListRule
#########################################################

########### ingress

# ssh
module "NetworkAccessListRule_JumpBox_ipv4_ingress_ssh" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_JumpBox.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv4.trusted : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.ingress.allow.ssh : []
}
# ephemeral
module "NetworkAccessListRule_JumpBox_ipv4_ingress_ephemeral" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_JumpBox.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv4.all : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.ingress.allow.ephemeral : []
}
# all
module "NetworkAccessListRule_JumpBox_ipv4_ingress_all" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_JumpBox.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? [module.VirtualPrivateCloud.output[0].cidr_block] : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.ingress.allow.all : []
}

########### egress

# http
module "NetworkAccessListRule_JumpBox_ipv4_egress_http" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_JumpBox.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv4.all : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.egress.allow.http : []
}
# https
module "NetworkAccessListRule_JumpBox_ipv4_egress_https" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_JumpBox.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv4.all : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.egress.allow.https : []
}
# ehpemeral
module "NetworkAccessListRule_JumpBox_ipv4_egress_ephemeral" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_JumpBox.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv4.all : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.egress.allow.ephemeral : []
}
# all
module "NetworkAccessListRule_JumpBox_ipv4_egress_all" {
  source                = "./modules/NetworkAccessListRule/ipv4"
  network_acl_id        = length(local.VirtualPrivateCloud) != 0 ? module.NetworkAccessList_JumpBox.output[0].id : ""
  CidrBlocks            = length(local.VirtualPrivateCloud) != 0 ? [module.VirtualPrivateCloud.output[0].cidr_block] : []
  NetworkAccessListRule = length(local.VirtualPrivateCloud) != 0 ? var.NetworkAccessListRule.egress.allow.all : []
}
