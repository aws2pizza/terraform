#########################################################
# MODULE: LoadBalancer
#########################################################
locals {
  _checkLoadBalancer = length([for i in var.LoadBalancer : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.LoadBalancer : i if i.tags[1] == var.main_id] : []
}

module "LoadBalancer" {
  source          = "./modules/LoadBalancer"
  subnets         = length(local.VirtualPrivateCloud) != 0 ? local.SubnetIds_ApplicationLoadBalancer : []
  security_groups = length(local.VirtualPrivateCloud) != 0 ? [for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "ApplicationLoadBalancer"] : []
  LoadBalancer    = length(local.VirtualPrivateCloud) != 0 ? local._checkLoadBalancer : []
}
