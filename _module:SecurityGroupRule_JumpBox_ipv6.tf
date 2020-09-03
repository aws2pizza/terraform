#########################################################
# MODULE: SecurityGroupRule
#########################################################

########### egress

# http
module "SecurityGroupRule_JumpBox_ipv6_egress_http" {
  source            = "./modules/SecurityGroupRule/cidr_blocks/ipv6"
  security_group_id = length(local.VirtualPrivateCloud) != 0 ? [for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "JumpBox"][0] : ""
  CidrBlocks        = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv6.all : []
  SecurityGroupRule = length(local.VirtualPrivateCloud) != 0 ? var.SecurityGroupRule.egress.http : []
}
# https
module "SecurityGroupRule_JumpBox_ipv6_egress_https" {
  source            = "./modules/SecurityGroupRule/cidr_blocks/ipv6"
  security_group_id = length(local.VirtualPrivateCloud) != 0 ? [for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "JumpBox"][0] : ""
  CidrBlocks        = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv6.all : []
  SecurityGroupRule = length(local.VirtualPrivateCloud) != 0 ? var.SecurityGroupRule.egress.https : []
}
