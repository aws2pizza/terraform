#########################################################
# MODULE: TargetGroup
#########################################################
locals {
  _checkTargetGroup = length([for i in var.TargetGroup : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.TargetGroup : i if i.tags[1] == var.main_id] : []
}

module "TargetGroup_WebServer" {
  source      = "./modules/TargetGroup"
  vpc_id      = length(local.VirtualPrivateCloud) != 0 ? local.vpc_id : ""
  TargetGroup = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkTargetGroup : i if i.tags[2] == "WebServer"] : []
}
