#########################################################
# MODULE: SecurityGroupRule
#########################################################

########### inress

# http
module "SecurityGroupRule_ApplicationLoadBalancer_ipv4_ingress_http" {
  source            = "./modules/SecurityGroupRule/cidr_blocks/ipv4"
  security_group_id = length(local.VirtualPrivateCloud) != 0 ? [for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "ApplicationLoadBalancer"][0] : ""
  CidrBlocks        = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv4.all : []
  SecurityGroupRule = length(local.VirtualPrivateCloud) != 0 ? var.SecurityGroupRule.ingress.http : []
}
# https
module "SecurityGroupRule_ApplicationLoadBalancer_ipv4_ingress_https" {
  source            = "./modules/SecurityGroupRule/cidr_blocks/ipv4"
  security_group_id = length(local.VirtualPrivateCloud) != 0 ? [for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "ApplicationLoadBalancer"][0] : ""
  CidrBlocks        = length(local.VirtualPrivateCloud) != 0 ? var.CidrBlocks.ipv4.all : []
  SecurityGroupRule = length(local.VirtualPrivateCloud) != 0 ? var.SecurityGroupRule.ingress.https : []
}

########### egress

# all
module "SecurityGroupRule_ApplicationLoadBalancer_ipv4_egress_all" {
  source            = "./modules/SecurityGroupRule/cidr_blocks/ipv4"
  security_group_id = length(local.VirtualPrivateCloud) != 0 ? [for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "ApplicationLoadBalancer"][0] : ""
  CidrBlocks        = length(local.VirtualPrivateCloud) != 0 ? [module.VirtualPrivateCloud.output[0].cidr_block] : []
  SecurityGroupRule = length(local.VirtualPrivateCloud) != 0 ? var.SecurityGroupRule.egress.all : []
}
