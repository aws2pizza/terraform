#########################################################
# MODULE: SecurityGroup
#########################################################
locals {
  _checkSecurityGroup = length([for i in var.SecurityGroup : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.SecurityGroup : i if i.tags[1] == var.main_id] : []
}

module "SecurityGroup" {
  source        = "./modules/SecurityGroup"
  vpc_id        = length(local.VirtualPrivateCloud) != 0 ? local.vpc_id : ""
  SecurityGroup = length(local.VirtualPrivateCloud) != 0 ? local._checkSecurityGroup : []
}
