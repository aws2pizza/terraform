#########################################################
# MODULE: SecurityGroupRule
#########################################################

########### ingress

# ssh
module "SecurityGroupRule_JumpBox_ipv4_ingress_ssh" {
  source            = "./modules/SecurityGroupRule/cidr_blocks/ipv4"
  security_group_id = length(local.VirtualPrivateCloud) != 0 ? [for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "JumpBox"][0] : ""
  CidrBlocks        = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv4.trusted : []
  SecurityGroupRule = length(local.VirtualPrivateCloud) != 0 ? var.SecurityGroupRule.ingress.ssh : []
}

########### egress

# http
module "SecurityGroupRule_JumpBox_ipv4_egress_http" {
  source            = "./modules/SecurityGroupRule/cidr_blocks/ipv4"
  security_group_id = length(local.VirtualPrivateCloud) != 0 ? [for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "JumpBox"][0] : ""
  CidrBlocks        = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv4.all : []
  SecurityGroupRule = length(local.VirtualPrivateCloud) != 0 ? var.SecurityGroupRule.egress.http : []
}
# https
module "SecurityGroupRule_JumpBox_ipv4_egress_https" {
  source            = "./modules/SecurityGroupRule/cidr_blocks/ipv4"
  security_group_id = length(local.VirtualPrivateCloud) != 0 ? [for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "JumpBox"][0] : ""
  CidrBlocks        = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv4.all : []
  SecurityGroupRule = length(local.VirtualPrivateCloud) != 0 ? var.SecurityGroupRule.egress.https : []
}
# all
module "SecurityGroupRule_JumpBox_ipv4_egress_all" {
  source            = "./modules/SecurityGroupRule/cidr_blocks/ipv4"
  security_group_id = length(local.VirtualPrivateCloud) != 0 ? [for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "JumpBox"][0] : ""
  CidrBlocks        = length(local.VirtualPrivateCloud) != 0 ? [module.VirtualPrivateCloud.output[0].cidr_block] : []
  SecurityGroupRule = length(local.VirtualPrivateCloud) != 0 ? var.SecurityGroupRule.egress.all : []
}
