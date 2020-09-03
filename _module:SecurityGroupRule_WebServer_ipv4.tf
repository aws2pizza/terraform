#########################################################
# MODULE: SecurityGroupRule
#########################################################

########### ingress

# http
module "SecurityGroupRule_WebServer_ipv4_ingress_http" {
  source                = "./modules/SecurityGroupRule/source_security_group_id"
  security_group_id     = length(local.VirtualPrivateCloud) != 0 ? [for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "WebServer"][0] : ""
  SourceSecurityGroupId = length(local.VirtualPrivateCloud) != 0 ? [for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "ApplicationLoadBalancer"][0] : ""
  SecurityGroupRule     = length(local.VirtualPrivateCloud) != 0 ? var.SecurityGroupRule.ingress.http : []
}
# all
module "SecurityGroupRule_WebServer_ipv4_ingress_all" {
  source                = "./modules/SecurityGroupRule/source_security_group_id"
  security_group_id     = length(local.VirtualPrivateCloud) != 0 ? [for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "WebServer"][0] : ""
  SourceSecurityGroupId = length(local.VirtualPrivateCloud) != 0 ? [for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "JumpBox"][0] : ""
  SecurityGroupRule     = length(local.VirtualPrivateCloud) != 0 ? var.SecurityGroupRule.ingress.all : []
}
