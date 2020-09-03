#########################################################
# DATA: Route53Zone
#########################################################
data "aws_route53_zone" "Zone01" {
  name = format("%s.", var.Route53[0].name)
}


#########################################################
# MODULE: Route53Zone
#########################################################
# locals {
#   _checkRoute53Zone = length([for i in var.Route53 : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.Route53 : i if i.tags[1] == var.main_id] : []
# }

# module "Route53Zone01" {
#   source                 = "./modules/Route53Zone"
#   Route53                = length(local.VirtualPrivateCloud) != 0 ? [for x in local._checkRoute53Zone : x if x.name == "2pizza.name"] : []
# }

# module "Route53Zone02" {
#   source                 = "./modules/Route53Zone"
#   Route53                = length(local.VirtualPrivateCloud) != 0 ? [for x in local._checkRoute53Zone : x if x.name == "2pizza.name"] : []
# }

#########################################################
# MODULE: Route53Record
#########################################################
locals {
  _checkRoute53Record = length([for i in var.Route53 : i if i.main_id == var.main_id]) != 0 ? [for i in var.Route53 : i if i.main_id == var.main_id] : []
}

module "Route53Record01" {
  source = "./modules/Route53Record/alias"
  #zone_id                = length(local.VirtualPrivateCloud) != 0 ? module.Route53Zone01.output[0].zone_id : ""
  zone_id                = length(local.VirtualPrivateCloud) != 0 ? data.aws_route53_zone.Zone01.zone_id : ""
  load_balancer_dns_name = length(local.VirtualPrivateCloud) != 0 ? module.LoadBalancer.output[0].dns_name : ""
  load_balancer_zone_id  = length(local.VirtualPrivateCloud) != 0 ? module.LoadBalancer.output[0].zone_id : ""
  Route53Record          = length(local.VirtualPrivateCloud) != 0 ? [for x in local._checkRoute53Record : x if x.name == var.Route53[0].name] : []
}

